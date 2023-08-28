import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fouda_portfolio/features/welcome/presentaion/viewmodels/welcome.viewmodel.dart';
import 'package:fouda_portfolio/features/welcome/presentaion/widgets/greetings_label.dart';
import 'package:fouda_portfolio/shared/widgets/error_notification.dart';
import 'package:fouda_portfolio/styles/colors.dart';
import 'package:fouda_portfolio/styles/personal_portfolio_icons.dart';

class WelcomePage extends ConsumerWidget {
  static const String route = "/welcome";
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var welcomeDataAsync = ref.watch(welcomePageViewModelProvider);

    return welcomeDataAsync.when(
      loading: () => const Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.white),
      )),
      error: (error, stackTrace) => ErrorNotification(
        message: error.toString(),
      ),
      data: (welcomeData) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // * Image Container
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: PersonalPortfolioColors.welcomePrimary,
                          width: 8),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          welcomeData.imgPath,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  // * Emoji Icon
                  const Icon(
                    PersonalPortfolioIcons.wave,
                    size: 90,
                    color: PersonalPortfolioColors.welcomeIcon,
                  ).animate(onPlay: (controller) {
                    controller.repeat(reverse: true);
                  }).rotate(
                    begin: -0.25,
                    end: 0,
                    duration: 0.5.seconds,
                    curve: Curves.easeInOut,
                  ),
                ],
              ),
              // * Greeting Text
              const GreetingsLabel(),
              // * Name Text
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontSize: 100,
                    color: Colors.white,
                  ),
                  children: [
                    const TextSpan(text: "I'm "),
                    TextSpan(
                      text: welcomeData.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // * Badge Icon
                  const Icon(
                    PersonalPortfolioIcons.badge,
                    color: PersonalPortfolioColors.welcomePrimary,
                    size: 80,
                  ),
                  const SizedBox(width: 20),
                  // * Title & Subtitle  Text
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        welcomeData.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        welcomeData.subTitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ]
                .animate(
                  interval: 100.ms,
                )
                .slideY(
                  begin: 1,
                  end: 0,
                  duration: 0.7.seconds,
                  curve: Curves.easeInOut,
                )
                .fadeIn(),
          ),
        );
      },
    );
  }
}
