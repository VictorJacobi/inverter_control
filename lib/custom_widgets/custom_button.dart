import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.onPressed,
      this.width,
      this.text,
      this.textwidget,
      this.color,
        this.isBusy=false,
      this.disabled = false})
      : super(key: key);
  final void Function()? onPressed;
  final String? text;
  final Color? color;
  final bool isBusy;
  final bool? disabled;
  final double? width;
  final Widget? textwidget;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width??200.0,
      onPressed: isBusy?(){}:onPressed,
      elevation: 5.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        child: textwidget ??
            Text(
              text??'',
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  // color: disabled == false
                  //     ? Colors.white
                  //     : const Color(0xFF210639),
              ),
            ),
      ),
    );
  }
}
