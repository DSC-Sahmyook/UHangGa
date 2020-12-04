from django import forms 
from blog.models import Member

# 회원가입 폼 
class MemberJoinForm(forms.Form):
     email = forms.EmailField(
          label='이메일', 
          widget=forms.EmailInput(attrs={'class':'form-control'})
          
            ) 
            password = forms.CharField(
                label='비밀번호',
                widget=forms.PasswordInput(attrs={'class':'form-control'})
                
            ) 
            re_password = forms.CharField(
                label='비밀번호 확인',
                widget=forms.PasswordInput(attrs={'class':'form-control'})
            )
            name = forms.CharField( 
                label='이름',
                widget=forms.TextInput(attrs={'class':'form-control'})
            )
            picture = forms.ImageField(
                label='사진', 
                widget=forms.FileInput(attrs={'class':'form-control'}) 
            )

def clean(self):
     # 요청파라미터 값들 조회 
     cleaned_data = super().clean() # dictionary 반환. 
     email = cleaned_data.get('email') 
     password = cleaned_data.get('password') 
     re_password = cleaned_data.get('re_password') 
     #password와 re_password가 같은지 체크 
     if password != re_password: 
         self.add_error('password', '비밀번호가 다릅니다.') 
         self.add_error('re_password', '비밀번호가 다릅니다') 
         
         # 이메일(아이디) 중복 체크 
         
     try: 
         Member.objects.get(pk=email) 
         self.add_error('email', '이미 가입된 이메일입니다.')
     except:
          # # 조회 결과가 없다. 등록되지 않은 email 
        pass


# 로그인 폼 

class LoginForm(forms.Form):
    email = forms.EmailField( 
        label='이메일', 
        widget=forms.EmailInput(attrs={'class':'form-control'}) 
        )
    password = forms.CharField( 
        label='비밀번호', 
        widget=forms.PasswordInput(attrs={'class':'form-control'})
        )

    def clean(self): 
        cleaned_data = super().clean() # 부모에 있는 값을 clean으로 받아오기 
        email = cleaned_data.get('email') 
        password = cleaned_data.get('password') 
        try: 
            member = Member.objects.get(pk=email) 
            if not check_password(password, member.password): 
                self.add_error('password', '비밀번호가 틀렸습니다.') 
                
        except: 
            # 없는 이메일(id) 
            self.add_error('email', '가입하지 않은 이메일 주소입니다.')



