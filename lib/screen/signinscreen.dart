import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:market/screen/signupscreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  late AnimationController _controller;
  late TextEditingController _editColEmail, _editColPassword;

  final _formKey = GlobalKey<FormState>();
  bool checkEmail = false;
  bool checkPassword = false;
  FocusNode _emailFocus = new FocusNode();
  FocusNode _passwordFocus = new FocusNode();
  late bool isButtonActive;

  @override
  void initState() { // 위젯을 그리고 그 위젯에서 값을 받을때 
    isButtonActive = false;
    super.initState();
    _editColEmail = TextEditingController();
    _editColPassword = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media_querysize = MediaQuery.of(context).size;
    String title = "중고 마켓";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("${title}",
            style: TextStyle(
              color: Colors.black,
            ),
            textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _showEmailInput(media_querysize),
                    _showPasswordInput(media_querysize),
                  ],
                )),
            SizedBox(
              height: media_querysize.height / 30,
            ),
            SizedBox(
              width: media_querysize.width / 6,
              height: media_querysize.height / 28,
              child: SignInButton(
                Buttons.Google,
                padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                text: "구글로 로그인 하기",
                onPressed: () async {
                  // setState(() {
                  //   _isSigningIn = true;
                  // });
                  // setState(() {
                  //   _isSigningIn = false;
                  // });
                },
              ),
            ),
            SizedBox(
              height: media_querysize.height / 30,
            ),
            SizedBox(
              width: media_querysize.width / 6,
              height: media_querysize.height / 28,
              child: ElevatedButton.icon(
                icon: Icon(Icons.email),
                style: ElevatedButton.styleFrom(
                  onSurface: Colors.blue,
                ),
                onPressed: isButtonActive
                    ? () async {
                        String email = _editColEmail.text.trim();
                        String password = _editColPassword.text.trim();
                        //  await Authentication().signIn(context, email, password);
                      }
                    : null,
                label: Text('이메일로 로그인'),
              ),
            ),
            SizedBox(
              height: media_querysize.height / 30,
            ),
            SizedBox(
              width: media_querysize.width / 6,
              height: media_querysize.height / 28,
              child: ElevatedButton.icon(
                icon: Icon(Icons.email),
                style: ElevatedButton.styleFrom(
                  onSurface: Colors.blue,
                ),
                onPressed: isButtonActive
                    ? () async {
                        String email = _editColEmail.text.trim();
                        String password = _editColPassword.text.trim();
                        //  await Authentication().signIn(context, email, password);
                      }
                    : null,
                label: Text('네이버로 로그인'),
              ),
            ),
            SizedBox(
              height: media_querysize.height / 30,
            ),
            SizedBox(
              width: media_querysize.width / 6,
              height: media_querysize.height / 28,
              child: ElevatedButton.icon(
                icon: Icon(Icons.email),
                style: ElevatedButton.styleFrom(
                  onSurface: Colors.blue,
                ),
                onPressed: isButtonActive
                    ? () async {
                        String email = _editColEmail.text.trim();
                        String password = _editColPassword.text.trim();
                        //  await Authentication().signIn(context, email, password);
                      }
                    : null,
                label: Text('카카오톡으로 로그인'),
              ),
            ),
            SizedBox(
              height: media_querysize.height / 30,
            ),
            SizedBox(
              width: media_querysize.width / 6,
              height: media_querysize.height / 28,
              child: ElevatedButton.icon(
                icon: Icon(Icons.email),
                style: ElevatedButton.styleFrom(
                  onSurface: Colors.blue,
                ),
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) => SignUpScreen(),
                  ));
                },
                label: Text('회원가입'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showEmailInput(var media_querysize) {
    return SizedBox(
        width: media_querysize.width / 2,
        child: TextFormField(
          controller: _editColEmail,
          focusNode: _emailFocus,
          decoration: _textFormDecoration('이메일'),
          onSaved: (value) {
            setState(() {
              _editColEmail.text = value as String;
            });
          },
          validator: (value) {
            RegExp isValue = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
            if (value!.isEmpty) {
              return "이메일이 비어있습니다.";
            }
            if (isValue.hasMatch(value)) {
              checkEmail = true;
              return null;
            } else {
              return "이메일을 정확히 입력해주세요.";
            }
          },
          autovalidateMode: AutovalidateMode.always,
        ));
  }

  Widget _showPasswordInput(media_querysize) {
    return SizedBox(
        width: media_querysize.width / 2,
        child: TextFormField(
          obscureText: true,
          controller: _editColPassword,
          focusNode: _passwordFocus,
          inputFormatters: [],
          decoration: _textFormDecoration('비밀번호'),
          onSaved: (value) {
            setState(() {
              _editColPassword.text = value as String;
            });
          },
          validator: (String? value) {
            RegExp isValue = RegExp(r"^[a-zA-Zㄱ-ㅎ가-힣0-9]*$");
            if (value!.isEmpty) {
              return "비밀번호가 비어있습니다.";
            }
            if (isValue.hasMatch(value) && value.length > 5) {
              checkPassword = true;
              isButtonActive = true;
              return null;
            } else {
              return "비밀번호를 정확히 입력해주세요.";
            }
          },
          autovalidateMode: AutovalidateMode.always,
        ));
  }

  InputDecoration _textFormDecoration(hintText) {
    return new InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(0, 16, 0, 0), hintText: hintText);
  }

  InputDecoration _textFormPWDecoration(hintText) {
    return new InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(0, 16, 0, 0),
        hintText: hintText,
        labelText: "Password");
  }

  InputDecoration _texthelperDecoration(hintText, helperText) {
    return new InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(0, 16, 0, 0),
      hintText: hintText,
      helperText: helperText,
    );
  }

  bool CheckSignin(bool checkEmail, bool checkPassword) {
    bool rtnValue = false;
    if (checkEmail && checkPassword) {
      rtnValue = true;
      return rtnValue;
    }
    return rtnValue;
  }
}
