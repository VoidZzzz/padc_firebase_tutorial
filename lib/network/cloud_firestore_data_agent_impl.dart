import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:padc_firebase_tutorial/data/vos/news_feed_vo.dart';
import 'package:padc_firebase_tutorial/network/social_app_data_agent.dart';

/// Newsfeed Collection
const newsFeedCollection = "newsfeed";

class CloudFirestoreDataAgentImpl extends SocialAppDataAgent {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<void> addNewPost(NewsfeedVO newPost) {
    return _fireStore
        .collection(newsFeedCollection)
        .doc(newPost.id.toString())
        .set(newPost.toJson());
  }

  @override
  Future<void> deletePost(int postId) {
    return _fireStore
        .collection(newsFeedCollection)
        .doc(postId.toString())
        .delete();
  }

  @override
  Stream<List<NewsfeedVO>> getNewsfeed() {
    return _fireStore
        .collection(newsFeedCollection)
        .snapshots()
        .map((querySnapShot) {
      return querySnapShot.docs.map<NewsfeedVO>((document) {
        return NewsfeedVO.fromJson(document.data());
      }).toList();
    });
  }

  @override
  Stream<NewsfeedVO> getNewsfeedById(int newsfeedId) {
    // .get() return data one time as Future
    return _fireStore
        .collection(newsFeedCollection)
        .doc(newsfeedId.toString())
        .get()
        .asStream()
        .where((documentSnapShot) => documentSnapShot.data() != null)
        .map(
          (documentSnapShot) => NewsfeedVO.fromJson(documentSnapShot.data()!),
    );
  }
}
