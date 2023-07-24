import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/todo_item.dart';
import '../providers/uast.dart';

class UastWidget extends ConsumerWidget {
  const UastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uast = ref.watch(uastProvider);

    return ListView.builder(
        itemCount:uast.length,
        itemBuilder: (ctx, index) => Dismissible(
          direction: DismissDirection.startToEnd,
          onDismissed: (direction){
            
          },
          key: Key(uast[index].id), 
        child:UasItemWidget(uas: uast[index])
    ),
    );
  }
}
