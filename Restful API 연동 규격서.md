# UHangGa
# Rest API 연동 규격서<br>[http://127.0.0.1:8000/]
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
3. [PostedDogsList(GET)](#3-posteddogslist)
   1. [PostedDogsDetail(GET,DELETE)](#3-1-posteddogsdetail)

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
>|partnerType|1|잘 어울리는 성격유형|str|
>|userName|1|사용자 이름|str|
>|userPhoto|1|사용자 프로필 사진 링크|str|
>|waitDogs|1|입양을 기다리는 강아지 수|int|
>|adoptRate|1|입양률|int|

- 샘플 JSON 예제
```json
// 200 ok
{
  "partnerType": "None",
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

## 3. PostedDogsList
#### - Request : Get
- HTTP URL = '/api/posts/
- Parameter 형식 (Get 형식)

>|파라미터명|타입|필수여부|설명|
>|-|-|-|-|
>|id|str|필수|가입자(게시자) 고유번호|
>|date|str|필수|포스팅된 날짜|
>|protection|str|필수|강아지의 보호 형태|
>|dogid|str|필수|강아지 고유 아이디|
>|userid|str|필수|게시자 프로필|


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
>|id|1|게시물번호|200 : OK<br>|
>|date|1|게시날짜|200 : OK<br>|
>|protection|1|강아지의 보호형태|200 : OK<br>|
>|dogid|1|강아지고유id|200 : OK<br>|
>|userid|1|게시자고유id|200 : OK<br>|
<br>

- 샘플 JSON 예제
```json
// 200 ok
{ 
   "id": 1,
    "date": "2021-02-01T21:21:28.457074",
    "protection": "작은형이 데리고 있어요...",
    "dogid": 1,
    "userid": 1
}
// 400 bad request 
{
  //
}
```
---

### 3-1. PostedDogsDetail
#### - Request : Get, DELETE
- HTTP URL = '/api/posts/(게시자고유아이디)
- Parameter 형식 (Get, Delete 형식)

>|파라미터명|타입|필수여부|설명|
>|-|-|-|-|
>|id|str|필수|가입자(게시자) 고유번호|
>|date|str|필수|포스팅된 날짜|
>|protection|str|필수|강아지의 보호 형태|
>|dogid|str|필수|강아지 고유 아이디|
>|userid|str|필수|게시자 프로필|


- Parameter 형식(Header 형식)

>|파라미터명|값|설명|
>|Content-Type|application/json|JSON 통신|
<br>

#### - Response Format : JSON 형태로 반환
- 반환값 형식
>|엘리먼트명|depth|설명|값구분|
>|-|-|-|-|
>|id|1|게시물번호|200 : OK<br>|
>|date|1|게시날짜|200 : OK<br>|
>|protection|1|강아지의 보호형태|200 : OK<br>|
>|dogid|1|강아지고유id|200 : OK<br>|
>|userid|1|게시자고유id|200 : OK<br>|

- 샘플 JSON 예제
```json
// 200 ok
{ 
   "id": 1,
    "date": "2021-02-01T21:21:28.457074",
    "protection": "작은형이 데리고 있어요...",
    "dogid": 1,
    "userid": 1
}
// 400 bad request 
{
  //
}
```
---