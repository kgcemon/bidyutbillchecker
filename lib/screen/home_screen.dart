import 'package:bidyutbillchecker/widget/container_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../controller/bill_screen_controller.dart';
import '../utills/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _getdata();
  }

  void _getdata() async {
    await Get.find<BillScreenControllers>().fetchBidyutBillModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Your Bill Information",
          style: TextStyle(color: AppColors.appTextColor),
        ),
      ),
      body: GetBuilder<BillScreenControllers>(
        builder: (controller) {
          var allBill = controller.billList;
          return controller.billList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppColors.appTextColor,
                ))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ContainerBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.person,
                              size: 60,
                              color: AppColors.appTextColor,
                            ),
                            FittedBox(
                                child: Row(
                              children: [
                                Text(
                                  "নামঃ",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  allBill[0]
                                      .customerInfo[0][0]
                                      .customerName
                                      .name
                                      .replaceAll("_", " "),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            )),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "ঠিকানাঃ",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  allBill[0]
                                      .customerInfo[0][0]
                                      .descr
                                      .name
                                      .replaceAll("_", " "),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  allBill[0].customerInfo[0][0].address,
                                  style: const TextStyle(
                                      fontSize: 8, color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "মিটার লাগানোর সময়ঃ",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  allBill[0]
                                      .customerInfo[0][0]
                                      .meterInstallDate
                                      .toString()
                                      .split(" ")[0],
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "বিল দেওয়া শুরুঃ",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  allBill[0].customerInfo[0][0].startBillCycle,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "সর্বশেষ বিল দেওয়ার তারিখঃ",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  allBill[0].customerInfo[0][0].billCycleCode,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 5,
                            ),
                            FittedBox(
                                child: Row(
                              children: [
                                Text(
                                  "সর্বশেষ বিলঃ",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '${allBill[0].finalBalanceInfo.split(",")[0]}৳',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "বিল দেওয়ার ইতিহাসঃ",
                          style: TextStyle(color: AppColors.appTextColor),
                        ),
                      ),
                      ContainerBox(
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => ListTile(
                                  leading: Text(
                                      'KWH ${allBill[0].billInfo[index].consKwhSr.toString()}',
                                      style: TextStyle(
                                          color: AppColors.appTextColor)),
                                  subtitle: Text(
                                    'Paid ${allBill[0].billInfo[index].paidAmt.toString()}৳',
                                    style: const TextStyle(
                                        color: Colors.green),
                                  ),
                                  trailing: Text(
                                      'Balance: ${allBill[0].billInfo[index].balance.toString()}৳',
                                      style: TextStyle(
                                          color: AppColors.appTextColor)),
                                  title: Text(
                                    allBill[0]
                                        .billInfo[index]
                                        .billMonth
                                        .toString()
                                        .split(" ")[0]
                                        .toString(),
                                    style: TextStyle(
                                        color: AppColors.appTextColor),
                                  ),
                                ),
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: allBill[0].billInfo.length),
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
