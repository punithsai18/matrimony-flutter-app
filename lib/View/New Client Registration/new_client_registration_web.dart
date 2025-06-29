import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Component/Forms/info_form_one.dart';
import 'package:bright_weddings/Component/Forms/info_form_two.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Component/footer.dart';
import '../../Helper/colors.dart';
import '../../Controller/new_registration_controller.dart';

class NewClientRegistrationWeb extends StatelessWidget {
  const NewClientRegistrationWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final NewRegistrationController controller = Get.find<NewRegistrationController>();

    return Scaffold(
      appBar: Header(
        onBack: () => Get.back(),
      ),
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600; // Adjust breakpoint for mobile

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Enable horizontal scrolling
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical, // Enable vertical scrolling
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: constraints.maxWidth, // Ensure it takes full width
                  minHeight: constraints.maxHeight, // Ensure it takes full height
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: isMobile ? 2.0.h : 4.0.h),
                      Obx(() {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: controller.currentFormIndex.value == 0
                                    ? const Offset(1, 0)
                                    : const Offset(-1, 0),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            );
                          },
                          child: Container(
                            width: isMobile ? double.infinity : 600, // Restrict width on larger screens
                            padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 32),
                            child: controller.currentFormIndex.value == 0
                                ? InfoFormOne(onNext: () {
                                    controller.currentFormIndex.value = 1;
                                  })
                                : InfoFormTwo(onBack: () {
                                    controller.currentFormIndex.value = 0;
                                  }),
                          ),
                        );
                      }),
                      SizedBox(height: isMobile ? 5.0.h : 10.0.h),
                      Footer(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
