import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jadran/core/components.dart';
import 'package:jadran/viewmodel/post_cubit/post_view_model_cubit.dart';
import 'package:jadran/viewmodel/post_cubit/state.dart';
import 'package:jadran/views/posts_view.dart';

class EditScreen extends StatelessWidget {
  var titleControll = TextEditingController();
  var bodyControll = TextEditingController();
  var nameControll = TextEditingController();

  // var dateTime =DateTime.now();
  @override
  Widget build(context) {
    CollectionReference createPosts =
        FirebaseFirestore.instance.collection('posts');

    return BlocConsumer<PostsCubitViewModel, PostsState>(
        listener: (context, state) {
      // if (state is insertIntoDatabaseState) {
      //   Navigator.pop(context);
      // }
    }, builder: (context, state) {
      //     // var cubit = NodeCubit().get(context).insertIntoDatabase();
      return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(top: 20.0, bottom: 20.0),
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(Icons.arrow_back_ios_new),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: nameControll,
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.white, fontSize: 30.0),
              onTap: () {},
              decoration: const InputDecoration(
                // contentPadding: EdgeInsets.symmetric(vertical: 12),
                focusColor: Colors.grey,
                border: InputBorder.none,
                hintText: ' Name ',
                hintStyle: TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ),
            TextFormField(
              controller: titleControll,
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.white, fontSize: 30.0),
              onTap: () {},
              decoration: const InputDecoration(
                // contentPadding: EdgeInsets.symmetric(vertical: 12),
                focusColor: Colors.grey,
                border: InputBorder.none,
                hintText: 'Title ',
                hintStyle: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),
            TextFormField(
              controller: bodyControll,
              keyboardType: TextInputType.text,
              style: const TextStyle(
                color: Colors.white,
              ),
              onTap: () {},
              decoration: const InputDecoration(
                // contentPadding: EdgeInsets.symmetric(vertical: 12),
                focusColor: Colors.grey,
                border: InputBorder.none,
                hintText: 'Type something here...... ',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 20.0,
          onPressed: () {
            // var now = DateTime.now();
            PostsCubitViewModel().get(context).CreatePost(
                  data: DateFormat.yMMMd().format(DateTime.now()).toString(),
                  time: TimeOfDay.now().format(context).toString(),
                  title: titleControll.text,
                  body: bodyControll.text,
                  name: nameControll.text,
                );
            navigatorTO(context, PostsView());
          },
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey[500],
          child: const Icon(Icons.save),
        ),
      );
    });
  }
}
