import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jadran/models/model.dart';
import 'package:jadran/viewmodel/post_cubit/state.dart';

class PostsCubitViewModel extends Cubit<PostsState> {
  PostsCubitViewModel() : super(initialState());

  PostsCubitViewModel get(context) => BlocProvider.of(context);
  // var model = NodeModel();

  // this will  provide all data the view needs

  void CreatePost({
    required String data,
    required String time,
    required String title,
    required String body,
    required String name,
  }) {
    emit(CreatePostLoadingState());
    NodeModel model = NodeModel(
      // uId: id,
      name: name,
      title: title,
      body: body,
      // uId: model.uId,
      data: data,
      time: time,
    );

    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value) {
      // print(value.id);
      // print(value);
      emit(CreatePostSuccessState());
      print('the create is Done.');
    }).catchError((error) {
      emit(CreatePostErrorState());
    });
  }

  //////////////////////////////////////
////get the posts
  List<NodeModel> posts = [];
  List<String> postId = [];
  late String id;
  void getPosts() {
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      value.docs.forEach((element) {
        id = element.id;

        postId.add(element.id);
        posts.add(NodeModel.fromJson(element.data()));
        // print(posts);
      });
      print(posts);
      print('the GetPosts is Done.');
      emit(CreatePostSuccessState());
    }).catchError((error) {
      emit(GetPostErrorState(error));
    });
  }

  deletePic(String id) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(id)
        .delete()
        .then((value) {
      emit(DeleteSuccessState());
    }).catchError((error) {
      emit(GetPostErrorState(error));
    });

    //  FirebaseFirestore.in.Collection.doc(docId).update({
    //    posts: firebase.firestore.FieldValue.arrayRemove()
    //  })
    // .catch(function(error) {
    //     console.error("Error removing document: ", error);
    // });
  }
}
