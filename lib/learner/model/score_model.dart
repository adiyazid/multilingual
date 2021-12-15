import 'package:cloud_firestore/cloud_firestore.dart';

class Score {
  String? userName;
  int score;
  String date;

  Score({required this.userName, required this.score, required this.date});

  static Score fromMap(Map<String, dynamic> data, {required String userName}) {
    try {
      return Score(
        userName: userName,
        score: data['score'] ?? '',
        date: data['date'] ?? '',
      );
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Map<String, Object?> toMap() {
    return {
      'userName': userName,
      'score': score,
      'date': date,
    };
  }

  Score.highestScoreFromSnapshot(DocumentSnapshot snapshot)
      : userName = snapshot['username'],
        score = snapshot['score'],
        date = snapshot['date'];
}
