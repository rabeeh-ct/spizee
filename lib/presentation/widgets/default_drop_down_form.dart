import 'package:flutter/material.dart';

import '../theme/theme.dart';

class DefaultDropDownForm extends StatelessWidget {
  const DefaultDropDownForm(
      {Key? key,
      required this.items,
      required this.selectedValue,
      required this.fn,
      this.labelText,
      this.hindText,
      this.textColor,
      this.textStyle,
      this.inputDecoration, this.dropDownColor, this.validator, this.controller})
      : super(key: key);
  final List<String> items;
  final String? selectedValue;
  final void Function(String?) fn;
  final String? labelText;
  final String? hindText;
  final Color? textColor;
  final TextStyle? textStyle;
  final InputDecoration? inputDecoration;
  final Color? dropDownColor;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText != null
            ? Text(
                labelText!,
                textScaleFactor: 1.0,
                style: textStyle ??
                    Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: textColor),
              )
            : const SizedBox.shrink(),
        labelText != null ? defaultSpacerSmall : const SizedBox.shrink(),
        DropdownButtonFormField<String?>(
          validator: validator,
            dropdownColor: dropDownColor??Theme.of(context).inputDecorationTheme.fillColor,
            menuMaxHeight: MediaQuery.of(context).size.height * 0.25,
            // alignment: AlignmentDirectional.center,
            // iconSize: 25,
            decoration: inputDecoration ??
                 InputDecoration(
                  hintText: hindText,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2,
                        vertical: defaultPadding * .7)),
            // decoration: const InputDecoration.collapsed(hintText: ''),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, textScaleFactor: 1.0),
              );
            }).toList(),
            value: selectedValue,
            onChanged: fn),
      ],
    );
  }
}
