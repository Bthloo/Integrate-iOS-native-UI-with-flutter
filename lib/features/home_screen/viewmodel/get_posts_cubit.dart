import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../../core/api_manager/api_manager.dart';
import '../../../core/models/post_model.dart';
part 'get_posts_state.dart';

class GetPostsCubit extends Cubit<GetPostsState> {
  GetPostsCubit() : super(GetPostsInitial());

  var creationParams = <String, dynamic>{};

  getPosts()async{
    emit(GetPostsLoading());
    try{
      final posts = await ApiManager.getPosts();
      debugPrint(posts.total.toString());
      List<Map<String, dynamic>>? postsConverter = posts.posts?.map((e) {
        return {
          'userName': "user_${e.userId}",
          'profileImage': 'person.fill',
          'postText': e.body,
          'views' : e.views,
          'likesCount' : e.reactions?.likes
        };
      },).toList();

       creationParams = {
        'posts': postsConverter,
      };
      emit(GetPostsSuccess(posts));
    }catch(e){
      emit(GetPostsError(e.toString()));
    }
  }

}
