import 'package:budgetmate/app/presentation/personal_profile/controller/personal_profile_controller.dart';
import 'package:budgetmate/app/shared/Constatnts.dart';
import 'package:budgetmate/app/shared/Functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class PersonalProfile extends StatefulWidget {
  const PersonalProfile({super.key});

  @override
  State<PersonalProfile> createState() => _PersonalProfileState();
}

class _PersonalProfileState extends State<PersonalProfile> {
  PersonalProfileController controller = Get.put(PersonalProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (PersonalProfileController controller) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            foregroundColor:
                controller.dataPresent ? Colors.white : Colors.black,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            title: const Text("Profile"),
            centerTitle: true,
          ),
          body: GetBuilder(
            init: controller,
            builder: (PersonalProfileController controller) {
              return FutureBuilder(
                future: controller.getUserProfile(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      controller.setDataPresent(true);
                    });
                    return Stack(
                      children: [
                        // Custom curved background at the top
                        ClipPath(
                          clipper: CurvedPainter(),
                          child: Container(
                            height:
                                300, // Adjust the height to match your desired curve
                            color: maincolor,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 120),
                          child: Column(
                            children: [
                              const SizedBox(
                                  height: 80), // Padding from the top
                              // Avatar, Name, and Username
                              Center(
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade300,
                                            blurRadius: 10,
                                            spreadRadius: -2,
                                            offset: const Offset(0, 3),
                                          )
                                        ],
                                      ),
                                      child: CircleAvatar(
                                        radius: 70,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.person,
                                          size: 70,
                                          color: maincolor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      controller.userProfile!.UserName,
                                      style: const TextStyle(
                                        fontSize: 29,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 12, bottom: 6),
                                            child: Text(
                                              "Email",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          TextFormField(
                                            readOnly: true,
                                            initialValue:
                                                controller.userProfile!.Email,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 12, left: 12, bottom: 6),
                                            child: Text(
                                              "Created On",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          TextFormField(
                                            readOnly: true,
                                            initialValue: controller.formatter
                                                .format(DateTime.parse(
                                                    controller.userProfile!
                                                        .CreationDate)),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                              // List tiles with icons
                            ],
                          ),
                        ),
                      ],
                    );
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              );
            },
          ),
        );
      },
    );
  }
}
