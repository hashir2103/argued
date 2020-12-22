import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextField extends StatefulWidget {
  String hintText;
  String label;
  IconData icon;
  Function onTap;
  bool obsecureText;
  final void Function(String) onChanged;
  AppTextField({
    this.onChanged,
    this.obsecureText = false,
    this.hintText = '',
    this.label = '',
    this.icon,
    this.onTap,
  });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            widget.label,
            style: smallHeadingText(),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.2)),
          child: Stack(
            children: [
              TextFormField(
                obscureText: widget.obsecureText,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 15),
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    hintStyle: TextStyle(color: primaryTextColor)),
              ),
              Positioned(
                  right: 10,
                  top: 12,
                  child: GestureDetector(
                      onTap: widget.onTap,
                      child: Icon(
                        widget.icon,
                        size: 20,
                        color: primaryColor,
                      )))
            ],
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class AppSmallTextField extends StatefulWidget {
  String hintText;
  final void Function(String) onChanged;
  String label;
  AppSmallTextField({
    this.hintText = '',
    this.label = '', this.onChanged,
  });

  @override
  _AppSmallTextFieldState createState() => _AppSmallTextFieldState();
}

class _AppSmallTextFieldState extends State<AppSmallTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            widget.label,
            style: smallHeadingText(),
          ),
        ),
        Container(
          width: SizeConfig.screenWidth / 2.3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.2)),
          child: TextFormField(
            onChanged: widget.onChanged,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15),
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(color: primaryTextColor)),
          ),
        ),
      ],
    );
  }
}
