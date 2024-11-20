import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:budgetmate/app/presentation/statistics/model/statistics_model.dart';
import 'package:budgetmate/app/shared/Constatnts.dart';
import 'package:budgetmate/app/shared/Enums.dart';
import 'package:budgetmate/app/shared/Extensions.dart';
import 'package:budgetmate/main.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class StatisticsController extends GetxController {
  ScreenshotController screenshotController = ScreenshotController();

  StatisticsModel stats = StatisticsModel();
  TimePeriodStats timePeriodStats = TimePeriodStats();
  List<String> timePeriods = ["Day", "Week", "Month", "Year"];
  int activatedTimePeriod = 0;

  bool categoriesSortedDEC = true;
  bool isExpenseSelected = true;

  List<PieChartSectionData>? pieChartSections = [];

  Uint8List? screenshot;

  Future<StatisticsModel?> fetchStatistics() async {
    var tmpstats = await dioHelper.getStatistics();
    stats = tmpstats!;
    setActivatedTimePeriod(activatedTimePeriod);
    print("Statistics Fetched and Stored in model");
    return stats;
  }

  Future<void> setSelectedTransactionType(bool isExpense) async {
    if (isExpenseSelected != isExpense) {
      isExpenseSelected = isExpense;
    }
    setPieChartSections();
    update();
  }

  void setActivatedTimePeriod(int index) {
    activatedTimePeriod = index;
    if (index == 0) {
      timePeriodStats = stats.daily!;
    } else if (index == 1) {
      timePeriodStats = stats.weekly!;
    } else if (index == 2) {
      timePeriodStats = stats.monthly!;
    } else if (index == 3) {
      timePeriodStats = stats.yearly!;
    }
    if (isExpenseSelected) {
      timePeriodStats.categoryWiseSpending =
          (timePeriodStats.categoryWiseSpending!
            ..sort((a, b) => categoriesSortedDEC
                ? -a.totalSpent!.compareTo(b.totalSpent!)
                : a.totalSpent!.compareTo(b.totalSpent!)));
    } else {
      timePeriodStats.categoryWiseIncome = (timePeriodStats.categoryWiseIncome!
        ..sort((a, b) => categoriesSortedDEC
            ? -a.totalSpent!.compareTo(b.totalSpent!)
            : a.totalSpent!.compareTo(b.totalSpent!)));
    }

    setPieChartSections();
    update();
  }

  void setSortDirection() {
    categoriesSortedDEC = !categoriesSortedDEC;
    if (isExpenseSelected) {
      timePeriodStats.categoryWiseSpending =
          (timePeriodStats.categoryWiseSpending!
            ..sort((a, b) => categoriesSortedDEC
                ? -a.totalSpent!.compareTo(b.totalSpent!)
                : a.totalSpent!.compareTo(b.totalSpent!)));
    } else {
      timePeriodStats.categoryWiseIncome = (timePeriodStats.categoryWiseIncome!
        ..sort((a, b) => categoriesSortedDEC
            ? -a.totalSpent!.compareTo(b.totalSpent!)
            : a.totalSpent!.compareTo(b.totalSpent!)));
    }
    setPieChartSections();
    update();
  }

  void setPieChartSections() {
    pieChartSections!.clear();
    if (isExpenseSelected) {
      setPieChartSectionsExpense();
    } else {
      setPieChartSectionsIncome();
    }
  }

  void setPieChartSectionsExpense() {
    if (timePeriodStats.categoryWiseSpending!.isEmpty) {
      pieChartSections!.add(
        PieChartSectionData(
          value: 100,
          title: '100 %',
          titleStyle: TextStyle(fontWeight: FontWeight.w600),
          titlePositionPercentageOffset: 1.7,
          color: maincolor,
        ),
      );
    } else {
      for (var category in timePeriodStats.categoryWiseSpending!) {
        var chartValue = Precision(
                (category.totalSpent! / timePeriodStats.totalExpenses!) * 100)
            .toPrecision(2);
        pieChartSections!.add(
          PieChartSectionData(
            value: chartValue,
            title: '$chartValue %',
            titleStyle: TextStyle(fontWeight: FontWeight.w600),
            titlePositionPercentageOffset: 1.7,
            color: TransactionExpenseCategory.values
                .where((e) => category.category == e.idx)
                .first
                .color,
          ),
        );
      }
    }
  }

  void setPieChartSectionsIncome() {
    if (timePeriodStats.categoryWiseIncome!.isEmpty) {
      pieChartSections!.add(
        PieChartSectionData(
          value: 100,
          title: '100 %',
          titleStyle: TextStyle(fontWeight: FontWeight.w600),
          titlePositionPercentageOffset: 1.7,
          color: maincolor,
        ),
      );
    } else {
      for (var category in timePeriodStats.categoryWiseIncome!) {
        var chartValue = Precision(
                (category.totalSpent! / timePeriodStats.totalIncome!) * 100)
            .toPrecision(2);
        pieChartSections!.add(
          PieChartSectionData(
            value: chartValue,
            title: '$chartValue %',
            titleStyle: TextStyle(fontWeight: FontWeight.w600),
            titlePositionPercentageOffset: 1.7,
            color: TransactionIncomeCategory.values
                .where((e) => category.category == e.idx)
                .first
                .color,
          ),
        );
      }
    }
  }

  void takeScreenShot() {
    screenshotController.capture().then((Uint8List? image) async {
      // Check if the image is null
      if (image != null) {
        // Capture Done
        screenshot = image;
        update();
        await saveImageToGallery(image);
        if (!Get.isSnackbarOpen) {
          Get.snackbar("ScreenShot Saved", "ScreenShot Saved to Gallery",
              backgroundColor: Colors.grey, colorText: Colors.white);
        }
      } else {
        print("Screenshot capture returned null.");
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<void> saveImage(Uint8List image) async {
    try {
      final directory = await getApplicationDocumentsDirectory();

      String filePath =
          '${directory.path}/screenshot_${DateTime.now().millisecondsSinceEpoch}.png';

      File file = File(filePath);
      await file.writeAsBytes(image);

      print("Screenshot saved at: $filePath");
    } catch (e) {
      print("Error saving screenshot: $e");
    }
  }

  Future<void> saveImageToGallery(Uint8List image) async {
    try {
      // Create a temporary file in the app's directory to save the Uint8List
      final directory = await getTemporaryDirectory();
      String filePath =
          '${directory.path}/screenshot_${DateTime.now().millisecondsSinceEpoch}.png';

      // Write the screenshot to the temporary file
      File tempFile = File(filePath);
      await tempFile.writeAsBytes(image);

      // Use GallerySaver to save the file to the gallery
      // await GallerySaver.saveImage(filePath, albumName: 'BudgetMate');
      // await ImageGallerySaver.saveFile(filePath);
      await ImageGallerySaverPlus.saveFile(filePath);

      print("Screenshot saved to gallery at path: $filePath");

      // Optionally, delete the temporary file
      await tempFile.delete();
    } catch (e) {
      print("Error saving screenshot to gallery: $e");
    }
  }
}
