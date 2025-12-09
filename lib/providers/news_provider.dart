import 'package:flutter/material.dart';
import '../models/news_model.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsModel> _newsList = [];
  bool _isLoading = false;

  List<NewsModel> get newsList => _newsList;
  bool get isLoading => _isLoading;

  NewsProvider() {
    _loadDummyNews();
  }

  void _loadDummyNews() {
    _isLoading = true;
    notifyListeners();

    // Dummy news data
    _newsList = [
      NewsModel(
        id: '1',
        title: 'Teknologi AI Terbaru Mengubah Dunia Pendidikan',
        description: 'Artificial Intelligence membawa perubahan besar dalam sistem pembelajaran modern',
        content: 'Perkembangan teknologi Artificial Intelligence (AI) telah membawa dampak signifikan...',
        imageUrl: 'https://picsum.photos/400/250?random=1',
        category: 'Teknologi',
        publishedAt: DateTime.now().subtract(const Duration(hours: 2)),
        author: 'Admin Portal',
      ),
      NewsModel(
        id: '2',
        title: 'Olahraga: Tim Nasional Raih Prestasi Gemilang',
        description: 'Atlet Indonesia berhasil meraih medali emas di ajang internasional',
        content: 'Dalam kompetisi tingkat internasional yang digelar di...',
        imageUrl: 'https://picsum.photos/400/250?random=2',
        category: 'Olahraga',
        publishedAt: DateTime.now().subtract(const Duration(hours: 5)),
        author: 'Admin Portal',
      ),
      NewsModel(
        id: '3',
        title: 'Ekonomi Digital Indonesia Terus Berkembang',
        description: 'Transaksi digital meningkat drastis di era pandemi',
        content: 'Pertumbuhan ekonomi digital Indonesia menunjukkan tren positif...',
        imageUrl: 'https://picsum.photos/400/250?random=3',
        category: 'Ekonomi',
        publishedAt: DateTime.now().subtract(const Duration(hours: 8)),
        author: 'Admin Portal',
      ),
      NewsModel(
        id: '4',
        title: 'Kesehatan: Tips Menjaga Imunitas Tubuh',
        description: 'Panduan lengkap menjaga kesehatan di musim pancaroba',
        content: 'Menjaga kesehatan tubuh sangat penting terutama saat musim...',
        imageUrl: 'https://picsum.photos/400/250?random=4',
        category: 'Kesehatan',
        publishedAt: DateTime.now().subtract(const Duration(hours: 12)),
        author: 'Admin Portal',
      ),
      NewsModel(
        id: '5',
        title: 'Pendidikan: Kurikulum Merdeka Diterapkan Nasional',
        description: 'Sistem pendidikan baru memberikan fleksibilitas lebih',
        content: 'Kurikulum Merdeka telah diterapkan di seluruh Indonesia...',
        imageUrl: 'https://picsum.photos/400/250?random=5',
        category: 'Pendidikan',
        publishedAt: DateTime.now().subtract(const Duration(days: 1)),
        author: 'Admin Portal',
      ),
    ];

    _isLoading = false;
    notifyListeners();
  }

  List<NewsModel> getNewsByCategory(String category) {
    return _newsList.where((news) => news.category == category).toList();
  }

  NewsModel? getNewsById(String id) {
    try {
      return _newsList.firstWhere((news) => news.id == id);
    } catch (e) {
      return null;
    }
  }
}