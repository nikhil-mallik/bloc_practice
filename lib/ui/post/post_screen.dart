import 'package:flutter/material.dart';

import '../../bloc/posts/post_bloc.dart';
import '../views.dart';

/// Widget representing the screen for displaying posts.
class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Triggering the fetch posts event when the screen is built.
    context.read<PostBloc>().add(FetchPosts());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Get API Call'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              // Building UI based on the current state of post data.
              switch (state.postStatus) {
                case PostStatus.loading:
                  // Showing a loading indicator when posts are being fetched.
                  return const Center(child: CircularProgressIndicator());
                case PostStatus.failure:
                  // Showing an error message if fetching posts fails.
                  return Center(child: Text(state.message.toString()));
                case PostStatus.success:
                  // Building the UI to display posts when fetching is successful.
                  return Column(
                    children: [
                      // Text field for searching posts by id, name, or email.
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Search with id, name or email',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (filterText) {
                          // Dispatching search event when the search text changes.
                          context.read<PostBloc>().add(SearchPost(filterText));
                        },
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: state.searchMessage.isNotEmpty
                            ? Center(child: Text(state.searchMessage))
                            : ListView.builder(
                                itemCount: state.tempPostList.isEmpty
                                    ? state.postList.length
                                    : state.tempPostList.length,
                                itemBuilder: (context, index) {
                                  // Building post cards based on the filtered or original post list.
                                  if (state.tempPostList.isEmpty) {
                                    final item = state.postList[index];
                                    return Card(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Name: ${item.name}'),
                                          const SizedBox(height: 5),
                                          Text('Email: ${item.email}'),
                                          const SizedBox(height: 5),
                                          Text('Message: ${item.body}'),
                                          const SizedBox(height: 5),
                                        ],
                                      ),
                                    );
                                  } else {
                                    final item = state.tempPostList[index];
                                    return Card(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Name: ${item.name}'),
                                          const SizedBox(height: 5),
                                          Text('Email: ${item.email}'),
                                          const SizedBox(height: 5),
                                          Text('Message: ${item.body}'),
                                          const SizedBox(height: 5),
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                      ),
                    ],
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
