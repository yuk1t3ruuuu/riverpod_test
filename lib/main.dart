import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:budou/providers.dart';
import 'package:budou/mainview.dart';
import 'package:budou/editview.dart';



void main() {
  runApp( const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const ToDoPage(),
    );
  }
}



class ToDoPage extends ConsumerWidget{
  const ToDoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref){

    final edit = ref.watch(editProvider.state);

    return edit.state?BaseView():EditView();
  }
}

