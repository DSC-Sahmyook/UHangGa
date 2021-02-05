import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

final String address = ''; // 주소 받아오는 곳

Future<Post> fetchPost() async {
  final response = await http.get(address);
  if (response.statusCode == 200) {
    final jsonBody = jsonDecode(utf8.decode(response.bodyBytes));
    return Post.fromJson(jsonBody);
  } else {
    throw Exception('Something went wrong...');
  }
}

class Post {
  final String partnerType;
  final String userName;
  final String userPhoto;
  final int waitDogs;
  final int adoptRate;

  Post(
      {this.partnerType,
      this.userName,
      this.userPhoto,
      this.waitDogs,
      this.adoptRate});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      partnerType: json['partnerType'],
      userName: json['userName'],
      userPhoto: json['userphoto'],
      waitDogs: json['waitDogs'],
      adoptRate: json['adoptRate'],
    );
  }
}

Future<Post2> fetchPost2() async {
  final response = await http.get(address);
  if (response.statusCode == 200) {
    final jsonBody = jsonDecode(utf8.decode(response.bodyBytes));
    return Post2.fromJson(jsonBody);
  } else {
    throw Exception('Something went wrong...');
  }
}

class Post2 {
  final String username;
  final String password;
  final String first_name;
  final String last_name;
  final String phonenum;
  final String address;
  final String photourl;
  final int characterid;

  Post2(
      {this.username,
      this.password,
      this.first_name,
      this.last_name,
      this.phonenum,
      this.address,
      this.photourl,
      this.characterid});

  factory Post2.fromJson(Map<String, dynamic> json) {
    return Post2(
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
}

class JsonPlaceholder {
  static Future<List<Post>> getPosts() async {
    try {
      final http.Response response = await http.get(address);

      final responseBody = json.decode(response.body);

      final List<Post> posts =
          responseBody.map<Post>((json) => Post.fromJson(json)).toList();

      return posts;
    } catch (err) {
      print(err);
      throw err;
    }
  }
}

class JsonPlaceholder2 {
  static Future<List<Post2>> getPosts2() async {
    try {
      final http.Response response = await http.get(address);

      final responseBody = json.decode(response.body);

      final List<Post2> posts =
          responseBody.map<Post2>((json) => Post2.fromJson(json)).toList();

      return posts;
    } catch (err) {
      print(err);
      throw err;
    }
  }
}
