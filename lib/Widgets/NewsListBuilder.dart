import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:news_app/Services/NewsService.dart';
import 'package:news_app/Widgets/NewsList.dart';
import 'package:news_app/Widgets/shimmer.dart';
import 'package:news_app/models/ArticleModel.dart';
import 'package:news_app/services/CheckInternet.dart';
import '../detailNews.dart';

class NewsListBuilder extends StatefulWidget {
  const NewsListBuilder({super.key});

  @override
  State<NewsListBuilder> createState() => _NewsListBuilderState();
}

class _NewsListBuilderState extends State<NewsListBuilder> {
  final webPageInChrome _web = webPageInChrome();
  List<String> selectedCategory = [];
  final _scaffoldKay = GlobalKey<ScaffoldState>();
  int check=0;
  var future;

  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews();
    checker();
  }

  void checker() {
    final resultVal = CheckInternet().checkInternetConnection();
    resultVal.then((value) {
      if (value == 0) {
        setState(() {
          check = 0;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("No internet connection!"),
          ),
        );
      } else {
        setState(() {
          check = 1;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Connected to the internet"),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKay,
      body: FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final filterArticle = snapshot.data!.where((article) {
              return selectedCategory.isEmpty ||
                  selectedCategory.contains(article.category);
            }).toList();
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: category
                          .map((category) => Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: FilterChip(
                                  selectedColor: Colors.amberAccent,
                                  selected: selectedCategory.contains(category),
                                  label: Text(category),
                                  onSelected: (selected) {
                                    setState(
                                      () {
                                        if (selected) {
                                          selectedCategory.add(category);
                                        } else {
                                          selectedCategory.remove(category);
                                        }
                                      },
                                    );
                                  },
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filterArticle.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          check == 1
                              ? _web.open(
                                  url: WebUri(filterArticle[i].url),
                                )
                              : ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("No internet Connection!"),
                                  ),
                                );
                        },
                        child: NewsList(
                          articles: filterArticle[i],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          else if (snapshot.hasError) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.report_gmailerrorred_outlined,
                    size: 100,
                    color: Colors.black54,
                  ),
                  Text(
                    "Sorry, has Error in Data",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black54),
                  )
                ],
              ),
            );
          }
          else {
            return const shimmer();
          }
        },
      ),
    );
  }
}
