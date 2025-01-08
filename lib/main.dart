import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_fase_2/todo_controller.dart';

// Paso 0 (riverpod): Declaramos ChangeNotifierProvider
final todoProvider = ChangeNotifierProvider((ref) => TodoController());

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoWidget(),
    );
  }
}

// Modificamos el StatelessWidget para que use un Provider del Riverpod
// Paso 1 (riverpod): Importamos reemplace el StatelessWidget con un ConsumerWidget
class TodoWidget extends ConsumerWidget {
  const TodoWidget({super.key});

  // Paso 2 (riverpod): Añadimos a build el WidgetRef ref
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Paso 3 (riverpod): Añadimos a build el WidgetRef ref
    final todoState = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List App'),
        backgroundColor: Colors.purple.shade100,
      ),
      body: ListView.builder(
        itemCount: todoState.getAllTasks.length,
        itemBuilder: (context, index) {
          final task = todoState.getAllTasks[index];

          return ListTile(
              title: Text(
            task.title,
            style: const TextStyle(fontSize: 20.0, color: Colors.blueAccent),
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logica que se va a alanzar cuando se pulse el botón
          todoState
              .addTask("Tarea de ejemplo #${todoState.getAllTasks.length + 1}");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
