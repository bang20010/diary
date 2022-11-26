import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:market/screen/signinscreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen>{
  late AnimationController _controller;
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _editColEmail,
      _editColPassword,
      _editColIsPassword,
      _editColPhoneNum,
      _editingColName,
      _editingColID;

  FocusNode _emailFocus = new FocusNode();
  FocusNode _passwordFocus = new FocusNode();
  FocusNode _isPasswordFocus = new FocusNode();
  FocusNode _phoneFocus = new FocusNode();
  FocusNode _nameFocus = new FocusNode();
  FocusNode _idFocus = new FocusNode();

  late bool isButtonActive;

  bool checkEmail = false;
  bool checkPassword = false;
  bool checkPhoneNum = false;

  @override
  void initState() {
    isButtonActive = false;
    super.initState();
    // 생성자로 만드는 초기화 패턴
    _editColEmail = TextEditingController();
    _editColPassword = TextEditingController();
    _editColIsPassword = TextEditingController();
    _editColPhoneNum = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var media_querysize = MediaQuery.of(context).size;
    String title = "회원 가입";

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
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
            width: media_querysize.width,
            height: media_querysize.height + 250,
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _showEmailInput(),
                    _showPasswordInput(),
                    _showIsPasswordInput(),
                    _showPhoneNumInput()
                  ],
                )),
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: ElevatedButton(
                  onPressed: () async {
                    String email = _editColEmail.text.trim();
                    String password = _editColPassword.text.trim();
                    String isPassword = _editColIsPassword.text.trim();
                    String phoneNum = _editColPhoneNum.text.trim();

                    // await FireStoreApp_User()
                    //     .addUserPhoneNum(context, phoneNum, email, createDate)
                    //     .then((value) => {
                    //           FireStoreApp_User().addUserData(context, phoneNum,
                    //               email, password, createDate),
                    //           Authentication().signUp(context, email, password)
                    //         })
                    //     .then((value) => {
                    //           Navigator.of(context)
                    //               .push(MaterialPageRoute<void>(
                    //             builder: (BuildContext context) => SignInScreen(),
                    //           ))
                    //         });
                  },
                  child: Text("${title}"),
                ),
              ),
              //회원가입 아이디, 비밀번호, 비밀번호 확인, 핸드폰 번호
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                  //  function().popbeforePage(context);
                  },
                  child: Text('뒤로 가기'),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _showEmailInput() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                      checkEmail = true;
                    }
                    if (isValue.hasMatch(value)) {
                      return null;
                    } else {
                      return "이메일을 정확히 입력해주세요.";
                    }
                  },
                  autovalidateMode: AutovalidateMode.always,
                )),
          ],
        ));
  }

  Widget _showPasswordInput() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                  obscureText: true,
                  controller: _editColPassword,
                  focusNode: _passwordFocus,
                  inputFormatters: [],
                  decoration: _textFormPWDecoration('비밀번호'),
                  onSaved: (value) {
                    setState(() {
                      _editColPassword.text = value as String;
                    });
                  },
                  validator: (String? value) {
                    RegExp isValue = RegExp(r"^[a-zA-Zㄱ-ㅎ가-힣0-9]*$");
                    if (value!.isEmpty) {
                      return "비밀번호가 비어있습니다. [6글자 이상 입력해주세요]";
                    }
                    if (isValue.hasMatch(value) && value.length > 5) {
                      return null;
                    } else {
                      return "비밀번호를 정확히 입력해주세요.";
                    }
                  },
                  autovalidateMode: AutovalidateMode.always,
                )),
          ],
        ));
  }

  Widget _showIsPasswordInput() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                  obscureText: true,
                  controller: _editColIsPassword,
                  focusNode: _isPasswordFocus,
                  inputFormatters: [],
                  decoration: _textFormPWDecoration('비밀번호 확인'),
                  onSaved: (value) {
                    setState(() {
                      _editColIsPassword.text = value as String;
                    });
                  },
                  validator: (String? value) {
                    RegExp isValue = RegExp(r"^[A-Za-z\d@$!%*#?&]*$");
                    String password = _editColPassword.text.trim();
                    if (value!.isEmpty) {
                      return "비밀번호 확인이 비어있습니다.";
                    }
                    if (password == value) {
                      return null;
                      checkPassword = true;
                    } else {
                      return "비밀번호가 같지 않습니다.";
                    }
                  },
                  autovalidateMode: AutovalidateMode.always,
                )),
          ],
        ));
  }

  Widget _showPhoneNumInput() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                  controller: _editColPhoneNum,
                  focusNode: _phoneFocus,
                  decoration: _textFormDecoration('핸드폰 번호'),
                  onSaved: (value) {
                    setState(() {
                      _editColPhoneNum.text = value as String;
                    });
                  },
                  validator: (value) {
                    RegExp isValue = RegExp(r'^010-?([0-9]{4})-?([0-9]{4})$');
                    if (value!.isEmpty) {
                      return "핸드폰 번호가 비어있습니다.";
                    }
                    if (isValue.hasMatch(value)) {
                      return null;
                    } else {
                      return "핸드폰 번호를 정확히 입력해주세요.";
                    }
                  },
                  autovalidateMode: AutovalidateMode.always,
                )),
          ],
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
}