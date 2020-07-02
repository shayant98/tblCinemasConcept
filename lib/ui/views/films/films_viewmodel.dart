import 'package:stacked/stacked.dart';

class FilmsViewModel extends BaseViewModel {
  List<String> _categories = [
    "Now Showing",
    "Coming Soon",
    "Kids",
    "action",
    "Drama",
    "Comedy"
  ];

  List<String> get categories => _categories;
}
