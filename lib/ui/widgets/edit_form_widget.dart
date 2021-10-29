import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/pallets.dart';

import 'text_views.dart';

// ignore: must_be_immutable
class EditFormField extends StatelessWidget {
  EditFormField(
      {this.label = '',
      this.hint = '',
      this.floatingLabel = '',
      this.prefixIcon,
      this.suffixIcon,
      this.onSaved,
      this.validator,
      this.controller,
      this.alignLabelWithHint = false,
      this.onPasswordToggle,
      this.initialValue,
      this.autoValidateMode = AutovalidateMode.disabled,
      this.autocorrect = true,
      this.enabled = true,
      this.obscureText = false,
      this.readOnly = false,
      this.onTapped,
      this.keyboardType,
      this.suffixWidget,
      this.maxLines = 1,
      this.minLines = 1,
      this.maxLength,
      this.floatingLabelBehavior = FloatingLabelBehavior.never,
      this.inputFormatters,
      this.focusedColorBorder,
      this.suffixIconColor,
      this.labelStyle,
      this.hintStyle,
      this.textStyle,
      this.decoration,
      this.onChange,
      this.edgeInsetsGeometry,
      this.textCapitalization = TextCapitalization.none,
      this.formKey,
      this.focusNode,
      this.textInputAction = TextInputAction.next,
      this.clickable,
      this.prefixIconColor,
      this.fillColor = true,
      this.counterLength = 0,
      this.isTyping = false,
      this.autoValidate = false,
      this.showMaxLengthCounter = false,
      this.radius = 5, this.prefixWidget});

  final TextCapitalization? textCapitalization;
  final String? label;
  final String? floatingLabel;
  final String? hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final Widget? prefixWidget;

  final FormFieldSetter<String>? onSaved;
  final Function(String)? onChange;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onPasswordToggle;

  final String? initialValue;
  final TextEditingController? controller;
  final FloatingLabelBehavior? floatingLabelBehavior;

  final bool? autocorrect;
  final AutovalidateMode? autoValidateMode;
  final bool? enabled;
  final bool? obscureText;
  final bool? readOnly;
  final bool? alignLabelWithHint;
  final bool? isTyping;

  final bool? clickable;
  final Function()? onTapped;

  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputFormatter? inputFormatters;

  final Color? focusedColorBorder;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputAction? textInputAction;
  final InputDecoration? decoration;
  final Key? formKey;

  final EdgeInsetsGeometry? edgeInsetsGeometry;
  final FocusNode? focusNode;
  bool fillColor;
  bool autoValidate;
  bool showMaxLengthCounter;
  final int counterLength;
  double radius;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextView(
          text: floatingLabel!,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Pallets.grey600,
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          readOnly: readOnly!,
          onTap: onTapped,
          key: formKey,
          cursorColor: Pallets.orange600,
          keyboardType: keyboardType,
          enabled: enabled,
          focusNode: focusNode,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization!,
          // autovalidateMode: autoValidateMode,
          onSaved: onSaved,
          onChanged: onChange,
          maxLines: maxLines,
          // ignore: deprecated_member_use
          autovalidate: autoValidate,
          style: GoogleFonts.montserrat(
              color: Pallets.grey800,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              fontStyle: FontStyle.normal),
          autocorrect: autocorrect!,
          minLines: minLines,
          obscureText: obscureText!,
          maxLength: maxLength,
          validator: validator,
          initialValue: initialValue,
          controller: controller,
          decoration: decoration == null
              ? InputDecoration(
                  counterText: '',
                  counter: showMaxLengthCounter
                      ? Text(
                          '$counterLength/$maxLength characters',
                          style: TextStyle(color: Colors.green),
                        )
                      : null,
                  fillColor: focusedColorBorder,
                  filled: fillColor,
                  floatingLabelBehavior: floatingLabelBehavior,
                  alignLabelWithHint: alignLabelWithHint,
                  errorStyle: TextStyle(color: Colors.red),
                  contentPadding: edgeInsetsGeometry != null
                      ? edgeInsetsGeometry
                      : EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: focusedColorBorder != null
                            ? focusedColorBorder!
                            : Pallets.grey100),
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: focusedColorBorder != null
                            ? focusedColorBorder!
                            : Pallets.grey100),
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: focusedColorBorder != null
                            ? focusedColorBorder!
                            : Pallets.grey100),
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  hintText: hint,
                  hintStyle: hintStyle != null
                      ? hintStyle
                      : GoogleFonts.montserrat(
                          color: Pallets.grey800,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontStyle: FontStyle.normal),
                  labelText: label,
                  labelStyle: labelStyle != null
                      ? labelStyle
                      : GoogleFonts.montserrat(
                          color: Pallets.grey400,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontStyle: FontStyle.normal),
                  prefixIcon: prefixWidget != null
                      ? prefixWidget
                      : prefixIcon != null
                          ? IconButton(
                              onPressed: onPasswordToggle,
                              icon: Icon(
                                prefixIcon,
                                color: prefixIconColor,
                              ))
                          : null,
                  suffixIcon: suffixWidget != null
                      ? suffixWidget: suffixIcon != null ?
                  IconButton(
                          onPressed: onPasswordToggle,
                          icon: Icon(
                            suffixIcon,
                            color: suffixIconColor,
                          ))
                      : null)
              : decoration,
        ),
      ],
    );
  }
}
