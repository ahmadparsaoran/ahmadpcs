import 'package:flutter/material.dart';
import '../widgets/todos.dart';
import '../screens/add.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Daftar Kendaraan'),
      ),
      body: const UastWidget(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (ctx)=> AddScreen())
          );
        },
      ),
    );
  }
}
