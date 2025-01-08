// ignore_for_file: public_member_api_docs, sort_constructors_first

// {title: Voy a comprar pan, isCompleted: false}
class Task {
  final String title; // Ir a comprar el pan
  final bool isCompleted; // false

  Task({
    required this.title,
    this.isCompleted = false,
  });

  Task copyWith({
    String? title,
    bool? isCompleted,
  }) {
    return Task(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
