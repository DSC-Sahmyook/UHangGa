import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

final String address = 'https://dsc-uhg-306513.du.r.appspot.com'; // 주소 받아오는 곳

Future<MainPost> fetchMainPost() async {
  final response = await http.get('{address}/api/posts');
  if (response.statusCode == 200) {
    final jsonBody = jsonDecode(utf8.decode(response.bodyBytes));
    return MainPost.fromJson(jsonBody);
  } else {
    throw Exception('Something went wrong...');
  }
}

class MainPost {
  final String partnerType;
  final String userName;
  final String userPhoto;
  final int waitDogs;
  final int adoptRate;

  MainPost(
      {this.partnerType,
      this.userName,
      this.userPhoto,
      this.waitDogs,
      this.adoptRate});

  factory MainPost.fromJson(Map<String, dynamic> json) {
    return MainPost(
      partnerType: json['partnerType'],
      userName: json['userName'],
      userPhoto: json['userphoto'],
      waitDogs: json['waitDogs'],
      adoptRate: json['adoptRate'],
    );
  }
} // 메인페이지 통신

Future<SignUpPost> fetchSignUpPost() async {
  final response = await http.get('{address}/api/app/auth/signup/');
  if (response.statusCode == 200) {
    final jsonBody = jsonDecode(utf8.decode(response.bodyBytes));
    return SignUpPost.fromJson(jsonBody);
  } else {
    throw Exception('Something went wrong...');
  }
}

class SignUpPost {
  final String username;
  final String password;
  final String first_name;
  final String last_name;
  final String phonenum;
  final String address;
  final String photourl;
  final int characterid;

  SignUpPost(
      {this.username,
      this.password,
      this.first_name,
      this.last_name,
      this.phonenum,
      this.address,
      this.photourl,
      this.characterid});

  factory SignUpPost.fromJson(Map<String, dynamic> json) {
    return SignUpPost(
      username: json['username'],
      password: json['password'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      phonenum: json['phonenum'],
      address: json['address'],
      photourl: json['photourl'],
      characterid: json['characterid'],
    );
  }
} // 회원가입 통신

Future<SignInPost> fetchSignInPost() async {
  final response = await http.get('{address}/api/app/auth/signin/');
  if (response.statusCode == 200) {
    final jsonBody = jsonDecode(utf8.decode(response.bodyBytes));
    return SignInPost.fromJson(jsonBody);
  } else {
    throw Exception('Something went wrong...');
  }
}

class SignInPost {
  final String username;
  final String password;

  SignInPost({this.username, this.password});

  factory SignInPost.fromJson(Map<String, dynamic> json) {
    return SignInPost(username: json['username'], password: json['password']);
  }
} // 로그인 통신

Future<SignInPost> fetchMBTIPosts() async {
  final response = await http.post('{address}/api/mbti/result/');
  if (response.statusCode == 200) {
    final jsonBody = jsonDecode(utf8.decode(response.bodyBytes));
    return SignInPost.fromJson(jsonBody);
  } else {
    throw Exception('Something went wrong...');
  }
}

class MBTIPost {
  final String answer;
  final bool isperson;

  MBTIPost({this.answer, this.isperson});

  factory MBTIPost.fromJson(Map<String, dynamic> json) {
    return MBTIPost(answer: json['answer'], isperson: json['isperson']);
  }
} // MBTI 통신

class JsonPlaceholder {
  static Future<List<MainPost>> getMainPosts() async {
    try {
      final http.Response response = await http.get('{address}/api/posts');

      final responseBody = json.decode(response.body);

      final List<MainPost> posts = responseBody
          .map<MainPost>((json) => MainPost.fromJson(json))
          .toList();

      return posts;
    } catch (err) {
      print(err);
      throw err;
    }
  }
}

class JsonPlaceholder2 {
  static Future<List<SignUpPost>> getSignUpPosts() async {
    try {
      final http.Response response =
          await http.get('{address}/api/app/auth/signup/');

      final responseBody = json.decode(response.body);

      final List<SignUpPost> posts = responseBody
          .map<SignUpPost>((json) => SignUpPost.fromJson(json))
          .toList();

      return posts;
    } catch (err) {
      print(err);
      throw err;
    }
  }
}

class JsonPlaceholder3 {
  static Future<List<SignInPost>> getSignInPosts() async {
    try {
      final http.Response response =
          await http.get('{address}/api/app/auth/signin/');

      final responseBody = json.decode(response.body);

      final List<SignInPost> posts = responseBody
          .map<SignInPost>((json) => SignInPost.fromJson(json))
          .toList();

      return posts;
    } catch (err) {
      print(err);
      throw err;
    }
  }
}

class JsonPlaceholder4 {
  static Future<List<MBTIPost>> getMBTIPosts() async {
    try {
      final http.Response response =
          await http.get('{address}/api/mbti/result/');

      final responseBody = json.decode(response.body);

      final List<MBTIPost> posts = responseBody
          .map<MBTIPost>((json) => MBTIPost.fromJson(json))
          .toList();

      return posts;
    } catch (err) {
      print(err);
      throw err;
    }
  }
}
