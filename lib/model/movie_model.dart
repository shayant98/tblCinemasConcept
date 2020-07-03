class Movie {
  final String id;
  final String title;
  final String desc;
  final String poster;
  final List<String> categories;
  final bool nowShowing;
  final bool comingSoon;
  final String comingSoonDate;

  Movie({
    this.id,
    this.title,
    this.poster,
    this.desc,
    this.categories,
    this.nowShowing,
    this.comingSoon,
    this.comingSoonDate,
  });
}
