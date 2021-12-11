class GraphData {
  late String description;
  late String image;
  late String title;
  late String tag;

  GraphData(
      {required this.title,
      required this.tag,
      required this.image,
      required this.description});

  factory GraphData.fromMap(Map<dynamic, dynamic> map) {
    return GraphData(
        title: map['title'],
        tag: map['tag'],
        image: map['image'],
        description: map['description']);
  }
}
