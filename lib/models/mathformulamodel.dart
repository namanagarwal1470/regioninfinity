class FormulaData {
  late String filepath;
  late String title;

  FormulaData({required this.filepath, required this.title});

  factory FormulaData.fromMap(Map<dynamic, dynamic> map) {
    return FormulaData(title: map['title'], filepath: map['filepath']);
  }
}
