from django.contrib.auth import authenticate
from rest_framework import serializers

from . import models as mo
from .models import PostedDogs
from .models import Characters
from .models import Dogs
from .models import Profile
from .models import Dogsphotos


# 회원가입
class SignUp_Serializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()
    email = serializers.CharField()
    first_name= serializers.CharField()
    last_name = serializers.CharField()
    phonenum = serializers.CharField()
    address = serializers.CharField()
    photourl = serializers.CharField()
    characterid = serializers.IntegerField()

    def create(self, validated_data):
        user = mo.User.objects.create_user(
            username=validated_data["username"],
            password=validated_data["password"],
            first_name=validated_data["first_name"],
            last_name=validated_data["last_name"],
            email=validated_data["email"],
        )
        profile = mo.Profile(
            user=user,
            phonenum=validated_data["phonenum"],
            address=validated_data["address"],
            photourl=validated_data["photourl"],
            characterid=mo.Characters.objects.get(id=validated_data["characterid"]),
        )

        user.save()
        profile.save()

        return user


# 로그인
class SignIn_Serializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()

    def validate(self, data):
        user = authenticate(**data)
        if user and user.is_active:
            return user
        raise serializers.ValidationError("Unable to sign in with provided credentials.")


# characters
class CharactersSerializer(serializers.ModelSerializer):

    class Meta:
        model = Characters
        fields = '__all__'

# Profile
class ProfileSerializer(serializers.ModelSerializer):

    class Meta:
        model = Profile
        fields = '__all__'

# 
class DogsphotosSerializer(serializers.ModelSerializer):

    class Meta:
        model = Dogsphotos
        fields = '__all__'
    
# Dogs
class DogsSerializer(serializers.ModelSerializer):

    # photoid = DogsphotosSerializer(many=True)

    class Meta:
        model = Dogs
        fields = '__all__'


# posted Dogs
class PostSerializer(serializers.ModelSerializer):
    #Nested Serializer 이용한 다른 모델 참조
    dogid = DogsSerializer()
    userid = ProfileSerializer()
    dogCharacter = CharactersSerializer()
    # class Meta:
    #     model = PostedDogs
    #     fields = '__all__'
    #     read_only_fields = ('date',)
    class Meta:
        model = PostedDogs
        fields = '__all__'


# ---------------------------------------------
# 메인페이지
class MainDogsList_Serializer(serializers.ModelSerializer):
    photoUrl = serializers.SerializerMethodField()

    def get_photoUrl(self, obj):
        try:
            return mo.Dogsphotos.objects.filter(num=obj.photoid)[0].url
        except Exception:
            return ''

    class Meta:
        model = mo.Dogs
        fields = (
            'id',
            'name',
            'age',
            'photoUrl'
        )


class MainPageSerializer(serializers.Serializer):
    partnerType_name = serializers.CharField()
    partnerType_img_url = serializers.CharField()
    userName = serializers.CharField()
    userPhoto = serializers.CharField()
    waitDogs = serializers.IntegerField()
    adoptRate = serializers.IntegerField()


# ---------------------------------------------
# mbti 테스트 결과 페이지
class TestMBTI(serializers.ModelSerializer):
    partner_type = serializers.SerializerMethodField()

    def get_partner_type(self, obj):
        return obj.partner.character

    class Meta:
        model = mo.Characters
        fields = ('id', 'character', 'url', 'partner_type')


# ---------------------------------------------
# POST용 시리얼라이저
class SanPostSerializer(serializers.ModelSerializer):
    class Meta:
        model = PostedDogs
        fields = '__all__'


# DetailPage Serializer
class SanDetailSerializer(serializers.Serializer):
    photolist = serializers.ListField()
    dog_name = serializers.CharField()
    date = serializers.DateTimeField()
    isadopted = serializers.BooleanField()
    breed = serializers.CharField()
    gender = serializers.CharField()
    age = serializers.IntegerField()
    vaccination = serializers.CharField()
    fee = serializers.IntegerField()
    area = serializers.CharField()
    dogCharacter_id = serializers.IntegerField()
    dogCharacter_name = serializers.CharField()
    writer_photo = serializers.URLField()
    writer_name = serializers.CharField()
    writer_phonenum = serializers.CharField()
    uniqueness = serializers.CharField()
