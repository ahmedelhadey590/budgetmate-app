import 'package:budgetmate/app/shared/Constatnts.dart';
import 'package:budgetmate/app/shared/Enums.dart';
import 'package:budgetmate/app/shared/Functions.dart';
import 'package:budgetmate/app/presentation/add_income/controller/add_Income_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile;
import 'package:intl/intl.dart';

class AddIncomePage extends StatefulWidget {
  const AddIncomePage({super.key});

  @override
  _AddIncomePageState createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
  AddincomeController controller = Get.put(AddincomeController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: const Text("Add Income"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Green curved background
          ClipPath(
            clipper: CurvedPainter(),
            child: Container(
              height: 300, // Adjust the height to match your desired curve
              color: maincolor,
            ),
          ),

          // Scrollable content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center the column contents
              children: [
                // White card with shadow
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
                  child: Form(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // White card
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(64, 0, 0, 0),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 5), // Shadow position
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "CATEGORY",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 5, 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      controller.buildFramedIcon(
                                          Icons.arrow_circle_down_rounded,
                                          Colors.green),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: DropdownButtonFormField(
                                            hint: const Text(
                                              "please choose a category",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            decoration: const InputDecoration(
                                                border: InputBorder.none),
                                            items: TransactionIncomeCategory
                                                .values
                                                .map((e) => e.name)
                                                .toList()
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              value =
                                                  value.replaceAll("_", " ");
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (String? value) {
                                              setState(() {
                                                controller.dropdownValue =
                                                    value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "AMOUNT",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 5, 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      controller.buildFramedIcon(
                                          Icons.attach_money_rounded,
                                          Colors.green),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: TextFormField(
                                            controller:
                                                controller.amountController,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                              hintText: "0.00",
                                              hintStyle: TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "DESCRIPTION",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: TextField(
                                    controller:
                                        controller.descriptionController,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: const InputDecoration(
                                      hintText:
                                          "please enter a brief description",
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.normal),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "DATE",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 5, 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2101),
                                          ).then((selectedDate) {
                                            // After selecting the date, display the time picker.
                                            if (selectedDate != null) {
                                              showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                              ).then((selectedTime) {
                                                // Handle the selected date and time here.
                                                if (selectedTime != null) {
                                                  DateTime selectedDateTime =
                                                      DateTime(
                                                    selectedDate.year,
                                                    selectedDate.month,
                                                    selectedDate.day,
                                                    selectedTime.hour,
                                                    selectedTime.minute,
                                                  );
                                                  setState(() {
                                                    controller.dateTime =
                                                        selectedDateTime;
                                                    controller.dateController
                                                            .text =
                                                        "${selectedDateTime.day}/${selectedDateTime.month}/${selectedDateTime.year} ${DateFormat("h:mma").format(selectedDateTime)}";
                                                  });
                                                }
                                              });
                                            }
                                          });
                                        },
                                        child: controller.buildFramedIcon(
                                            Icons.calendar_today, Colors.black),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: TextFormField(
                                            controller:
                                                controller.dateController,
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "DD/MM/YYYY hh:mm",
                                              hintStyle: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal),
                                              suffixIconConstraints:
                                                  const BoxConstraints(
                                                      maxHeight: 40,
                                                      maxWidth: 60),
                                              suffixIcon: TextButton(
                                                  onPressed: () {
                                                    controller.dateController
                                                        .clear();
                                                  },
                                                  child: const Text("Clear")),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            // Centered Add Invoice button
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "INVOICE",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.pickImage();
                                    },
                                    child: Center(
                                      child: GetBuilder(
                                        init: controller,
                                        builder:
                                            (AddincomeController controller) {
                                          return controller.invoiceFile == null
                                              ? const Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(Icons
                                                            .add_circle_rounded),
                                                        Text('Add Invoice')
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Image.file(
                                                      controller.invoiceFile!),
                                                );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 50),
                            Center(
                              child: ElevatedButton(
                                onPressed: () async {
                                  // Add Income logic
                                  controller.addIncome();
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(width * 0.79, 50),
                                  backgroundColor: const Color(0xff428681),
                                ),
                                child: const Text(
                                  'Add Income',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
