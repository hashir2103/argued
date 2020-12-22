import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:flutter/material.dart';

class AppDropDown {
  myDropDown() {
    var value = 'Mr.';
    var salutation = [
      "Mr.",
      "Mrs.",
      "Miss",
      "Dr.",
      "Ms.",
      "Prof.",
      "Rev.",
      "Lady",
      "Sir",
      "Capt.",
      "Major",
      "Lt.-Col.",
      "Col.",
      "Lady",
      "Lt.-Cmdr.",
      "The Hon.",
      "Cmdr.",
      "Flt. Lt.",
      "Brgdr.",
      "Judge",
      "Lord",
      "The Hon. Mrs",
      "Wng. Cmdr.",
      "Group Capt.",
      "Rt. Hon. Lord",
      "Revd. Father",
      "Revd Canon",
      "Maj.-Gen.",
      "Air Cdre.",
      "Viscount",
      "Dame",
      "Rear Admrl.",
      "Other"
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            'Salutation',
            style: smallHeadingText(),
          ),
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.2)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0),
              child: DropdownButton(
                  elevation: 5,
                  isExpanded: true,
                  underline: Container(),
                  icon: Icon(Icons.arrow_drop_down,color: primaryColor,size: 30,),
                  value: value,
                  items: salutation.map((String item) {
                    return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: dropDownMenuText,
                        ));
                  }).toList(),
                  onChanged: (newValue) {}),
            )),
      ],
    );
  }
}
