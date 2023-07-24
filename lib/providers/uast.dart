import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../models/todo.dart';

var _uuid = Uuid();

class UasNotifier extends StateNotifier<List<Uas>> {
  UasNotifier([List<Uas>? initialUast]) : super(initialUast ?? []);

  void toggleComplete(String id){
    state = [
      for(final uas in state)
        if(uas.id == id)
          Uas(
              id: uas.id,
              description: uas.description,
            isComplated: !uas.isComplated
          )
      else
        uas
    ];
  }

  void add(String description){
    state = [
      ...state,
      Uas(
          id: _uuid.v4(),
          description: description
      )
    ];
  }

  void update(String id, String newDescription){
    state = [
      for(final uas in state)
        if(uas.id == id)
          Uas(
              id: uas.id,
              description: newDescription,
            isComplated: uas.isComplated
          )
      else
        uas
    ];
  }

  void remove(String id){
    state = state.where((uas) => uas.id !=id).toList();
  }

}

final uastProvider = StateNotifierProvider<UasNotifier, List<Uas>>((ref) => UasNotifier(
 [
   Uas(
     id: '001',
     description: 'Yamaha Nmax',
   ),
   Uas(
     id: '002',
     description: 'Yamaha Mx King',
   )
 ]
));
