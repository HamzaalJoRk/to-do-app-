import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/todo/data/local_data/local_data_source.dart';
import 'features/todo/presentation/pages/todo_page.dart';
import 'features/todo/presentation/providers/todo_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TodoProvider(localDataSource: LocalDataSource()),
        ),
      ],
      child: MaterialApp(
        title: 'To-Do App',
        home: TodoPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
