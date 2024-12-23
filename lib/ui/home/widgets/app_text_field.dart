import 'package:chef_wizz/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppTextField extends HookWidget {
  const AppTextField({
    this.hintText,
    this.label,
    this.inputType,
    this.initialText,
    this.readOnly = false,
    this.maxLines = 1,
    this.prefix,
    super.key,
    this.controller,
    this.onChanged,
    this.textInputAction,
    this.inputFormatters,
    this.suffixIcon,
    this.hintTextStyle,
    this.focusNode,
  });

  final String? initialText;
  final bool readOnly;
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final int maxLines;
  final TextInputType? inputType;
  final TextInputAction? textInputAction;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final TextStyle? hintTextStyle;
  final FocusNode? focusNode;

  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(
          color: greyColor.withOpacity(0.1),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: grayFDColor,
            ),
          ),
          const SizedBox(height: 12),
        ],
        SizedBox(
          height: 48,
          child: TextFormField(
            readOnly: readOnly,
            focusNode: focusNode,
            textAlignVertical: TextAlignVertical.center,
            onChanged: onChanged,
            initialValue: initialText,
            maxLines: maxLines,
            inputFormatters: inputFormatters,
            controller: controller,
            keyboardType: inputType,
            textInputAction: textInputAction ?? TextInputAction.next,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: whiteColor,
            ),
            decoration: InputDecoration(
              prefixIcon: prefix,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              hintText: hintText,
              filled: true,
              fillColor: whiteColor.withOpacity(0.1),
              hintStyle: hintTextStyle ??
                  const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
              border: _border,
              focusedBorder: _border,
              enabledBorder: _border,
            ),
          ),
        ),
      ],
    );
  }
}
