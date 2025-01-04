import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

   String viewType = 'home_screen';


  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> posts = List.generate(10, (index) {
      return {
        'userName': 'User $index',
        'profileImage': 'person.fill',
        'postText': 'This is post number $index',
      };
    });

    final Map<String, dynamic> creationParams = <String, dynamic>{
      'posts': posts,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
            },
          ),
        ],
      ),
      body: UiKitView(
        viewType: 'home_screen',
        layoutDirection: TextDirection.ltr,
        onPlatformViewCreated: (int id) {
          print('onPlatformViewCreated$id');
        },
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
      ),
    );
  }
}
