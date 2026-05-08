

import 'package:mt5_leeon1/features/news/domain/model/news_article_model.dart';

class NewsArticleEntity {
  final String? author;
  final String? title;
  final String? desc;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;


  factory NewsArticleEntity.fromJson(Map<String, dynamic> json) {
    return NewsArticleEntity(
      author: json['author']as String?,
      title: json['title']as String?,
      desc: json['description']as String?,
      url: json['url']as String?,
      urlToImage: json['urlToImage']as String?,
      publishedAt: json['publishedAt']as String?,
content: json['content']as String?,
    );
  }

  NewsArticleEntity({ this.author,  this.title, this.desc,  this.url,
     this.urlToImage,  this.publishedAt,  this.content});



  static List<NewsArticleEntity> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((e) => NewsArticleEntity.fromJson(e as Map<String, dynamic>))
        .toList();
  }
  NewsArticleModel fromEntityToModel() {
    return NewsArticleModel(
      author: author ?? 'Unknown author',
      title: title ?? 'No title',
      desc: desc ?? 'No description',
      url: url ?? '',
      urlToImage: urlToImage ?? '',
      publishedAt: publishedAt ?? '',
      content: content ?? '',
    );
  }
}