import 'package:budgetmate/app/presentation/more_options/controller/more_options_controller.dart';
import 'package:budgetmate/app/shared/Constatnts.dart';
import 'package:budgetmate/app/shared/Functions.dart';
import 'package:budgetmate/app/widgets/custom_list_tile.dart';
import 'package:budgetmate/config/route/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreOptionsPage extends StatelessWidget {
  MoreOptionsPage({super.key});

  final MoreOptionsController controller = Get.put(MoreOptionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: const Text("More Options"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Custom curved background at the top
          ClipPath(
            clipper: CurvedPainter(),
            child: Container(
              height: 300, // Adjust the height to match your desired curve
              color: maincolor,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                const SizedBox(height: 80), // Padding from the top
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
                      SizedBox(
                        width: 188,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  const Color.fromARGB(221, 19, 19, 19),
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            Get.toNamed(AppRoutes.personalProfile);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  controller.name,
                                  style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                const Icon(
                                  Icons.navigate_next_rounded,
                                  size: 30,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // List tiles with icons
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      CustomListTile(
                        onTap: controller.inviteFriends,
                        icon: Icons.share_rounded,
                        title: 'Invite Friends',
                      ),
                      const Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                      CustomListTile(
                        onTap: controller.sendFeedback,
                        icon: Icons.mail,
                        title: 'Feedback & Suggestions',
                      ),
                      CustomListTile(
                        onTap: controller.goToSettingsPage,
                        icon: Icons.settings,
                        title: 'Settings',
                      ),
                      CustomListTile(
                        onTap: controller.goToDataAndPrivacyPage,
                        icon: Icons.privacy_tip,
                        title: 'Data and Privacy',
                      ),
                      CustomListTile(
                        onTap: controller.promptLogout,
                        icon: Icons.logout_rounded,
                        title: 'Logout',
                      ),
                    ],
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
