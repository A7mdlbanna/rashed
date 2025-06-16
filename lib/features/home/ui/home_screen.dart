import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/widgets/index.dart';
import 'package:rashed/core/resources/index.dart';
import 'package:rashed/features/home/cubit/home_cubit.dart';
import 'package:rashed/features/home/ui/widgets/action.dart';
import 'package:rashed/features/home/ui/widgets/card.dart';

import 'widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        appBar: const MyAppBar(title: 'RASHED'),
        bottomNavigationBar: const MyBottomNavBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(translation: 'Popular AI model', style: AppTextStyles.medium_32),
              25.heightBox,
              SizedBox(
                height: 436.44.h,
                child: Row(
                  children: [
                    HomeCard(
                      onTap: () {},
                      large: true,
                      color: AppColors.secondary,
                      icon: AppImages.star,
                      child: Column(
                        children: [
                          AppText(
                            translation: 'Using Your Voice Recordings to Discover Ideas',
                            style: AppTextStyles.medium_32,
                            color: AppColors.textDark,
                            maxLines: 4,
                          ),
                          16.heightBox,
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomImageView(imagePath: AppImages.glass, width: 100.w),
                              CustomImageView(imagePath: AppImages.voice, width: 42.w),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        HomeCard(
                          onTap: () {},
                          large: false,
                          color: AppColors.primaryDark,
                          icon: AppImages.image,
                          child: const ActionWidget(text: 'Search \nby image'),
                        ),
                        const Spacer(),
                        HomeCard(
                          onTap: () {},
                          large: false,
                          color: AppColors.primary,
                          icon: AppImages.chat,
                          child: const ActionWidget(text: 'Start \nnew chat'),
                        ),
                      ],
                    ),
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
