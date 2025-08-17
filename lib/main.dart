import 'package:charge_locations_app/bloc/post_bloc.dart';
import 'package:charge_locations_app/bloc/post_event.dart';
import 'package:charge_locations_app/bloc/post_state.dart';
import 'package:charge_locations_app/data/post_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = PostRepository();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter BLoC Example',
      home: BlocProvider(
        create: (context) => PostBloc(repository)..add(FetchPosts()),
        child: const PostPage(),
      ),
    );
  }
}

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  title: Text(
                    post.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    post.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            );
          } else if (state is PostError) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return const Center(child: Text("Press button to load posts"));
        },
      ),
    );
  }
}
