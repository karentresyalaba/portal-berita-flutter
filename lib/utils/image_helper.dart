class ImageHelper {
  // Placeholder image dari internet
  static const String placeholder = 'https://via.placeholder.com/400x300/E0E0E0/757575?text=Portal+Berita';
  
  // Default avatar
  static const String defaultAvatar = 'https://ui-avatars.com/api/?name=User&background=2196F3&color=fff&size=200';
  
  // Icon untuk kategori berita (dari Unsplash atau Pexels)
  static const String newsIcon = 'https://images.unsplash.com/photo-1504711434969-e33886168f5c?w=400&h=300&fit=crop';
  static const String techIcon = 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400&h=300&fit=crop';
  static const String sportsIcon = 'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?w=400&h=300&fit=crop';
  static const String businessIcon = 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=400&h=300&fit=crop';
  
  // Logo aplikasi (bisa ganti dengan logo Anda sendiri)
  static const String appLogo = 'https://cdn-icons-png.flaticon.com/512/3209/3209283.png';
  
  // Gambar error
  static const String errorImage = 'https://via.placeholder.com/400x300/FF5252/fff?text=Error+Loading+Image';
  
  // Method untuk mendapatkan gambar berdasarkan kategori
  static String getCategoryImage(String category) {
    switch (category.toLowerCase()) {
      case 'teknologi':
      case 'tech':
        return techIcon;
      case 'olahraga':
      case 'sports':
        return sportsIcon;
      case 'bisnis':
      case 'business':
        return businessIcon;
      default:
        return newsIcon;
    }
  }
}