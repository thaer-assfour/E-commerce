import 'package:flutter/material.dart';

class SplashPageDetails extends StatelessWidget {
  final list;

  SplashPageDetails(this.list);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            list['image'],
            width: MediaQuery.of(context).size.width / 1.2,
          ),
        ),
        Text(
          list['title'],
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.orange, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.only(top:8,bottom: 8,right: 16,left: 16),
          child: Text(
            list['description'],
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w200),
          ),
        ),
      ],
    );
  }
}
