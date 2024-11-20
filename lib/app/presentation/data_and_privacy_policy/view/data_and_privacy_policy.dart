import 'package:budgetmate/app/presentation/data_and_privacy_policy/controller/data_and_privacy_policy_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:markdown_widget/markdown_widget.dart';

class Dataandprivacypolicy extends StatelessWidget {
  Dataandprivacypolicy({super.key});

  final TocController markdownController = TocController();
  final DataAndPrivacyPolicyController controller =
      Get.put(DataAndPrivacyPolicyController());

  @override
  Widget build(BuildContext context) {
    const headerTextStyle = TextStyle(height: 2, fontWeight: FontWeight.w600);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Data & Privacy Policy",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SizedBox(
            width: 1000,
            child: FutureBuilder(
              future:
                  rootBundle.loadString('assets/markdown/privacy_policy.md'),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return MarkdownWidget(
                    config: MarkdownConfig(configs: [
                      const PConfig(textStyle: TextStyle(fontSize: 15)),
                      H1Config(style: headerTextStyle.copyWith(fontSize: 26)),
                      H2Config(style: headerTextStyle.copyWith(fontSize: 22)),
                      H3Config(style: headerTextStyle.copyWith(fontSize: 18)),
                      H4Config(style: headerTextStyle.copyWith(fontSize: 17)),
                      const TableConfig(
                        columnWidths: {0: FractionColumnWidth(0.25)},
                      ),
                      ListConfig(
                        marker: (isOrdered, depth, index) => const Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Icon(Icons.circle, size: 6),
                        ),
                      ),
                      LinkConfig(onTap: (url) => controller.handleLinks(url)),
                    ]),
                    data: snapshot.data!,
                    tocController: markdownController,
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}
