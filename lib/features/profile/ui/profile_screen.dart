import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/resources/index.dart';
import 'package:rashed/core/utils/navigator.dart';
import 'package:rashed/core/widgets/index.dart';
import 'package:rashed/features/home/cubit/home_cubit.dart';
import 'package:rashed/features/profile/services/contact_us.dart';
import 'package:rashed/features/profile/services/privacy_policy.dart';

import '../../auth/data/repositories/user_repository.dart';
import 'widgets/profile_action.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45.w),
      child: Column(
        children: [
          100.heightBox,
          AppText(translation: UserRepository.user?.name, style: AppTextStyles.bold_40),
          5.heightBox,
          AppText(translation: UserRepository.user?.email, style: AppTextStyles.bold_20, color: const Color(0xFF7E7C81)),
          70.heightBox,
          ProfileAction(onTap: () => context.read<HomeCubit>().selectNav(2), title: 'Settings', icon: AppImages.settings),
          40.heightBox,
          ProfileAction(onTap: () => pushName(AppRoutes.changePass), title: 'Change Password', icon: AppImages.lock),
          40.heightBox,
          ProfileAction(onTap: contactUs, title: 'Contact Us', icon: AppImages.mail),
          40.heightBox,
          ProfileAction(onTap: privacyPolicy, title: 'Privacy Policy', icon: AppImages.privacy),
        ],
      ),
    );
  }
}
