import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/resources/app_colors.dart';
import 'package:rashed/core/resources/app_images_path.dart';
import 'package:rashed/core/resources/app_text_styles.dart';
import 'package:rashed/core/utils/date_time_utils.dart';
import 'package:rashed/core/widgets/app_text_display.dart';
import 'package:rashed/core/widgets/custom_image_view.dart';

import '../../data/models/message.dart';

class AiMessage extends StatelessWidget {
  const AiMessage({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.textDark,
              border: Border.all(color: const Color(0xFFDDDDDD).withValues(alpha: .5), width: 1),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
            child: CustomImageView(imagePath: AppImages.book),
          ),
          12.widthBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFD6D2D2).withValues(alpha: 0.1),
                    border: Border.all(color: const Color(0xFFDDDDDD).withValues(alpha: .1), width: 1),
                    borderRadius: BorderRadius.circular(18.r).copyWith(bottomLeft: Radius.zero),
                  ),
                  padding: EdgeInsets.all(16.r),
                  child: AppText(text: message.content, style: AppTextStyles.medium_22, maxLines: 1000),
                ),
                11.heightBox,
                AppText(text: message.createdAt?.format(format: 'jm'), style: AppTextStyles.light_15, color: const Color(0xFFDDDDDD)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}