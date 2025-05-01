// lib/views/book_detail_view.dart
import 'package:flutter/material.dart';
import '../models/book.dart';

class DetailView extends StatelessWidget {
  final Book book;
  const DetailView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // image
        SizedBox(
          width: 200,
          height: 330,
          child: Image.asset(book.imageAsset, fit: BoxFit.contain),
        ),
        const SizedBox(height: 15),
        // name
        Text(
          book.title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        // author
        Text(
          book.author,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 15),
        // introduction
        Text(
          book.description.isEmpty
              ? 'No description yet.'
              : book.description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
