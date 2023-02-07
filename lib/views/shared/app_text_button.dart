import 'package:flutter/material.dart';
import '../../../core/extensions/build_context_extension.dart';
import 'app_text.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.child,
      this.borderRadius,
      this.backgroundColor,
      this.fixedSize,
      this.textAlign,
      this.textStyle,
      this.padding})
      : assert(child == null, 'child is not null');
  final VoidCallback onPressed;
  final String? text;
  final Widget? child;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final Size? fixedSize;

  const AppTextButton.withChild(
      {super.key,
      required this.onPressed,
      required this.child,
      this.text,
      this.borderRadius,
      this.backgroundColor,
      this.fixedSize,
      this.textAlign,
      this.textStyle,
      this.padding})
      : assert(child != null, 'child cant be null'),
        assert(text == null && child != null, 'Assertion Error Message 2'),
        assert(textStyle == null && child != null, 'Assertion Error Message 3');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
            padding: padding,
            elevation: 0,
            fixedSize: fixedSize,
            backgroundColor: backgroundColor,
            tapTargetSize: MaterialTapTargetSize.padded,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 16))),
        onPressed: onPressed,
        child: child ??
            AppText(
              text: text ?? '',
              style: textStyle ?? context.appTextTheme.bodyMedium!,
              textAlign: textAlign,
            ),
      ),
    );
  }
}
