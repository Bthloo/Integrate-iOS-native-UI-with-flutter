import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integrate_flutter_with_ios_native_ui/features/home_screen/viewmodel/get_posts_cubit.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: const Text('Home Screen'),
      ),
      body: BlocProvider(
        create: (context) =>
        GetPostsCubit()
          ..getPosts(),
        child: BlocBuilder<GetPostsCubit, GetPostsState>(
          builder: (context, state) {
            if(state is GetPostsLoading){
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }else if(state is GetPostsError) {
              return Center(
                child: Text(state.message),
              );
            }else if(state is GetPostsSuccess){



              return UiKitView(
                viewType: 'home_screen',
                layoutDirection: TextDirection.ltr,
                creationParams: context.read<GetPostsCubit>().creationParams,
                creationParamsCodec: const StandardMessageCodec(),
              );
            }else{
              return Center(
                child: Text('Unknown state'),
              );
            }



          },
        ),
      ),
    );
  }
}
