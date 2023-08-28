import 'package:flutter/material.dart';
import 'package:fouda_portfolio/features/navigation/presentation/widgets/left_navigation.dart';
import 'package:fouda_portfolio/helpers/utils.dart';
import 'package:fouda_portfolio/shared/widgets/bganimation.dart';
import 'package:fouda_portfolio/shared/widgets/page.color.dart';
import 'package:fouda_portfolio/styles/colors.dart';

class PortfolioMainPage extends StatelessWidget {
  static const String route = '/main';
  final Widget child;
  const PortfolioMainPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Utils.mainScaffold,
        backgroundColor: PersonalPortfolioColors.mainBlue,
        body: Stack(
          children: [
            const PageColor(),
            const BgAnimation(),
            Center(child: child),
            const Align(
              alignment: Alignment.centerLeft,
              child: LeftNavigation(),
            ),
          ],
        ));
  }
}
