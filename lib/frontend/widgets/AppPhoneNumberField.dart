import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class AppPhoneNumberField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            "Phone no.",
            style: smallHeadingText(),
          ),
        ),
        Container(
          width: SizeConfig.screenWidth * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.2)),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: CountryCodePicker(
                  padding: EdgeInsets.all(0),
                  initialSelection: 'IN',
                  showDropDownButton: true,
                  onChanged: (code) {
                    print(code);
                  },
                ),
              ),
              Container(
                width: SizeConfig.screenWidth * 0.5,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  // onChanged: widget.onChanged,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15),
                      border: InputBorder.none,
                      hintText: '3456789',
                      hintStyle: TextStyle(color: primaryTextColor)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
