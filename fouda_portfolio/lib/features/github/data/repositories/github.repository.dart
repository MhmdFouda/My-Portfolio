import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fouda_portfolio/features/github/data/models/github_page.model.dart';
import 'package:fouda_portfolio/features/github/data/repositories/igithub.repository.dart';
import 'package:fouda_portfolio/helpers/enums.dart';
import 'package:fouda_portfolio/shared/providers/shared_providers.dart';

class GithubRepository implements IGithubRepository {
  final Ref ref;

  GithubRepository(this.ref);

  @override
  Future<GithubPageModel> getGithubData() {
    return ref.read(dbProvider).getPageDataFromDB(
          GithubPageModel.fromDatabase,
          DatabaseCollections.pageContent.name,
          DatabaseDocs.githubPage.name,
        );
  }
}
