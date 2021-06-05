import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'models/freezed_datamodels.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Dio dio = Dio();
  List<User> _users = [];

  Future<void> fetchUsers() async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/users',
    );
    print(response.data);
    final List list = response.data;

    setState(() {
      _users = list.map((e) => User.fromJson(e)).toList();
    });
  }

  void appendUsername(int index) {
    setState(() {
      _users[index] = _users[index].copyWith(
        username: '${_users[index].username} CLICKED',
      );
    });
  }

  @override
  void initState() {
    fetchUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];

          return ListTile(
            title: Text(user.username),
            subtitle: Text(user.email),
            onTap: () => appendUsername(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        tooltip: 'Fetch Users',
        child: Icon(Icons.data_usage),
      ),
    );
  }
}
