import 'dart:io';

import 'package:budgetmate/app/shared/Enums.dart';
import 'package:budgetmate/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddincomeController extends GetxController {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  DateTime? selectedDate;

  String? dropdownValue;
  DateTime? dateTime;

  File? invoiceFile;

  // Helper method to build a framed icon
  Widget buildFramedIcon(IconData icon, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xfff0f6f5), // Background color for the frame
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }

  String formNum(String s) {
    return NumberFormat.compactSimpleCurrency().format(
      num.parse(s),
    );
  }

  Future pickImage() async {
    try {
      bool? isCamera = await Get.dialog(
        AlertDialog(
          title: Text("Invoice Source"),
          content: Text("Please choose the Source for the Invoice"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(result: true);
              },
              child: Text("Camera"),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Get.back(result: false);
              },
              child: Text("Gallery "),
            ),
          ],
        ),
      );

      if (isCamera == null) return;

      final image = await ImagePicker().pickImage(
          source: isCamera ? ImageSource.camera : ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      invoiceFile = imageTemp;
      update();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> addIncome() async {
    MultipartFile? invoice = invoiceFile != null
        ? await MultipartFile.fromFile(invoiceFile!.path)
        : null;
    var income = {
      "Type": 0,
      "Amount": num.parse(amountController.text),
      "Category": TransactionIncomeCategory.values
          .byName(dropdownValue!.replaceAll(" ", "_"))
          .idx,
      "Description": descriptionController.text,
      "Date": dateTime != null
          ? dateTime!.toIso8601String()
          : DateTime.now().toIso8601String(),
      "Invoice": invoiceFile != null ? invoice : null
    };
    var result = await dioHelper.addTransaction(income);
    if (result!.statusCode == 200) {
      Get.back();
    }
  }
}
