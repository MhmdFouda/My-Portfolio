import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fouda_portfolio/features/linkedin/presentaion/viewmodels/linkedin.viewmodel.dart';
import 'package:fouda_portfolio/shared/widgets/error_notification.dart';
import 'package:fouda_portfolio/styles/colors.dart';
import 'package:fouda_portfolio/styles/personal_portfolio_icons.dart';

class LinkedInPage extends ConsumerWidget {
  static const String route = "/linkedin";
  const LinkedInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final linkedindata = ref.watch(linkedinViewModelProvider);
    return linkedindata.when(
        error: (error, stackTrace) => ErrorNotification(
              message: error.toString(),
            ),
        loading: () => const Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            )),
        data: (data) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  size: 90,
                  PersonalPortfolioIcons.linkedin,
                  color: PersonalPortfolioColors.linkedInIcon,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  data.title,
                  style: const TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: PersonalPortfolioColors.textColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  data.subTitle,
                  style: const TextStyle(
                    fontSize: 60,
                    color: PersonalPortfolioColors.linkedInIcon,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: const BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.all(
                      Radius.circular(48),
                    ),
                  ),
                  child: Text(
                    data.handle,
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white60,
                    ),
                  ),
                )
              ]
                  .animate(
                    interval: 100.ms,
                  )
                  .slideY(
                    begin: 1,
                    end: 0,
                    curve: Curves.easeInOut,
                    duration: 0.5.seconds,
                  )
                  .fadeIn(),
            ),
          );
        });
  }
}