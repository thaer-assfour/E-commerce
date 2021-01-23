import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.icon,
      this.labelText,
      this.obsecure = false,
      this.validator,
      this.onSaved});

  final FormFieldSetter<String> onSaved;
  final Icon icon;
  final String labelText;
  final bool obsecure;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        autofocus: false,
        obscureText: obsecure,
        style: TextStyle(
          fontSize: 18,
          height: 1.2,
        ),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            labelText: labelText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.5,
              ),
            ),
            prefixIcon: Padding(
              child: IconTheme(
                data: IconThemeData(color: Theme.of(context).primaryColor),
                child: icon,
              ),
              padding: EdgeInsets.only(left: 10, right: 16),
            )),
      ),
    );
  }
}

Widget customButton(
    {String text, Color textColor, Color color, width, void function()}) {
  return Container(
    width: width,
    child: RaisedButton(
      onPressed: () => function(),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: textColor, fontSize: 18),
      ),
      color: color,
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
    ),
  );
}
