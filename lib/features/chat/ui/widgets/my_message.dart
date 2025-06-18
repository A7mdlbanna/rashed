import 'package:flutter/cupertino.dart';
import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/resources/app_colors.dart';
import 'package:rashed/core/resources/app_images_path.dart';
import 'package:rashed/core/resources/app_text_styles.dart';
import 'package:rashed/core/utils/date_time_utils.dart';
import 'package:rashed/core/widgets/app_text_display.dart';

import '../../data/models/message.dart';

class MyMessage extends StatelessWidget {
  const MyMessage({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              image: DecorationImage(image: AssetImage(AppImages.mesh1), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(18.r).copyWith(bottomRight: Radius.zero),
            ),
            padding: EdgeInsets.all(16.r),
            child: AppText(text: message.content, style: AppTextStyles.medium_22, color: AppColors.textDark),
          ),
          11.heightBox,
          AppText(text: message.createdAt?.format(format: 'jm'), style: AppTextStyles.light_15, color: const Color(0xFFDDDDDD)),
        ],
      ),
    );
  }
}
