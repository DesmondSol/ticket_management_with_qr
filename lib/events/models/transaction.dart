class Transaction {
  String id;
  String title;
  int participantAmount;
  DateTime date;

  Transaction(
      {required this.id,
      required this.title,
      required this.date,
      required this.participantAmount,
      });
}
