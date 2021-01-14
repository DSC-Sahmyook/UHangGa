from django.contrib.auth import authenticate
from rest_framework import serializers

from . import models as mo


# 회원가입
class SignUp_Serializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()
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
        )
        profile = mo.Profile(
            user=user,
            phonenum=validated_data["phonenum"],
            address=validated_data["address"],
            photourl=validated_data["photourl"],
            characterid=mo.Characters.objects.get(id=validated_data["characterid"])
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