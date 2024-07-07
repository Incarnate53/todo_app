
import 'package:flutter/material.dart';
import '../constants/colors.dart';

import '../model/todo.dart';

class TodoItem extends StatefulWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  const TodoItem({super.key, required this.todo, this.onToDoChanged, this.onDeleteItem});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){
          widget.onToDoChanged(widget.todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          widget.todo.isDone?Icons.check_box:Icons.check_box_outline_blank,
          color: tdBlue,),
        title: Text(
          widget.todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration:widget.todo.isDone?TextDecoration.lineThrough:null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5)
          ),
          child:IconButton(
            color: Colors.white,
            iconSize: 18,
            onPressed: (){
              widget.onDeleteItem(widget.todo.id);
            },
            icon: const Icon(Icons.delete),
          ) ,
        ),
      ),
    );
  }
}
