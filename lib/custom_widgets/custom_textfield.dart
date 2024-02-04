import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_iot/app/app_helper.dart';
import 'package:stacked_themes/stacked_themes.dart';

class CustomTextInputField extends StatefulWidget {
  const CustomTextInputField({
    this.onTap,
    this.ispassword = false,
    this.fieldlabel,this.prefixIcon,
    this.maxlines,
    this.textinputtype,
    this.maxlength,
    this.fieldcurve,
    this.bordercolor,
    this.topmargin,
    this.controller,
    this.isEmail = false,
    this.onChanged,
    this.isEnabled,
    this.autofocus,
    this.readOnly = false,
    this.filled = false,
    this.labelText,
    this.minLines,
    this.filledColor,
    required this.errorText,
    this.textCapitalization,this.floatingLabelBehavior,
    this.suffixIcon,
    Key? key,
  }) : super(key: key);

  final Function()? onTap;
  final Function(String value)? onChanged;
  final bool ispassword;
  final bool isEmail;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? isEnabled;
  final String? fieldlabel;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final TextInputType? textinputtype;
  final int? maxlines;
  final int? minLines;
  final int? maxlength;
  final double? fieldcurve;
  final double? topmargin;
  final Color? bordercolor;
  final bool? autofocus;
  final TextEditingController? controller;
  final TextCapitalization? textCapitalization;
  final String? errorText;
  final bool readOnly;
  final bool filled;
  final Color? filledColor;
  @override
  State<CustomTextInputField> createState() => _CustomTextInputFieldState();
}

class _CustomTextInputFieldState extends State<CustomTextInputField> {
  bool showpassword = true;
  @override
  Widget build(BuildContext context) {
    final ThemeManager themeManager = getThemeManager(context);
    return Container(
      margin: EdgeInsets.only(top: widget.topmargin ?? 10),
      child: TextField(
        style: Theme.of(context).textTheme.bodyMedium,
        autofocus: widget.autofocus ?? false,
        readOnly: widget.readOnly,
        enabled: widget.isEnabled,
        maxLines: widget.maxlines ?? 1,
        minLines: widget.minLines,
        maxLength: widget.maxlength,
        controller: widget.controller,
        onChanged: widget.onChanged ?? (value) {},
        obscureText: widget.ispassword ? showpassword : false,
        keyboardType: widget.textinputtype ?? TextInputType.text,
        // style: GlobalVariables.paragraph1.copyWith(fontSize: 16),
        textCapitalization:
        widget.textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
          floatingLabelBehavior: widget.floatingLabelBehavior,
          filled: widget.filled,
          labelText: widget.labelText,
          fillColor: widget.filledColor,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 21,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(widget.fieldcurve ?? 37),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(widget.fieldcurve ?? 37),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(widget.fieldcurve ?? 37),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              // color: widget.bordercolor ?? GlobalVariables.redColor,
            ),
            borderRadius: BorderRadius.circular(widget.fieldcurve ?? 37),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              // color: widget.bordercolor ?? GlobalVariables.redColor,
            ),
            borderRadius: BorderRadius.circular(widget.fieldcurve ?? 37),
          ),
          errorText: widget.errorText,
          suffix: widget.ispassword
              ? IconButton(
            padding: const EdgeInsets.symmetric(vertical: 0),
            constraints: const BoxConstraints(),
            iconSize: 20,
            // color: GlobalVariables.greyColor,
            onPressed: () {
              setState(() {
                showpassword = !showpassword;
              });
            },
            icon: !showpassword
                ?  SvgPicture.asset(
              AppHelpers.svg_visibility_icon,
              color: AppHelpers.grey500,
            )
                : const Icon(
              Icons.visibility_off,
              color: AppHelpers.grey500,
            ),
          )
              : widget.isEmail
              ? SizedBox(
            child: widget.errorText != null
                ? const Icon(
              Icons.error_outline,
              // color: GlobalVariables.redColor,
            )
                : const SizedBox(),
          )
              : const SizedBox(),
          hintText: widget.fieldlabel ?? '',
          // hintStyle: GlobalVariables.paragraph1.copyWith(
          //   fontSize: 16,
          // ),
        ),
      ),
    );
  }
}
