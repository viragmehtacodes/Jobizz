// ignore_for_file: inference_failure_on_function_invocation

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:job_search_app/constants/strings.dart';
import 'package:job_search_app/features/auth/data/controllers/auth_functions.dart';
import 'package:job_search_app/features/widgets/profile_header.dart';
import 'package:job_search_app/services/response.dart';
import 'package:job_search_app/themes/color_styles.dart';
import 'package:provider/provider.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final profilePic = context.read<ResponseService>().user.photoURL;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProfileHeader(
              lightWelcomeText: StaticText.welcomeBackProfile.tr,
            ),
            GestureDetector(
              onTap: () {
                Get.defaultDialog(
                  title: 'Sign out',
                  middleText: 'Do you really want to sign out?',
                  textCancel: 'No',
                  textConfirm: 'Yes',
                  confirmTextColor: ColorStyles.pureWhite,
                  onConfirm: () {
                    AuthFunctions.signOutUser(context);
                  },
                );
              },
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  profilePic ?? "",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
