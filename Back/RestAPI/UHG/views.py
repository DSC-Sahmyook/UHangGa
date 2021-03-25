from rest_framework import generics, status, viewsets, permissions
from rest_framework.response import Response
from rest_framework.parsers import FileUploadParser
from rest_framework.views import APIView
from rest_framework.decorators import api_view
from rest_framework import mixins
from rest_framework.authtoken.models import Token
from rest_framework import viewsets
from rest_framework import permissions

# 시리얼라이저
from . import serializers as se
from . import models as mo
from .serializers import PostSerializer
from .serializers import CharactersSerializer
from .serializers import DogsSerializer
from .serializers import ProfileSerializer
from .serializers import DogsphotosSerializer
from .models import PostedDogs
from .models import Characters
from .models import Dogs
from .models import Profile
from .models import Dogsphotos

# mbti 테스트
from .getMBTI import getMBTI as getMBTI


# 회원가입
@api_view(['POST'])
def signup(request):
    if request.method == 'POST':
        if len(request.data["password"]) < 4:
            body = {"message": "비밀번호 길이가 너무 짧습니다."}
            return Response(body, status=status.HTTP_400_BAD_REQUEST)
        try:
            if mo.Profile.objects.get(phonenum=request.data['phonenum']):
                return Response('이미 등록된 전화번호입니다.', status=status.HTTP_400_BAD_REQUEST)
            if mo.User.objects.get(username=request.data['username']):
                return Response('이미 등록된 아이디입니다.', status=status.HTTP_400_BAD_REQUEST)
        except Exception:
            pass

        serializer = se.SignUp_Serializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            token = Token.objects.create(user=user)
            return Response(
                {
                    "token": token.key
                },
                status=status.HTTP_201_CREATED
            )
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# 로그인
@api_view(['POST'])
def signin(request):
    if request.method == 'POST':
        serializer = se.SignIn_Serializer(data=request.data)
        if serializer.is_valid():
            user = serializer.validated_data

            # 이미 토큰이 있는 경우
            try:
                token = Token.objects.create(user=user)
            except Exception:
                Token.objects.get(user=user).delete()
                token = Token.objects.create(user=user)

            return Response(
                {
                    "token": token.key
                },
                status=status.HTTP_200_OK
            )
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# 로그아웃
@api_view(['DELETE'])
def logout(request):
    if request.method == 'DELETE':
        # 사용자 id 확인
        if request.user.id != None:
            # 토큰 삭제
            Token.objects.get(user_id=request.user.id).delete()
            return Response(status=status.HTTP_200_OK)
        return Response(status=status.HTTP_400_BAD_REQUEST)

#Characters 
class CharactersView(viewsets.ModelViewSet):
    queryset = Characters.objects.all()
    serializer_class = CharactersSerializer

#Dogs
class DogsView(viewsets.ModelViewSet):
    queryset = Dogs.objects.all()
    serializer_class = DogsSerializer

#Profile
class ProfileView(viewsets.ModelViewSet):
    queryset = Profile.objects.all()
    serializer_class = ProfileSerializer

#Dogsphotos
class DogsphotosView(viewsets.ModelViewSet):
    queryset = Dogsphotos.objects.all()
    serializer_class = DogsphotosSerializer

#Posteddog detail 
class PostView(viewsets.ModelViewSet):
    queryset = PostedDogs.objects.all()
    serializer_class = PostSerializer


# Post Dog
@api_view(['POST'])
def post_dogs(request):
    if request.user.id == None:
        return Response(status=status.HTTP_401_UNAUTHORIZED)

    # 강아지 기본정보 등록하고 object 얻기
    dog_instance = mo.Dogs(
        name=request.data['name'],
        dogtype=request.data['dogtype'],
        age=request.data['age'],
        uniqueness=request.data['uniquness'],
        area=request.data['area'],
        gender=request.data['gender']
    )
    dog_instance.save()

    # Photo 모델에 저장하고 num값 알아내기
    photos = request.data['photo'][1:-1].split(',')
    if photos[0] != '':
        for _ in photos:
            photo_instance = mo.Dogsphotos(url=_, num=dog_instance.id)
            photo_instance.save()

    # Dog photo id 수정
    dog_instance.photoid = dog_instance.id
    dog_instance.save()

    # 엑조디아하기
    postdog_data = {
        'dogid': dog_instance.id,
        'dogCharacter': request.data['dogCharacter'],
        'userid': request.user.id,
        'vaccination': request.data['vaccination'],
        'fee': request.data['fee']
    }

    postSerializer = se.SanPostSerializer(data=postdog_data)
    if postSerializer.is_valid():
        postSerializer.save()
        return Response(postSerializer.data, status=status.HTTP_200_OK)
    return Response(postSerializer.errors, status=status.HTTP_400_BAD_REQUEST)


