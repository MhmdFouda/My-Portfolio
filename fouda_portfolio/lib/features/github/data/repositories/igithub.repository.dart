import 'package:fouda_portfolio/features/github/data/models/github_page.model.dart';

abstract class IGithubRepository {
  Future<GithubPageModel> getGithubData();
}
