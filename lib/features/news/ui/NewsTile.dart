import 'package:flutter/material.dart';
import 'package:mt5_leeon1/core/di/service_locator.dart';
import 'package:mt5_leeon1/features/news/ui/NewsDetail.dart';

class NewsTile extends StatelessWidget {
  final String author;
  final String title;
  final String desc;
  final String urlToImage;
  final String publishedAt;


  const NewsTile({
    super.key,
    required this.title,
    required this.desc,
    required this.urlToImage,
  required this.author,
    required this.publishedAt,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>NewsDetailPage(author: author, title: title, desc: desc,  urlToImage: urlToImage, publishedAt: publishedAt)));
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.all(1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                urlToImage,
                height: 250,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 8),


            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),



          ],
        ),
      ),
    );
  }
}