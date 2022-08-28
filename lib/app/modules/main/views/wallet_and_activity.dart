import 'package:assigment/app/modules/main/controllers/main_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import '../../../core/images.dart';
import '../../../core/app_colors.dart';

class WalletAndActivity extends StatelessWidget {
  const WalletAndActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return Row(
        children: [
          Expanded(
            child: WalletAndActivityCard(
              icon: Image.asset(Images.wallet),
              headText: 'YOUR WALLET',
              price: controller.wallet?.amount ?? "",
              date:
                  'Last update ${controller.wallet?.lastTransactionDate ?? ""}',
              headerColor: AppColors.gray3,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: WalletAndActivityCard(
              icon: Image.asset(
                Images.payment,
                fit: BoxFit.cover,
              ),
              headText: 'LAST ACTIVITY',
              headerColor: AppColors.gray2,
              price: controller.activity?.amount ?? "",
              date:
                  'Transaction on ${controller.activity?.lastTransactionDate ?? ""}',
            ),
          ),
        ],
      );
    });
  }
}

class WalletAndActivityCard extends StatelessWidget {
  const WalletAndActivityCard(
      {Key? key,
      required this.headText,
      required this.price,
      required this.date,
      required this.headerColor,
      required this.icon})
      : super(key: key);
  final String headText;
  final String price;
  final String date;
  final Image icon;
  final Color headerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.gray.withOpacity(.25),
            blurRadius: 4.0,
            spreadRadius: -1,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13), topRight: Radius.circular(13)),
              color: headerColor,
            ),
            width: double.maxFinite,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 17),
              child: Center(
                child: Text(
                  headText,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 14, wordSpacing: 3, height: 1.3),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(13),
                    bottomRight: Radius.circular(13)),
                color: AppColors.white,
              ),
              width: double.maxFinite,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    children: [
                      SizedBox(height: 34, width: 34, child: icon),
                      Row(
                        children: [
                          RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                "EGP",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontSize: 14),
                              )),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            price,
                            style:
                                Theme.of(context).textTheme.headline1?.copyWith(
                                      height: 1.3,
                                    ),
                          ),
                        ],
                      ),
                      Text(date, style: Theme.of(context).textTheme.subtitle1)
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
