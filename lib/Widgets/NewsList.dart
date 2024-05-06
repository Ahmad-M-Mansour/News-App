import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/ArticleModel.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.articles});

  final ArticleModel articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                // Source Name
                Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    articles.sourceName,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),
                // Category
                Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.centerRight,
                  child: Text(
                    articles.category,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            // Image
            Padding(
              padding: const EdgeInsets.all(2),
              child: CachedNetworkImage(
                imageUrl: articles.image,
                imageBuilder: (context, imageProvider) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      articles.image,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                placeholder: (context, url) => const SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.blueGrey,),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            // Date
            Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerRight,
              child: Text(
                articles.date,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            // Title
            Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(
                articles.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Description
            Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(
                articles.subTitle,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
