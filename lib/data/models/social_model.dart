import 'package:padc_firebase_tutorial/data/vos/news_feed_vo.dart';

abstract class SocialModel{
  Stream<List<NewsfeedVO>> getNewsfeed();
  Future<void> addNewPost(String description);
  Future<void> deletePost(int postId);
  Stream<NewsfeedVO> getNewsfeedById(int postId);
  Future<void> editPost(NewsfeedVO newPost);
}