import 'package:budgetmate/app/presentation/register/controller/register_controller.dart';
import 'package:budgetmate/config/route/AppRoutes.dart';
import 'package:budgetmate/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: controller.key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox.fromSize(
                      size: const Size(double.infinity, 105),
                    ),
                    const Center(
                      child: Text(
                        "BudgetMate",
                        style: TextStyle(
                            color: Color(0xFF3E7C78),
                            fontWeight: FontWeight.bold,
                            fontSize: 50),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(36, 60, 10, 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create an Account",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Manage Your FInancial Expenses today",
                            style: TextStyle(
                                color: Color(0xFF999EA1), fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 6),
                                child: Text(
                                  "Username",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              TextFormField(
                                controller: controller.usernameController,
                                validator: (value) =>
                                    controller.validateUsername(value!),
                                style: const TextStyle(fontSize: 14),
                                decoration: InputDecoration(
                                    hintText: "Please Enter Your Username",
                                    hintStyle: const TextStyle(
                                        color: Color(0xFF1F1F1F)),
                                    errorText: controller.usernameError,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 6, 30, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 6),
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              TextFormField(
                                controller: controller.emailController,
                                validator: (value) =>
                                    controller.validateEmail(value!),
                                style: const TextStyle(fontSize: 14),
                                decoration: InputDecoration(
                                    hintText: "Please Enter Your Email",
                                    hintStyle: const TextStyle(
                                        color: Color(0xFF1F1F1F)),
                                    errorText: controller.emailError,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 6, 30, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 6),
                                child: Text(
                                  "Password",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Obx(
                                () => TextFormField(
                                  controller: controller.passwordController,
                                  validator: (value) =>
                                      controller.validatePassword(value!),
                                  style: const TextStyle(fontSize: 14),
                                  obscureText:
                                      !controller.passwordVisible.value,
                                  decoration: InputDecoration(
                                      hintText: "Please Enter Your Password",
                                      hintStyle: const TextStyle(
                                          color: Color(0xFF1F1F1F)),
                                      errorText: controller.passwordError,
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            controller.passwordVisible.value =
                                                !controller
                                                    .passwordVisible.value;
                                          },
                                          icon: Icon(
                                              controller.passwordVisible.value
                                                  ? Icons.visibility
                                                  : Icons.visibility_off)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 6, 30, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 6),
                                child: Text(
                                  "Password Confirmation",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Obx(
                                () => TextFormField(
                                  controller:
                                      controller.passwordConfirmationController,
                                  validator: (value) => controller
                                      .validatePasswordConfirmation(value!),
                                  style: const TextStyle(fontSize: 14),
                                  obscureText:
                                      !controller.passwordVisible.value,
                                  decoration: InputDecoration(
                                      hintText: "Please Confirm Your Password",
                                      hintStyle: const TextStyle(
                                          color: Color(0xFF1F1F1F)),
                                      errorText:
                                          controller.passwordConfirmationError,
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              controller.passwordVisible.value =
                                                  !controller
                                                      .passwordVisible.value;
                                            });
                                          },
                                          icon: Icon(
                                              controller.passwordVisible.value
                                                  ? Icons.visibility
                                                  : Icons.visibility_off)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                            child: Container(
                              width: 360,
                              height: 67,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    offset: const Offset(
                                        0, 9), // changes position of shadow
                                  ),
                                ],
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff5e9d98),
                                      Color(0xff5b9b96),
                                      Color(0xff549691),
                                      Color(0xff498e89),
                                      Color(0xff428984),
                                      Color(0xff3f8782),
                                    ]),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0)),
                              ),
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (controller.key.currentState!.validate()) {
                                    var result = await dioHelper.register(
                                        controller.usernameController.text,
                                        controller.emailController.text,
                                        controller.passwordController.text);
                                    if (result!.statusCode == 200) {
                                      Get.offAllNamed(AppRoutes.login);
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Ink(
                                    child: const Text(
                                  "Sign Up",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Text("Already Have an Account?"),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.offAndToNamed(AppRoutes.login);
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Color(0xFF160062),
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}