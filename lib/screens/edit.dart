import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/uast.dart';
import '../models/todo.dart';

class EditScreen extends ConsumerStatefulWidget {
  final Uas uas;
  const EditScreen({required this.uas, Key? key}) : super(key: key);

  @override
  ConsumerState<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends ConsumerState<EditScreen> {
  final _description = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _description.text = widget.uas.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Data'),
        actions: [
          IconButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                  ref.read(uastProvider.notifier).update(
                      widget.uas.id,
                      _description.text
                  );
                  Navigator.pop(context);
                }
              },
              icon: const Icon(Icons.save)
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8.0),
          child: TextFormField(
            controller: _description,
            decoration: const InputDecoration(
              labelText: 'Description',
              hintText: 'Masukan Description',
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
