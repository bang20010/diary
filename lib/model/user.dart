import 'dart:convert';

class UserData {
  UserData(
      {required this.Email,
      required this.Password,
      required this.Address,
      required this.PhoneNumber,
      required this.NicName,
      required this.SignInDate});
      
  // 유저 이메일
  final String Email;

  // 유저 비밀번호
  final String Password;

  // 유저 주소
  final String Address;

  // 유저 핸드폰 번호
  final String PhoneNumber;

  //유저 닉네임
  final String NicName;

  // 회원가입 날짜
  final String SignInDate;

  factory UserData.fromeJson(Map<String, dynamic> json) => UserData(
        Email: json["Email"],
        Password: json["Password"],
        Address: json["Address"],
        PhoneNumber: json["PhoneNumber"],
        NicName: json["NicName"],
        SignInDate: json["SignInDate"],
      );

  Map<String, dynamic> toJson() => {
        "Email": Email,
        "Password": Password,
        "Address": Address,
        "PhoneNumber": PhoneNumber,
        "NicName": NicName,
        "SignInDate": SignInDate,
      };
}