#Posted List
@api_view(['GET','POST'])
def posteddogslist(request, gender, breed):
    if request.method == 'GET':

        if request.data['gender'] == 0 and request.data['breed'] == 'None':
            posted_dogs = mo.PostedDogs.objects.all()
            serializer = PostSerializer(posted_dogs, many=True)
            return Response(serializer.data)
        elif request.data['gender'] == 0:
            posted_dogs = mo.Dogs.object.filter(dogtype=breed)
            PostSerializer(posted_dogs, many=True)
            return Response(serializer.data)
        elif request.data['breed'] == 'None':
            gender = gender - 1
            posted_dogs = mo.Dogs.objects.filter(gender=gender)
            PostSerializer(posted_dogs, many=True)
            return Response(serializer.data)
        elif request.data['gender'] != 0 and request.data['dogtype']:
            posted_dogs = mo.Dogs.objects.filter(gender=gender, dogtype=breed).order_by('-id')
            serializer = PostSerializer(posted_dogs, many=True)
            return Response(serializer.data)


    elif request.method == 'POST':
        serializer = PostSerializer(data=request.data)
        isAnony = True
        if request.user != None:
            isAnony = False

            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# ---------------------------------------------
# 메인페이지
@api_view(['GET'])
def main_data(request):
    isAnony = True
    if request.user.id != None:
        isAnony = False

    # 어울리는 타입
    if isAnony:
        # 로그인 안한 경우
        partnerType_name = 'None'
        partnerType_img_url = 'None'
    else:
        # 로그인한 경우
        partner = mo.Profile.objects.get(user=request.user).characterid.partner
        partnerType_name = partner.character
        partnerType_img_url = partner.url

    # 사용자 이름, 사진
    if isAnony:
        # 로그인 안한 경우
        nowUser = mo.Profile.objects.get(phonenum=100) # null 유저 정보
    else:
        # 로그인한 경우
        nowUser = mo.Profile.objects.get(user=request.user)

    # 등록견수, 입양륭
    waitDogs = mo.Dogs.objects.filter(isadopted=False).count()
    totalDogs = mo.Dogs.objects.count()
    adoptRate = int((totalDogs-waitDogs) / totalDogs * 100)

    data = {
        'partnerType_name': partnerType_name,
        'partnerType_img_url': partnerType_img_url,
        'userName': nowUser.user.username,
        'userPhoto': nowUser.photourl,
        'waitDogs': waitDogs,
        'adoptRate': adoptRate,
    }
    main_se = se.MainPageSerializer(data=data)
    if main_se.is_valid():
        return Response(main_se.data, status=status.HTTP_200_OK)
    return Response(main_se.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def main_list(request):
    # 리스트(이름, 나이, 사진)
    dogList = mo.Dogs.objects.filter(isadopted=False).order_by('-id')[:6]
    dogList_se = se.MainDogsList_Serializer(dogList, many=True)
    if dogList_se:
        return Response(dogList_se.data, status=status.HTTP_200_OK)
    return Response(dogList_se.errors, status=status.HTTP_400_BAD_REQUEST)


# ---------------------------------------------
# mbti 테스트 결과 페이지
@api_view(['POST'])
def resultOfMBTI(request):
    print(request.data)

    if request.data['isPerson'] == "true":
        result = getMBTI.getMBTI(request.data['answer'], True).__str__()
        result_obj = mo.Characters.objects.get(character=result)
        result_se = se.TestMBTI(result_obj)

        # 요청한 사람의 mbti 수정하기
        profile = mo.Profile.objects.get(user=request.user.id)
        profile.characterid = result_obj
        profile.save()

        return Response(result_se.data, status=status.HTTP_200_OK)
    else:
        result = getMBTI.getMBTI(request.data['answer'], False).__str__()
        result_obj = mo.Characters.objects.get(character=result)
        result_se = se.TestMBTI(result_obj)

        return Response(result_se.data, status=status.HTTP_200_OK)

# ---------------------------------------------
# 디테일 페이지
@api_view(["GET"])
def getDetail(request, id):
    # 도그, 포스티드도그, 프로필, 유저, 캐릭터
    myPostedDog = mo.PostedDogs.objects.get(id=id)
    myDog = myPostedDog.dogid
    myProfile = myPostedDog.userid
    myUser = myProfile.user
    myCharacter = myPostedDog.dogCharacter

    data = {
        'photolist': [i.url for i in mo.Dogsphotos.objects.filter(num=myDog.photoid)],
        'dog_name': myDog.name,
        'date': myPostedDog.date,
        'isadopted': myDog.isadopted,
        'breed': myDog.dogtype,
        'gender': "female" if myDog.gender else "male",
        'age': myDog.age,
        'vaccination': "Yes" if myPostedDog.vaccination else "No",
        'fee': myPostedDog.fee,
        'area': myProfile.address,
        'dogCharacter_id': myCharacter.id,
        'dogCharacter_name': myCharacter.character,
        'writer_photo': myProfile.photourl,
        'writer_name': myUser.username,
        'writer_phonenum': myProfile.phonenum,
        'uniqueness': myDog.uniqueness,
    }

    detail_se = se.SanDetailSerializer(data=data)
    if detail_se.is_valid():
        return Response(detail_se.data, status=status.HTTP_200_OK)
    return Response(detail_se.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(["GET"])
def getMbtiDetail(request, mbtiName):
    try:
        requestMbti = mo.Characters.objects.get(character=mbtiName)
        requestMbti_se = se.TestMBTI(requestMbti)
        return Response(requestMbti_se.data, status=status.HTTP_200_OK)
    except Exception as e:
        return Response(e, status=status.HTTP_400_BAD_REQUEST)
