import 'package:fouda_portfolio/features/navigation/data/models/left_navigation_item.dart';

abstract class INavigationRepository {
  List<LeftNavigationItem> getDefaultNavItems();
}
