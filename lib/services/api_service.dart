import 'package:bltCinemas/model/movie_model.dart';

class ApiService {
  List<Movie> _movies = [
    Movie(
      id: "TheLionKing",
      title: "The Lion King",
      desc:
          "This Disney animated feature follows the adventures of the young lion Simba (Jonathan Taylor Thomas), the heir of his father, Mufasa (James Earl Jones). Simba's wicked uncle, Scar (Jeremy Irons), plots to usurp Mufasa's throne by luring father and son into a stampede of wildebeests. But Simba escapes, and only Mufasa is killed. Simba returns as an adult (Matthew Broderick) to take back his homeland from Scar with the help of his friends Timon (Nathan Lane) and Pumbaa (Ernie Sabella).",
      nowShowing: true,
      comingSoon: false,
      poster: 'assets/images/lion_king.jpg',
      categories: ['action', 'kids', 'now showing'],
    ),
    Movie(
      id: "TheLionKing2",
      title: "The Lion King 2",
      desc:
          "This Disney animated feature follows the adventures of the young lion Simba (Jonathan Taylor Thomas), the heir of his father, Mufasa (James Earl Jones). Simba's wicked uncle, Scar (Jeremy Irons), plots to usurp Mufasa's throne by luring father and son into a stampede of wildebeests. But Simba escapes, and only Mufasa is killed. Simba returns as an adult (Matthew Broderick) to take back his homeland from Scar with the help of his friends Timon (Nathan Lane) and Pumbaa (Ernie Sabella).",
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
    Movie(
      id: "AIW",
      title: "Avengers Infinity War",
      desc:
          "This Disney animated feature follows the adventures of the young lion Simba (Jonathan Taylor Thomas), the heir of his father, Mufasa (James Earl Jones). Simba's wicked uncle, Scar (Jeremy Irons), plots to usurp Mufasa's throne by luring father and son into a stampede of wildebeests. But Simba escapes, and only Mufasa is killed. Simba returns as an adult (Matthew Broderick) to take back his homeland from Scar with the help of his friends Timon (Nathan Lane) and Pumbaa (Ernie Sabella).",
      nowShowing: true,
      comingSoon: false,
      poster: 'assets/images/avengers_iw.jpg',
      categories: [
        'action',
        'kids',
        'now showing',
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

  Movie _currentMovie;
  String _currentCategory;

  List<Movie> getAllMovies() => _movies;
  List<String> getAllCategories() => _categories;
  Movie getCurrentMovie() => _currentMovie;
  String getCurrentCategory() => _currentCategory;

  Movie getMovieById(String id) {
    for (var movie in _movies) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }

  List<Movie> getMoviesByCategory(String category) {
    return _movies
        .map((movie) => movie)
        .where((movie) => movie.categories.contains(category))
        .toList();
  }

  setCurrentMovie(Movie movie) {
    _currentMovie = movie;
  }

  setCurrentCategory(String category) {
    _currentCategory = category;
  }
}
