
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
      Map<Object?, Object?> objMap = event.snapshot.value as Map<Object?, Object?>;
      Map<String?, dynamic> convertedMap = {};
      objMap.forEach((key, value) {
        convertedMap[key.toString()] = value;
      });

      return (convertedMap.values).map<NewsfeedVO>((e) {
        return NewsfeedVO.fromJson(Map<String, dynamic>.from(e));
      }).toList();
    });
  }
}
