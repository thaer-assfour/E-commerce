import 'package:e_commerce/pages/login/CustomTextField.dart';
import 'package:e_commerce/services/appLocal.dart';
import 'package:flutter/material.dart';

Widget login(context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    child: Form(
        child: Column(
      children: [
        TextField(
          style: TextStyle(
              color: Color(0xff6990B9).withOpacity(0.9),
              fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.email,
              color: Color(0xff6990B9),
            ),
            labelText: getLang(context, "email"),
            labelStyle: TextStyle(
                color: Color(0xff6990B9), fontWeight: FontWeight.w400),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(width: 1, color: Color(0xff6990B9)),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(width: 1, color: Color(0xff6990B9))),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(width: 2, color: Color(0xff6990B9)),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        TextField(
          obscureText: true,
          style: TextStyle(
              color: Color(0xff6990B9).withOpacity(0.9),
              fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.vpn_key,
              color: Color(0xff6990B9),
            ),
            labelText: getLang(context, "password"),
            labelStyle: TextStyle(
                color: Color(0xff6990B9), fontWeight: FontWeight.w400),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(width: 1, color: Color(0xff6990B9)),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(width: 1, color: Color(0xff6990B9))),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(width: 2, color: Color(0xff6990B9)),
            ),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.6,
            margin: EdgeInsets.only(top: 8, bottom: 24),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Color(0xff6990B9).withOpacity(0.8),
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(16)),
            child: InkWell(
              child: Text(
                "${getLang(context, "Login")}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.4),
              ),
              onTap: () {},
            )),
      ],
    )),
  );
}

Widget register(context) {
  return Form(
      child: Column(
    children: [
      CustomTextField(
        icon: Icon(Icons.email),
        labelText: getLang(context, "email"),
      ),
        customButton(text: "Login", textColor: Colors.white, color: Colors.blue)
    ],
  ));
}
