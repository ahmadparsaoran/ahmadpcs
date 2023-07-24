import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/uast.dart';

class AddScreen extends ConsumerWidget {
  AddScreen({Key? key}) : super(key: key);

  final _keyForm = GlobalKey<FormState>();
  final _description = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
        actions: [
          IconButton(
              onPressed: (){
                if(_keyForm.currentState!.validate()){
                  ref.read(uastProvider.notifier).add(_description.text);
                  _description.clear();

                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                   const SnackBar(content: Text('Tambah Data Berhasil..'))
                  );
                }
              },
              icon: const Icon(Icons.save)
          )
        ],
      ),
      body: Form(
        key: _keyForm,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
          child: TextFormField(
            controller: _description,
            decoration: const InputDecoration(
              labelText: 'Desc',
              hintText: 'Masukan Desc',
              border: OutlineInputBorder()
            ),
            validator: (value){
              if (value == null || value.isEmpty){
                return 'Tolong, Masukan Description..';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}
