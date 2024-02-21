// import 'package:dio/dio.dart';








// class PostsViewMdel {
//   // this will  provide all data the view needs
//     List<postModel> posts = [];
//   List<String> postId = [];
//   List<int> likes = [];
//   List<int> comments = [];

//  void getPosts() {
//     FirebaseFirestore.instance.collection('posts').get().then((value) {
//       value.docs.forEach((element) {
//         element.reference.collection('likes').get().then((value) {
//           likes.add(value.docs.length);
//           postId.add(element.id);
//           posts.add(postModel.fromJson(element.data()));
//         }).catchError((error) {});
//         element.reference.collection('comments').get().then((value) {
//           comments.add(value.docs.length);
//         }).catchError((error) {});
//       });
//     }).catchError((error) {
//       emit(GetPostErrorState(error));
//     });
//   }


// ///////////////////////////////////////////////////////////////////////////////
//  void CreatePost({
//     required String dateTime,
//     required String text,
//     String? postImage,
//   }) {
//     emit(CreatePostLoadingState());
//     postModel model = postModel(
//       name: usermodel!.name,
//       uId: usermodel!.uId,
//       image: usermodel!.image,
//       dateTime: dateTime,
//       postImage: postImage ?? '',
//       text: text,
//     );

//     FirebaseFirestore.instance
//         .collection('posts')
//         .add(model.toMap())
//         .then((value) {
//       emit(CreatePostSuccessState());
//     }).catchError((error) {
//       emit(CreatePostErrorState());
//     });
//   }

// }
