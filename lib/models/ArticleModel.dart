class ArticleModel {
  final String sourceName;
  final String category;
  final String date;
  final String url;
  final String image;
  final String title;
  final String subTitle;

  ArticleModel({
    required this.sourceName,
    required this.category,
    required this.date,
    required this.url,
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

List<String> category=["business","entertainment","general","health","science","sports","technology"];
