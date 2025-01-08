import 'package:flutter/material.dart';
import 'package:riverpod_fase_2/task.dart';

class TodoController extends ChangeNotifier {
  //Seccion 1: Definició de variables
  late List<Task> _task = [];

  //_task = [{title: 'Tarea 1', isCompleted: false}, {title: 'Tarea 2', isCompleted: false}];
  //..._task = {title: 'Tarea 1', isCompleted: false}, {title: 'Tarea 2', isCompleted: false};
  //..._task, newTast = {title: 'Tarea 1', isCompleted: false}, {title: 'Tarea 2', isCompleted: false}, {title: 'Tarea 3', isCompleted: false};
  //..._task = [{title: 'Tarea 1', isCompleted: false}, {title: 'Tarea 2', isCompleted: false}, {title: 'Tarea 3', isCompleted: false}];

  //Sección 2: Getter y setter para la lista de tareas
  List<Task> get getAllTasks => _task;

  //Sección 3: Métodos para agregar, eliminar y actualizar tareas
  void addTask(String title) {
    final newTask = Task(title: title);
    _task = [..._task, newTask];

    //Paso 4 (riverpod): Emitir cambios para notificar al resto de la app
    notifyListeners();
  }
}
