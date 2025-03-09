import '../../../importer.dart';

part 'in_app_review_provider.g.dart';

/// InAppReviewのProvider
@riverpod
InAppReview inAppReview(Ref ref) => InAppReview.instance;
