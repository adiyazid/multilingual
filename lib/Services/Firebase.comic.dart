import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learningapp/learner/model/Comic.models.dart';

final CollectionReference comicCollection =
    FirebaseFirestore.instance.collection('comicStrips');

Comic _scoreDataFromSnapshot(DocumentSnapshot snapshot) {
    return Comic(
        language: snapshot['language'],
        url: snapshot['url'],

    );
}

Stream<Comic> get alFatihahStreakStream {
    return comicCollection
        .doc('c1')
        .snapshots()
        .map(_scoreDataFromSnapshot);
}