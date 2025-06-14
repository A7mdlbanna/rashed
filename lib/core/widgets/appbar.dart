import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/resources/index.dart';
import 'package:flutter/material.dart';

import 'app_text_display.dart';
import 'custom_image_view.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MyAppBar({super.key, this.back = true, this.centerTitle = false, this.title, this.actions, this.onBack, this.profile = true, this.leading});

  final void Function()? onBack;
  final bool back;
  final bool centerTitle;
  final String? title;
  final List<Widget>? actions;
  final bool profile;
  final String? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      bottom: AppBar(
        automaticallyImplyLeading: false,
        leading: back ? Container(
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: AppCorners.border_26,
          ),
          child: CustomImageView(
            imagePath: AppImages.back,
            onTap: onBack ?? () => Navigator.pop(context),
            width: 35.w,
            height: 25.h,
            fit: BoxFit.scaleDown,
          ),
        ) : null,
        centerTitle: centerTitle,
        title: AppText(translation: title, style: AppTextStyles.medium_40),
        actions: [
          ...?actions,
          50.widthBox,
        ],
      ),
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);
}
