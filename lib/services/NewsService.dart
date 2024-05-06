import 'package:dio/dio.dart';
import 'package:news_app/models/ArticleModel.dart';

class NewsService {
  static const API_KEY = "YOUR_API_KEY";
  final Dio dio;
  List<ArticleModel> allArticle = [];

  NewsService(this.dio);

  //this api don't support filter category in one request
  Future<List<ArticleModel>> getNews() async {
    try {
      for (var _cat in category) {
        Response response = await dio.get(
            "https://newsapi.org/v2/top-headlines?country=us&apiKey=$API_KEY&category=$_cat");
        Map<String, dynamic> jsonData = response.data;
        List<dynamic> articles = jsonData["articles"];

        for (var article in articles) {
          var source = article["source"];
          if (article["urlToImage"] == null ||
              article["description"] == null ||
              article["title"] == null ||
              article["publishedAt"] == null ||
              article["url"] == null ||
              source["name"] == null) {
            continue;
          } else {
            ArticleModel model = ArticleModel(
              sourceName: source["name"],
              image: article["urlToImage"],
              url: article["url"],
              date: article["publishedAt"].toString().substring(0, 10),
              title: article["title"],
              subTitle: article["description"],
              category: _cat,
            );

            allArticle.add(model);
          }
        }
      }
      allArticle.sort(
        (a, b) => a.sourceName.compareTo(b.sourceName),
      );
      return allArticle;
    } catch (e) {
      return Future.error(Error);
    }
  }
}
