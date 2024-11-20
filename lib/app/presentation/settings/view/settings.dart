import 'package:budgetmate/app/presentation/settings/controller/settings_controller.dart';
import 'package:budgetmate/app/shared/Constatnts.dart';
import 'package:budgetmate/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());

    return Scaffold(
      backgroundColor: maincolor,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: maincolor,
        toolbarHeight: 90,
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                children: [
                  GetBuilder(
                    init: controller,
                    builder: (SettingsController controller) {
                      return Row(
                        children: [
                          Text(
                            "Currency",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          DropdownButton(
                            value: controller.currencyValue,
                            items: controller.currencyList,
                            onChanged: (value) {
                              prefs.setCurrency(value!);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text:
                            "Changing this option Requires an App Restart to Take Effect",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
