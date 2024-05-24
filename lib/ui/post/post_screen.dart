import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/posts/post_bloc.dart';
import '../../bloc/posts/post_event.dart';
import '../../bloc/posts/post_state.dart';
import '../../utils/enums.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              switch (state.postStatus) {
                case PostStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case PostStatus.failure:
                  return Center(child: Text(state.message.toString()));
                case PostStatus.success:
                  return Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Search with id, name or email',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (filterText) {
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
