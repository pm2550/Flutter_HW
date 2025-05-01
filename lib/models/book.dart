// Book model class
// This class represents a book with its author, title, description, and image asset path.

class Book {
  String author;
  String title;
  String description;
  String imageAsset; // 资产图片路径

  Book({
    required this.author,
    required this.title,
    required this.description,
    required this.imageAsset,
  });
}

