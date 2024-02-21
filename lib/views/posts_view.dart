import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jadran/core/components.dart';

import 'package:jadran/viewmodel/post_cubit/post_view_model_cubit.dart';
import 'package:jadran/viewmodel/post_cubit/state.dart';
import 'package:jadran/views/edit.dart';

class PostsView extends StatelessWidget {
  PostsView({super.key});

  var textControll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubitViewModel, PostsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var listItem = PostsCubitViewModel().get(context).posts;
        return Scaffold(
          backgroundColor: Colors.grey[800],
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(top: 20.0, bottom: 20.0),
                  child: Row(
                    children: [
                      const Text(
                        'JADRAN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          height: 1.5,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: IconButton(
                          onPressed: () {
                            PostsCubitViewModel().get(context).getPosts();
                          },
                          padding: const EdgeInsets.all(0),
                          icon: const Icon(Icons.filter_list_sharp),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: textControll,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.white),
                  onTap: () {},
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      focusColor: Colors.grey,
                      hintText: 'Search notes.....',
                      hintStyle: const TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black)),
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: Colors.white,
                      fillColor: Colors.grey[600],
                      filled: true),
                ),
                listItem.isEmpty
                    ? Center(
                        child: Center(
                            child: CircularProgressIndicator(
                          color: Colors.white,
                        )),
                      )
                    : Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) =>
                              ItemCard(listItem[index]),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10.0),
                          itemCount: listItem.length,
                        ),
                      ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 20.0,
            onPressed: () {
              navigatorTO(context, EditScreen());
            },
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey[500],
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
