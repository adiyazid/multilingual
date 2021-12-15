import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learningapp/learner/model/score_model.dart';
import 'package:learningapp/learner/Screens/al_fatihah/quizzes.dart';
import 'package:learningapp/Provider/user.provider.dart';

final CollectionReference scoreCollection =
    FirebaseFirestore.instance.collection('scores');

Future<bool> updateScoreStreak(Score score) async {
  try {
    await FirebaseFirestore.instance
        .doc('scores/${score.userName}')
        .update(score.toMap());
    return true;
  } catch (e) {
    print(e);
    rethrow;
  }
}

Future<bool> addScoreStreak(Score score) async {
  try {
    await FirebaseFirestore.instance
        .collection('QuizScore')
        .doc('LANGUAGE')
        .collection('ENGLISH')
        .doc('CHAPTER 1')
        .collection(AppUser().user!.uid)
        .doc('Score')
        .set(score.toMap());
    return true;
  } catch (e) {
    print(e);
    rethrow;
  }
}

Score _scoreDataFromSnapshot(DocumentSnapshot snapshot) {
  return Score(
    score: snapshot['score'],
    userName: AppUser().user!.displayName,
    date: snapshot['date'],
  );
}

Stream<Score> get scoreStreakStream {
  return scoreCollection
      .doc(AppUser().user!.uid)
      .snapshots()
      .map(_scoreDataFromSnapshot);
}

final CollectionReference leaderBoard =
    FirebaseFirestore.instance.collection('QuizScore');

Score _highestScoreFromSnapshot(DocumentSnapshot snapshot) {
  return Score(
    score: snapshot['score'],
    userName: snapshot['userName'],
    date: snapshot['date'],
  );
}
Stream<Score> get highestScore{
  return FirebaseFirestore.instance
      .collection('QuizScore')
      .doc('LANGUAGE')
      .collection('ENGLISH')
      .doc('CHAPTER 1')
      .collection(AppUser().user!.uid)
      .doc('Score')
      .snapshots()
      .map(_highestScoreFromSnapshot);
}
