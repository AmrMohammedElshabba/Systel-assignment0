import 'package:assigment/app/modules/main/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/conts_txt.dart';
import '../../../core/images.dart';

class MainUserPicAndName extends StatelessWidget {
  MainUserPicAndName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                Images.user,
                fit: BoxFit.contain,
              )),
        ),
        SizedBox(
          width: 23,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Evening,',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontFamily: compactRegular),
            ),
            GetBuilder<MainController>(builder: (controller) {
              return SizedBox(
                width: 180,
                child: Text(
                  controller.mainUser?.username ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                ),
              );
            })
          ],
        )
      ],
    );
  }
}
