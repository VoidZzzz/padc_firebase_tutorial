import 'package:padc_firebase_tutorial/data/models/social_model.dart';
import 'package:padc_firebase_tutorial/data/vos/news_feed_vo.dart';
import 'package:padc_firebase_tutorial/network/real_time_database_data_agent_impl.dart';
import 'package:padc_firebase_tutorial/network/social_app_data_agent.dart';

class SocialModelImpl extends SocialModel {
  static final SocialModelImpl _singleton = SocialModelImpl._internal();

  factory SocialModelImpl() {
    return _singleton;
  }

  SocialModelImpl._internal();

  SocialAppDataAgent dataAgent = RealTimeDatabaseDataAgentImpl();

  @override
  Stream<List<NewsfeedVO>> getNewsfeed() {
    return dataAgent.getNewsfeed();
  }

  @override
  Future<void> addNewPost(String description) {
    var currentMilliSeconds = DateTime.now().millisecondsSinceEpoch;
    var newPost = NewsfeedVO(
        currentMilliSeconds,
        description,
        "",
        "https://img.freepik.com/premium-vector/simple-powerful-black-white-logo-featuring-stylish-man-minimalist-style-with-clean-lines-simple-effective-design_567294-4343.jpg",
        "ZT");
    return dataAgent.addNewPost(newPost);
  }
}
