part of 'get_posts_cubit.dart';

@immutable
sealed class GetPostsState {}

final class GetPostsInitial extends GetPostsState {}
final class GetPostsLoading extends GetPostsState {}
final class GetPostsSuccess extends GetPostsState {
  final PostsModel posts;

  GetPostsSuccess(this.posts);
}
final class GetPostsError extends GetPostsState {
  final String message;

  GetPostsError(this.message);
}
