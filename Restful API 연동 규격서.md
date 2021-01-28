# UHangGa
# Rest API 연동 규격서<br>[http://127.0.0.1:8000/]
## 개요
- Project Name : UHG
- Project Manager : 김현균
- Version Number : V0.1
- Written Date : 2021.01.29
- Update by : 김현균
---
## 목차
1. [회원관리]()
   1. [회원가입(POST)]()
   2. [로그인(POST)]()
   3. [로그아웃(DELETE)]()
2. [메인페이지]()
---
<br>

# 양식
### 1-1. 회원가입
#### - Request : POST 방식으로 호출
- HTTP URL = '/api/app/auth/signup/ 이렇게 뒤에만 적어주세요'
- Parameter 형식 (POST 형식)

>|파라미터명|타입|필수여부|설명|
>|-|-|-|-|
>|username|str|필수|가입자 아이디|
>|password|str|필수|가입자 비밀번호|
>|first_name|str|필수|가입자 이름|

- Parameter 형식(Header 형식)

>|파라미터명|값|설명|
>|-|-|-|
>|Content-Type|application/json|JSON 통신|
<br>

#### - Response Format : JSON 형태로 반환
- 반환값 형식
>  
>|엘리먼트명|depth|설명|값구분|
>|-|-|-|-|-|
>|token|1|해당 유저의 token값|200 : OK<br>400 : Bad Request

- 샘플 JSON 예제
```json
// 200 ok
{ 
  // json 예시를 적어주세요
}
// 400 bad request 여기는 어떻게 적히는지 적어주세요
{

}
// 혹시 다른 status 코드가 있다면 쭈욱 적어주세요
{
  // 꼭 리턴값이 아니라 어떤 상황인지 적어주셔도 좋아요.
}
```
---