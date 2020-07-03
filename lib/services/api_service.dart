import 'package:bltCinemas/model/movie_model.dart';

class ApiService {
  List<Movie> _movies = [
    Movie(
      id: "1",
      title: "the Lion King",
      desc: "BLEEP BLLOOOP",
      nowShowing: true,
      comingSoon: false,
      poster: 'assets/images/lion_king.jpg',
      categories: ['action', 'kids', 'now showing'],
    ),
    Movie(
      id: "2",
      title: "the Lion King 2",
      desc: "BLEEP BLLOOOP",
      nowShowing: false,
      comingSoon: true,
      comingSoonDate: "18 juli",
      poster: 'assets/images/lion_king.jpg',
      categories: [
        'action',
        'kids',
        'coming soon',
      ],
    ),
  ];

  List<String> _categories = [
    "Now Showing",
    "Coming Soon",
    "Kids",
    "action",
    "Drama",
    "Comedy"
  ];

  List<Movie> getAllMovies() => _movies;
  List<String> getAllCategories() => _categories;
}
