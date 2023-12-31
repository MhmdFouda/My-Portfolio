import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fouda_portfolio/features/welcome/data/models/welcome_page.model.dart';
import 'package:fouda_portfolio/features/welcome/data/repositories/iwelcome.repository.dart';
import 'package:fouda_portfolio/helpers/enums.dart';
import 'package:fouda_portfolio/shared/providers/shared_providers.dart';

class WelcomeRepository implements IWelcomeRepository {
  final Ref ref;

  WelcomeRepository(this.ref);

  @override
  Future<WelcomePageModel> getWelcomePageData() {
    return ref.read(dbProvider).getPageDataFromDB(
          WelcomePageModel.fromDatabase,
          DatabaseCollections.pageContent.name,
          DatabaseDocs.welcomePage.name,
        );
  }
}
