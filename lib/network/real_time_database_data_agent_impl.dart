import 'package:firebase_database/firebase_database.dart';
import 'package:padc_firebase_tutorial/data/vos/news_feed_vo.dart';
import 'package:padc_firebase_tutorial/network/social_app_data_agent.dart';

/// Database paths
const newsfeedPath = "newsfeed";

class RealTimeDatabaseDataAgentImpl extends SocialAppDataAgent {
  static final RealTimeDatabaseDataAgentImpl _singleton =
      RealTimeDatabaseDataAgentImpl._internal();

  factory RealTimeDatabaseDataAgentImpl() {
    return _singleton;
  }

  RealTimeDatabaseDataAgentImpl._internal();

  /// Database
  var databaseRef = FirebaseDatabase.instance.ref();

  @override
  Stream<List<NewsfeedVO>> getNewsfeed() {
    return databaseRef.child(newsfeedPath).onValue.map((event) {
      final dynamic value = event.snapshot.value;
      if (value is Map<dynamic, dynamic>) {
        return value.values
            .map<NewsfeedVO>((element) =>
                NewsfeedVO.fromJson(Map<String, dynamic>.from(element)))
            .toList();
      } else {
        print("HiHi");
        return [];
      }
    });
  }

  @override
  Future<void> addNewPost(NewsfeedVO newPost) {
    return databaseRef
        .child(newsfeedPath)
        .child(newPost.id.toString())
        .set(newPost.toJson());
  }

  @override
  Future<void> deletePost(int postId) {
    return databaseRef.child(newsfeedPath).child(postId.toString()).remove();
  }

  @override
  Stream<NewsfeedVO> getNewsfeedById(int newsfeedId) {
    return databaseRef
        .child(newsfeedPath)
        .child(newsfeedId.toString())
        .once()
        .asStream()
        .map((snapShot) {
      final dynamic value = snapShot.snapshot.value;
      if (value != null) {
        return NewsfeedVO.fromJson(Map<String, dynamic>.from(value));
      } else {
        throw Exception("Data not found");
      }
    });
  }
}
