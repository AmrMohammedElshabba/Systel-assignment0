import 'package:assigment/app/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Color? textColor;
  Color? containerColor;
  VoidCallback? onTap;
  String? title;
  double? fontSize;
  String? fontFamily;
  Color? borderColor;
  IconData? icon;
  double? height;

  CustomButton({
    Key? key,
    this.containerColor,
    this.textColor = Colors.white,
    this.onTap,
    this.fontFamily,
    this.borderColor,
    this.fontSize,
    this.height,
    this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height??54,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: containerColor ?? Theme.of(context).primaryColor),
        child: icon == null
            ? Center(
                child: Text(
                  title!,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: fontSize,
                        color: textColor ?? Theme.of(context).canvasColor,
                        fontFamily: fontFamily,
                      ),
                ),
              )
            : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            title!,
                            style: Theme.of(context).textTheme.headline4!.copyWith(
                                  fontSize: fontSize,
                                  color: textColor ?? Theme.of(context).canvasColor,
                                  fontFamily: fontFamily,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            icon,
                            size: 20,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
            ),
      ),
    );
  }
}
