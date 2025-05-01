import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/cubit/book_cubit.dart';
import 'package:test_1/cubit/book_state.dart';
import 'package:test_1/views/detail_view.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Detail')),
      body: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          if (state is DetailViewState) {
      
            return DetailView(book: state.book);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
