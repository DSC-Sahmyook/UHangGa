# UHangGa
# Rest API 연동 규격서<br>[http://dsc-uhg-306513.du.r.appspot.com/]
## 개요
- Project Name : UHG
- Project Manager : 김현균
- Version Number : V0.3
- Written Date : 2021.02.02
- Update by : 김현균
- Update comment : 회원관리(회원가입, 로그인, 로그아웃) , 메인페이지 추가
---
## 목차
1. [회원관리](#1-회원관리)
   1. [회원가입(POST)](#1-1-회원가입)
   2. [로그인(POST)](#1-2-로그인)
   3. [로그아웃(DELETE)](#1-3-로그아웃)
2. [메인페이지](#2-메인페이지)
   1. [메인페이지-data](#2-1-메인페이지-데이터)
   2. [메인페이지-list](#2-2-메인페이지-리스트)
3. [등록된 강아지들](#3-등록된-강아지들)
   1. [강아지 정보 등록(POST)](#3-1-강아지-정보-등록post)
   2. [PostedDogsDetail(GET)](#3-2-posteddogsdetail)
4. [MBTI 검사](#4-mbti-검사)

---
<br>

## 1. 회원관리
### 1-1. 회원가입
#### - Request : POST 방식으로 호출
- HTTP URL = '/api/app/auth/signup/
- Parameter 형식 (POST 형식)

>|파라미터명|타입|필수여부|설명|
>|-|-|-|-|
>|username|str|필수|가입자 아이디|
>|password|str|필수|가입자 비밀번호|
>|email|str|필수|가입자 이메일|
>|first_name|str|필수|가입자 성을 뺀 이름|
>|last_name|str|필수|가입자의 성|
>|phonenum|str|필수|가입자의 휴대폰 번호|
>|address|str|필수|가입자 주소|
>|photourl|str|필수|가입자 사진|
>|characterid|int|선택|가입자 성격|

- Parameter 형식(Header 형식)

>|파라미터명|값|설명|
>|-|-|-|
>|Content-Type|application/json|JSON 통신|
<br>

#### - Response Format : JSON 형태로 반환
- 반환값 형식
>  
>|엘리먼트명|depth|설명|값구분|
>|-|-|-|-|
>|token|1|해당 유저의 token값|200 : OK<br>400 : Bad Request|

- 샘플 JSON 예제
```json
// 200 ok
{ 
  "token": "0935b3867e6f2e6495922958e4aa3ae070a21b9f"
}
// 400 bad request 
{
  "detail": "JSON parse error - Expecting value: line 1 column 1 (char 0)"
}

```
---

### 1-2. 로그인
#### - Request : POST 방식으로 호출
- HTTP URL = '/api/app/auth/signin/
- Parameter 형식 (POST 형식)

>|파라미터명|타입|필수여부|설명|
>|-|-|-|-|
>|username|str|필수|가입자 아이디|
>|password|str|필수|가입자 비밀번호|

- Parameter 형식(Header 형식)

>|파라미터명|값|설명|
>|-|-|-|
>|Content-Type|application/json|JSON 통신|
<br>

#### - Response Format : JSON 형태로 반환
- 반환값 형식
>  
>|엘리먼트명|depth|설명|값구분|
>|-|-|-|-|
>|token|1|해당 유저의 token값|200 : OK<br>400 : Bad Request|

- 샘플 JSON 예제
```json
// 200 ok
{ 
  "token": "0935b3867e6f2e6495922958e4aa3ae070a21b9f"
}
{
   "detail": "JSON parse error - Expecting value: line 1 column 1 (char 0)"
}
```
---

### 1-3. 로그아웃
#### - Request : DELETE
- HTTP URL = '/api/app/auth/logout/
- Parameter 형식 (delete 형식)

>|파라미터명|타입|필수여부|설명|
>|-|-|-|-|
>|username|str|필수|가입자 아이디|
>|password|str|필수|가입자 비밀번호|

- Parameter 형식(Header 형식)

>|파라미터명|값|설명|
>|-|-|-|
>|Content-Type|application/json|JSON 통신|
<br>

#### - Response Format : JSON 형태로 반환
- 반환값 형식

>|엘리먼트명|depth|설명|값구분|
>|-|-|-|-|
>|token|1|해당 유저의 token값|200 : OK<br>400 : Bad Request|

- 샘플 JSON 예제
```json
// 200 ok
{ 
  // json 예시
}
// 400 bad request 
{
  "detail": "메소드(Method) \"GET\"는 허용되지 않습니다."
}
```
---
## 2. 메인페이지
### 2-1. 메인페이지 데이터
#### - Request : GET
- HTTP URL = '/api/main/index/data/'
- Parameter 형식 (get 형식)

>|파라미터명|타입|필수여부|설명|
>|-|-|-|-|
>|-|-|-|-|

- Parameter 형식(Header 형식)

>|파라미터명|값|설명|
>|-|-|-|
>|-|-|-|
<br>

#### - Response Format : JSON 형태로 반환
- 반환값 형식

>|엘리먼트명|depth|설명|값구분|
>|-|-|-|-|
>|partnerType_name|1|잘 어울리는 성격유형 이름|str|
>|partnerType_img_url|1|잘 어울리는 성격유형 이미지 링크|str|
>|userName|1|사용자 이름|str|
>|userPhoto|1|사용자 프로필 사진 링크|str|
>|waitDogs|1|입양을 기다리는 강아지 수|int|
>|adoptRate|1|입양률|int|

- 샘플 JSON 예제
```json
// 200 ok
{
  "partnerType_name": "None",
  "partnerType_img_url": "None",
  "userName": "test",
  "userPhoto": "photo_url",
  "waitDogs": 2,
  "adoptRate": 33
}
// 400 bad request 
{
  400
}
```

---

### 2-2. 메인페이지 리스트
#### - Request : GET
- HTTP URL = '/api/main/index/list/'
- Parameter 형식 (GET 형식)

>|파라미터명|타입|필수여부|설명|
>|-|-|-|-|
>|-|-|-|-|

- Parameter 형식(Header 형식)

>|파라미터명|값|설명|
>|-|-|-|
>|-|-|-|
<br>

#### - Response Format : JSON 형태로 반환
- 반환값 형식

>|엘리먼트명|depth|설명|값구분|
>|-|-|-|-|
>|name|2|강아지 이름|str|
>|age|2|강아지 개월수|int|
>|url|2|강아지 사진 url|str|

- 샘플 JSON 예제
```json
// 200 ok
[
  {
    "name": "용맹이",
    "age": 10,
    "photoUrl": "testphotourl"
  },
  {
    "name": "용감이",
    "age": 10,
    "photoUrl": "testphotourl"
  }
]
// 400 bad request 
{
  "detail": "메소드(Method) \"GET\"는 허용되지 않습니다."
}
```
---

## 3. 등록된 강아지들
### 3-1. 강아지 정보 등록(POST)
#### - Request : Post
- HTTP URL = 'api/dog/post/'
- Parameter 형식 (POST 형식)

>|파라미터명|타입|필수여부|설명|
>|-|-|-|-|
>|photo|list|필수|Firebase에 등록한 사진들 url|
>|name|str|필수|강아지 이름|
>|dogtype|str|필수|견종|
>|age|intger|필수|강아지 나이(개월수)|
>|gender|bool|필수|수컷: false, 암컷: true|
>|vaccination|bool|필수|저기 뭐야 예방접종 그거|
>|dogCharacter|str|필수|성격검사결과|
>|fee|int|필수|입양비|



- Parameter 형식(Header 형식)

>|파라미터명|값|설명|
>|-|-|-|
>|Content-Type|application/json|JSON 통신|
>|Authorization|token <토큰값>|유저 토큰값|
<br>

#### - Response Format : JSON 형태로 반환
- 반환값 형식
>  
>|엘리먼트명|depth|설명|값구분|
>|-|-|-|-|
>|-|-|-|-|

<br>

- 샘플 JSON 예제
```json
// 200 ok
{
  "id": 44,
  "date": "2021-03-18T01:13:46.435261",
  "vaccination": true,
  "fee": 1,
  "dogid": 29,
  "dogCharacter": 1,
  "userid": 1
}
// 400 bad request 
{
}

// 401 Unauthorized
{
  // Token값이 유저에 없어서 생기는 권한에러
}
```
---

### 3-2. PostedDogsDetail
#### - Request : Get
- HTTP URL = '/api/posts/(게시자고유아이디)/'
- Parameter 형식 (Get 형식)

>|파라미터명|타입|필수여부|설명|
>|-|-|-|-|
>|id|int|필수|게시불 고유번호(id)|


- Parameter 형식(Header 형식)

>|파라미터명|값|설명|
>|-|-|-|
>|-|-|-|
<br>

#### - Response Format : JSON 형태로 반환
- 반환값 형식
>|엘리먼트명|depth|설명|값구분|
>|-|-|-|-|
>|photolist|1|강아지 사진 리스트|200 : OK<br>|
>|dog_name|1|강아지 이름|200 : OK<br>|
>|date|1|게시물 게시일자|200 : OK<br>|
>|isadopted|1|강아지 입양상태|200 : OK<br>|
>|gender|1|강아지 성별|200 : OK<br>|
>|age|1|강아지 나이(개월)|200 : OK<br>|
>|vaccination|1|강아지 접종여부|200 : OK<br>|
>|fee|1|강아지 입양비|200 : OK<br>|
>|area|1|입양 지역|200 : OK<br>|
>|dogCharacter_id|1|강아지 성격 id값|200 : OK<br>|
>|dogCharacter_name|1|강아지 성격 이름|200 : OK<br>|
>|writer_photo|1|게시자 프로필 사진|200 : OK<br>|
>|writer_name|1|게시자 계정명|200 : OK<br>|
>|writer_phonenum|1|게시자 전화번호|200 : OK<br>|
>|uniqueness|1|강아지 특이사항|200 : OK<br>|

- 샘플 JSON 예제
```json
// 200 ok
{
  "photolist": [
    "https://firebasestorage.googleapis.com/v0/b/uhg-firebase.appspot.com/o/posted_dog%2Ftest_dog.jpeg?alt=media&token=4fdd9464-eb18-40b7-a073-fde7f80a9f6b",
    "https://firebasestorage.googleapis.com/v0/b/uhg-firebase.appspot.com/o/posted_dog%2Ftest_dog.jpeg?alt=media&token=4fdd9464-eb18-40b7-a073-fde7f80a9f6b",
    "https://firebasestorage.googleapis.com/v0/b/uhg-firebase.appspot.com/o/posted_dog%2Ftest_dog.jpeg?alt=media&token=4fdd9464-eb18-40b7-a073-fde7f80a9f6b",
    "https://firebasestorage.googleapis.com/v0/b/uhg-firebase.appspot.com/o/posted_dog%2Ftest_dog.jpeg?alt=media&token=4fdd9464-eb18-40b7-a073-fde7f80a9f6b"
  ],
  "dog_name": "용맹이",
  "date": "2021-02-01T21:21:39.715055",
  "isadopted": false,
  "breed": "프렌치불독",
  "gender": "male",
  "age": 10,
  "vaccination": "Yes",
  "fee": 0,
  "area": "서초구",
  "dogCharacter_id": 5,
  "dogCharacter_name": "esfj",
  "writer_photo": "https://firebasestorage.googleapis.com/v0/b/uhg-firebase.appspot.com/o/user-profile%2Fksanbal_profile.jpeg?alt=media&token=f75a7986-87fd-4e3c-9aa4-65440762a59c",
  "writer_name": "ksanbal",
  "writer_phonenum": "010315414124",
  "uniqueness": "완전 허옇게 생겼어요"
}
// 400 bad request 
{
  //
}
```
---

## 4. MBTI 검사
#### - Request : POST
- HTTP URL = '/api/mbti/result/'
- Parameter 형식 (get 형식)

>|파라미터명|타입|필수여부|설명|
>|-|-|-|-|
>|answer|list|O|설문 내용 리스트(1,2)로 표현|
>|isperson|bool|O|사람용이면 True, 강아지용이면 False|

- Parameter 형식(Header 형식)

>|파라미터명|값|설명|
>|-|-|-|
>|Authorization|token <토큰값>|사람일때는 추가, 아니면 빼도 괜찮음|

- 샘플 JSON 예제
```json
// POST
{
  "answer": "[2,2,2,2,2,2,2,2,2,2,2,2]",
  "isperson": "false"
}
```
<br>

#### - Response Format : JSON 형태로 반환
- 반환값 형식

>|엘리먼트명|depth|설명|값구분|
>|-|-|-|-|
>|character|1|성격유형|str|
>|url|1|유형 이미지 링크|str|
>|partner_type|1|어울리는 유형|str|

- 샘플 JSON 예제
```json
// 200 ok
{
  "id": 11,
  "character": "istj",
  "url": "istj@djWjrnwjWjrn.com",
  "partner_type": "enfj"
}
// 400 bad request 
{

}
```

---
