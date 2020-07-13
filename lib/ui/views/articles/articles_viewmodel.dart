import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/model/article_model.dart';
import 'package:bltCinemas/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class ArticlesViewModel extends StreamViewModel<List<Article>> {
  FirestoreService _firestoreService = locator<FirestoreService>();
  @override
  Stream<List<Article>> get stream =>
      _firestoreService.listenToArticlesStream();
}
