import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import '../widgets/news_card.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semua Berita'),
      ),
      body: newsProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : newsProvider.newsList.isEmpty
              ? const Center(
                  child: Text('Tidak ada berita tersedia'),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: newsProvider.newsList.length,
                  itemBuilder: (context, index) {
                    final news = newsProvider.newsList[index];
                    return NewsCard(news: news);
                  },
                ),
    );
  }
}