import 'package:assigment/app/modules/main/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/images.dart';
import '../../../core/app_colors.dart';

class SlaveUsers extends StatelessWidget {
  const SlaveUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30,
        ),
        GetBuilder<MainController>(builder: (controller) {
          return Expanded(
            child: Container(
              height: 211,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SlaveUsersBody(
                      amount: controller.slaveUsers[index].amount ?? "",
                      name: controller.slaveUsers[index].name ?? "",
                      lastTransactionDate:
                          controller.slaveUsers[index].lastTransactionDate ??
                              "",
                      containerColor:
                          controller.slaveUserContainerColor[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 15,
                    );
                  },
                  itemCount: controller.slaveUsers.length),
            ),
          );
        })
      ],
    );
  }
}

class SlaveUsersBody extends StatelessWidget {
  const SlaveUsersBody(
      {Key? key,
      required this.name,
      required this.amount,
       this.containerColor,
      required this.lastTransactionDate})
      : super(key: key);

  final String name;
  final String amount;
  final String lastTransactionDate;
  final Color? containerColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 211,
      width: 134,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.gray.withOpacity(.25),
                      blurRadius: 4.0,
                      spreadRadius: -1,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(13),
                      topRight: Radius.circular(13)),
                  color: containerColor??AppColors.orange
                ),
                width: double.maxFinite,
                height: 90,
                child: Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Column(
                    children: [
                      Text(name, style: Theme.of(context).textTheme.bodyText2!),
                      Text('Total Spending',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: AppColors.white,
                                  height: 1.2,
                                  fontSize: 12)),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.gray.withOpacity(.25),
                      blurRadius: 4.0,
                      spreadRadius: -1,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(13),
                      bottomLeft: Radius.circular(13)),
                  color: AppColors.white,
                ),
                width: double.maxFinite,
                height: 81,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  "EGP",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                          fontSize: 11, color: AppColors.black),
                                )),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              amount,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ],
                        ),
                        Text(
                          'Last update $lastTransactionDate',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: AppColors.black),
                        )
                      ],
                    )),
              ),
            ],
          ),
          Positioned(
            top: 0,
            child: CircleAvatar(
              radius: 30,
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
          ),
        ],
      ),
    );
  }
}
