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
from .models import PostedDogs
from .models import Characters
from .models import Dogs
from .models import Profile

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
                return Response('이미 등록된 이메일입니다.', status=status.HTTP_400_BAD_REQUEST)
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
class CharactersView(viewsets.ModelViewSet):
    queryset = Dogs.objects.all()
    serializer_class = DogsSerializer

#Profile
class ProfileView(viewsets.ModelViewSet):
    queryset = Profile.objects.all()
    serializer_class = ProfileSerializer

#Posteddog detail 
class PostView(viewsets.ModelViewSet):
    queryset = PostedDogs.objects.all()
    serializer_class = PostSerializer

#Posted List
@api_view(['GET','POST'])
def posteddogslist(request):
    if request.method == 'GET':
        queryset = PostedDogs.objects.all()
        serializer = PostSerializer(queryset, many=True)
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
        partnerType = 'None'
    else:
        # 로그인한 경우
        partnerType = mo.Profile.objects.get(user=request.user).characterid.partner

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
        'partnerType': partnerType,
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
    dogList = mo.Dogs.objects.filter(isadopted=False).order_by('-id')[:5]
    dogList_se = se.MainDogsList_Serializer(dogList, many=True)
    if dogList_se:
        return Response(dogList_se.data, status=status.HTTP_200_OK)
    return Response(dogList_se.errors, status=status.HTTP_400_BAD_REQUEST)


# ---------------------------------------------
# mbti 테스트 결과 페이지
@api_view(['POST'])
def resultOfMBTI(request):
    result = getMBTI.getMBTI(request.data['answer'], request.data['isperson']).__str__()
    print(result)
    result_obj = mo.Characters.objects.get(character=result)
    result_se = se.TestMBTI(result_obj)

    return Response(result_se.data, status=status.HTTP_200_OK)