import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fouda_portfolio/features/linkedin/presentaion/responsiveness/linkedin_page_responsive.config.dart';
import 'package:fouda_portfolio/features/linkedin/presentaion/viewmodels/linkedin.viewmodel.dart';
import 'package:fouda_portfolio/helpers/responsive_ui_helper.dart';
import 'package:fouda_portfolio/shared/widgets/error_notification.dart';
import 'package:fouda_portfolio/styles/colors.dart';

class LinkedInPage extends ConsumerWidget {
  static const String route = "/linkedin";
  const LinkedInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiConfig = context.uiConfig<LinkedInPageResponsiveConfig>();
    final linkedindata = ref.watch(linkedinViewModelProvider);
    return linkedindata.when(
        loading: () => const Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            )),
        error: (error, stackTrace) =>
            ErrorNotification(message: error.toString()),
        data: (data) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(data.icon,
                      size: uiConfig.iconSize,
                      color: PersonalPortfolioColors.linkedInIcon)
                  .animate(
                onPlay: (controller) {
                  controller.repeat(reverse: true);
                },
              ).scaleXY(
                      begin: 0.8,
                      end: 1,
                      duration: 1.seconds,
                      curve: Curves.easeInOut),
              Text(data.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: uiConfig.titleSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    // Utils.launchUrlLink(data.url);
                  },
                  child: Container(
                    margin: uiConfig.buttonMargin,
                    padding: uiConfig.buttonPadding,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(40)),
                    child: Text(data.subTitle,
                        style: TextStyle(
                            fontSize: uiConfig.buttonLabelSize,
                            color: Colors.white)),
                  ),
                ),
              )
            ]
                .animate(interval: 100.ms)
                .slideY(
                    begin: 1,
                    end: 0,
                    duration: 0.5.seconds,
                    curve: Curves.easeInOut)
                .fadeIn(),
          ));
        });
  }
}
