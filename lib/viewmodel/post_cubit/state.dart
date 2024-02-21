abstract class PostsState {}

class initialState extends PostsState {}

class CreatePostLoadingState extends PostsState {}

class CreatePostSuccessState extends PostsState {}

class CreatePostErrorState extends PostsState {}

class GetPostSuccessState extends PostsState {}

class GetPostErrorState extends PostsState {
  String error;
  GetPostErrorState(this.error);
}

class DeleteSuccessState extends PostsState {}
