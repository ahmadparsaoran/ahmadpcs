import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';
import '../providers/uast.dart';
import '../screens/edit.dart';

class UasItemWidget extends ConsumerWidget {
  final Uas uas;

  const UasItemWidget({
    required this.uas,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Card(
        color: Theme.of(context).colorScheme.secondary,
    child: ListTile(
      leading: IconButton(
        onPressed: (){
          ref.read(uastProvider.notifier).toggleComplete(uas.id);
        },
        icon: Icon(uas.isComplated ? Icons.check_box : Icons.check_box_outline_blank),
      ),
    title: Text(uas.description),
      trailing: IconButton(
        color: Theme.of(context).colorScheme.primary,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (ctx)=> EditScreen(
            uas: uas,
          )));
        },
        icon: const Icon(Icons.edit),
      ),
    ),
    );
  }
  }
