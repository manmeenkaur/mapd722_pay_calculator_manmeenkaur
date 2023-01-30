import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app_constants.dart';
import 'pay_calculator.dart';

class PayCalculatorLayout extends StatefulWidget {
  const PayCalculatorLayout({super.key});

  @override
  State<PayCalculatorLayout> createState() => _PayCalculatorLayoutState();
}

class _PayCalculatorLayoutState extends State<PayCalculatorLayout> {
  PayCalculator controller = Get.put(PayCalculator());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _payCalculator(),
            const SizedBox(
              height: 20,
            ),
            _displayPersonalInformation(),
          ],
        ),
      ),
    );
  }

  _payCalculator() {
    return Expanded(
        child: Container(
      color: Colors.grey.shade400,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                color: Colors.white,
                child: TextField(
                  controller: controller.numberOfHours.value,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                  decoration: const InputDecoration(
                      hintText: "Number of Hours", border: InputBorder.none),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                color: Colors.white,
                child: TextField(
                  controller: controller.hourlyRate.value,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                  decoration: const InputDecoration(
                      hintText: "Hourly Rate", border: InputBorder.none),
                )),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () => controller.calculation(),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.only(
                      left: 45, right: 45, top: 10, bottom: 10),
                ),
                child: const Text(
                  "Calculate",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black),
                )),
            const SizedBox(
              height: 24,
            ),
            Obx(() {
              return Visibility(
                visible: controller.calculationFinished.value,
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 50, bottom: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Report",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 64,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Regular Pay: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Expanded(
                            child: Obx(() {
                              return Text(
                                controller.regularPay.value.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              );
                            }),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Overtime Pay: ",
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Expanded(
                            child: Obx(() {
                              return Text(
                                controller.overtimePay.value.toString(),
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              );
                            }),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total Pay: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Expanded(
                            child: Obx(() {
                              return Text(
                                controller.totalPay.value.toString(),
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              );
                            }),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Tax: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Expanded(
                            child: Obx(() {
                              return Text(
                                controller.tax.value.toString(),
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              );
                            }),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            })
          ],
        ),
      ),
    ));
  }

  _displayPersonalInformation() {
    return Container(
      color: Colors.grey.shade600,
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "Manmeen Kaur",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
          Text(
            "301259638",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          )
        ],
      ),
    );
  }
}
