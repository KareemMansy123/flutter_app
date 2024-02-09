import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/news_bloc.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Lists'),
      ),
      body: Column(
        children: <Widget>[
          // TextField 1 - Search for List 1
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                // Dispatch SearchNewsList1 with the entered keyword
                context.read<NewsBloc>().add(SearchNewsList1(value));
              },
              decoration: const InputDecoration(
                labelText: 'Search List 1',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // List 1 - Display search results from TextField 1
          Expanded(
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsList1Loaded) {
                  return ListView.builder(
                    itemCount: state.articlesList1.length,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text(state.articlesList1[index].title));
                    },
                  );
                } else if (state is NewsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is NewsError) {
                  return const Center(child: Text('Failed to load list 1'));
                } else {
                  // Default case: return an empty container if none of the conditions are met.
                  return Container();
                }
              },
            ),
          ),
          // TextField 2 - Search for List 2
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                // Dispatch SearchNewsList2 with the entered keyword
                context.read<NewsBloc>().add(SearchNewsList2(value));
              },
              decoration: const InputDecoration(
                labelText: 'Search List 2',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // List 2 - Display search results from TextField 2
          Expanded(
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsList2Loaded) {
                  return ListView.builder(
                    itemCount: state.articlesList2.length,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text(state.articlesList2[index].title));
                    },
                  );
                } else if (state is NewsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is NewsError) {
                  return const Center(child: Text('Failed to load list 2'));
                } else {
                  // Default case: return an empty container if none of the conditions are met.
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

