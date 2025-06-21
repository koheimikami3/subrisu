import '../../../importer.dart';

part 'in_app_review_provider.g.dart';

/// InAppReviewのインスタンスを提供するProvider
@riverpod
InAppReview inAppReview(Ref ref) => InAppReview.instance;
