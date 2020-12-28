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
  double size;
  bool enable;
  TextEditingController controller;
  Color iconColor;
  final void Function(String) onChanged;
  AppTextField({
    this.controller,
    this.enable = true,
    this.size = 20,
    this.onChanged,
    this.obsecureText = false,
    this.hintText = '',
    this.label = '',
    this.icon,
    this.onTap,
    this.iconColor = primaryColor
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
                controller: widget.controller,
                enabled: widget.enable,
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
                        size: widget.size,
                        color: widget.iconColor,
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
  final String hintText;
  final String label;
  final IconData icon;
  final Function onTap;
  final bool obsecureText;
  final double size;
  final bool enable;
  double fractionOfwidth;
  TextInputType textInputType;
  final void Function(String) onChanged;
  TextEditingController controller;
  AppSmallTextField({
    this.controller,
    this.textInputType = TextInputType.text,
    this.fractionOfwidth = 2.3,
    this.hintText = '',
    this.label = '',
    this.onChanged,
    this.icon,
    this.onTap,
    this.obsecureText,
    this.size,
    this.enable,
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
          width: SizeConfig.screenWidth / widget.fractionOfwidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.2)),
          child: Stack(
            children: [
              TextFormField(
                controller: widget.controller,
                enabled: widget.enable ?? true,
                obscureText: widget.obsecureText ?? false,
                keyboardType: widget.textInputType,
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
                        size: widget.size,
                        color: primaryColor,
                      )))
            ],
          ),
        ),
      ],
    );
  }
}
