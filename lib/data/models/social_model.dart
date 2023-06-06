import 'package:padc_firebase_tutorial/data/vos/news_feed_vo.dart';

abstract class SocialModel{
  Stream<List<NewsfeedVO>> getNewsfeed();
}