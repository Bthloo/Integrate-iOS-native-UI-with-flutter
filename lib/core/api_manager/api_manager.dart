import 'package:dio/dio.dart';
import 'package:integrate_flutter_with_ios_native_ui/core/models/post_model.dart';

class ApiManager{
  static final Dio dio = Dio();
  static const String baseURL= 'https://dummyjson.com';
  static Future<PostsModel>getPosts()async{
 var request = await dio.get("$baseURL/posts");

  return PostsModel.fromJson(request.data);

  }
}