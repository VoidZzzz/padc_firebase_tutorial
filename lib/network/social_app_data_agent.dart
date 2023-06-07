import 'package:padc_firebase_tutorial/data/vos/news_feed_vo.dart';

abstract class SocialAppDataAgent{
  Stream<List<NewsfeedVO>> getNewsfeed();
  Future<void> addNewPost(NewsfeedVO newPost);
  Future<void> deletePost(int postId);
}