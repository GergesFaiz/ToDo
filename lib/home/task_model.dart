class TaskModel {
  String? id;

  String? title;

  String? description;

  bool? isDone;

  int? date;

  TaskModel({
    required this.title,
    required this.description,
    required this.date,
    this.id = "",
    this.isDone = false,
  });

  TaskModel.fromJson(Map<String, dynamic> json) :this(
    title: json['title'],
    description: json['description'],
    date: json['date'],
    id: json['id'],
    isDone: json['isDone'],
  );
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "date": date,
      "id": id,
      "isDone": isDone,
    };
  }
}
