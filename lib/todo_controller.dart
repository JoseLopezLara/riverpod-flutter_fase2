import 'package:flutter/material.dart';
import 'package:riverpod_fase_2/task.dart';

class TodoController extends ChangeNotifier {
  //Seccion 1: Definició de variables
  List<Task> _task = [];

  //Sección 2: Getter y setter para la lista de tareas
  List<Task> get getAllTasks => _task;
}
