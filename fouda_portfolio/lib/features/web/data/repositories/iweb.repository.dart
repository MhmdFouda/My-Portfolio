import 'package:fouda_portfolio/features/web/data/models/web_page.model.dart';

abstract class IWebRepository {
  Future<WebPageModel> getWebData();
}
