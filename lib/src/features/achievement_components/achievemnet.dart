class Achievement {
  String title;
  bool isFinished;
  String description;
  double exp;
  int lvl;
  int finished;
  int deleted;
  int created;

  Achievement({
    required this.title,
    required this.isFinished,
    required this.description,
    required this.exp,
    required this.lvl,
    required this.created,
    required this.deleted,
    required this.finished,
  });
}
