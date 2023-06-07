import 'package:flutter/cupertino.dart';
import 'package:padc_firebase_tutorial/data/models/social_model.dart';

import '../data/models/social_model_impl.dart';
import '../data/vos/news_feed_vo.dart';

class NewsfeedBloc extends ChangeNotifier{
  bool isDisposed = false;
  List<NewsfeedVO>? newsfeedLists;

  final SocialModel _model = SocialModelImpl();

  NewsfeedBloc(){
    _model.getNewsfeed().listen((list) {
      newsfeedLists = list;
      print(newsfeedLists?.first.userName);
      checkNotifyListener();
    });
  }

  void onTapDeletePost(int postId)async{
    await _model.deletePost(postId);
  }

  void checkNotifyListener(){
    if(!isDisposed){
      notifyListeners();
    }
  }

@override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }
}