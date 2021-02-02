# UHangGa
# Rest API 연동 규격서<br>[http://127.0.0.1:8000/]
## 개요
- Project Name : UHG
- Project Manager : 김현균
- Version Number : V0.2
- Written Date : 2021.02.02
- Update by : 이현석
---
## 목차
1. [회원관리]()
   1. [회원가입(POST)]()
   2. [로그인(POST)]()
   3. [로그아웃(DELETE)]()
2. [메인페이지]()
   1. [PostedDogsList(GET)]()
      1. [PostedDogsDetail(GET,DELETE)]()

---
<br>

# 양식
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
>|characterid|str|필수|가입자 성격|


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
  // json
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
  // json
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
>  
>|엘리먼트명|depth|설명|값구분|
>|-|-|-|-|
>|token|1|해당 유저의 token값|200 : OK<br>405 : Bad Request|

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
### 2-1. PostedDogsList
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

### 2-1-1. PostedDogsDetail
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