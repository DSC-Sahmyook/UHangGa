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
from .models import PostedDogs


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


#posteddog listview
class PostView(viewsets.ModelViewSet):
    queryset = PostedDogs.objects.all()
    serializer_class = PostSerializer


# ---------------------------------------------
# 메인페이지
@api_view(['GET'])
def main(request):
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
    adoptRate = (totalDogs-waitDogs) / totalDogs * 100

    # 리스트(이름, 나이, 사진)
    dogList = mo.Dogs.objects.filter(isadopted=False)
    dogList_se = se.MainDogsList_Serializer(data=dogList, many=True)

    data = {
        'partnerType': partnerType,
        'userName': nowUser.user.username,
        'userPhoto': nowUser.photourl,
        'waitDogs': waitDogs,
        'adoptRate': adoptRate,
        'dogsList': dogList_se,
    }
    main_se = se.MainPageSerializer(data=data)
    if main_se.is_valid():
        # main_se.save()
        return Response(main_se.data, status=status.HTTP_200_OK)
    return Response(main_se.errors, status=status.HTTP_400_BAD_REQUEST)