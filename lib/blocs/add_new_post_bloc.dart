
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:padc_firebase_tutorial/data/models/social_model.dart';
import 'package:padc_firebase_tutorial/data/models/social_model_impl.dart';
import 'package:padc_firebase_tutorial/data/vos/news_feed_vo.dart';

class AddNewPostBloc extends ChangeNotifier {
  bool isDisposed = false;
  bool isNewPostError = false;
  String postDescription = "";

  /// For Edit Mode
  bool isEditMode = false;
  String userName = '';
  String profilePicture = '';
  NewsfeedVO? mNewsfeedVO;

  // Image
  File? chosenImageFile;

  final SocialModel model = SocialModelImpl();

  AddNewPostBloc(int? postId){
    if(postId != null){
      isEditMode = true;
      _prepopulateDataForEditPost(postId);
      checkNotifyListener();
    }else{
      isEditMode = false;
      _prepopulateDataForAddNewPost();
      checkNotifyListener();
    }
  }



  void onImageChosen(File imageFile) {
    chosenImageFile = imageFile;
    checkNotifyListener();
  }

  void onTapDeleteImage() {
    chosenImageFile = null;
    checkNotifyListener();
  }

  void _prepopulateDataForEditPost(int postId){
    model.getNewsfeedById(postId).listen((newsfeed) {
      print(newsfeed);
      userName = newsfeed.userName?? "";
      profilePicture = newsfeed.profilePicture ?? "";
      postDescription = newsfeed.description ?? "";
      mNewsfeedVO = newsfeed;
      checkNotifyListener();
    });
  }

  void _prepopulateDataForAddNewPost(){
      userName = "ZT";
      profilePicture = "postId";
      checkNotifyListener();
  }

  Future onTapPost() {
    print("ifdufhgkjfdhgkjfhff$isEditMode");
    if (postDescription.isEmpty) {
      isNewPostError = true;
      checkNotifyListener();
      return Future.error("Error");
    } else {
      isNewPostError = false;
      if(isEditMode){
        return _editNewsfeedPost();
      } else{
        return _createNewsfeedPost();
      }
    }
  }

  Future<dynamic> _editNewsfeedPost(){
    mNewsfeedVO?.description = postDescription;
    if(mNewsfeedVO != null){
      return model.editPost(mNewsfeedVO!);
    }else{
      return Future.error("Error");
    }
  }

  Future<void> _createNewsfeedPost(){
    print(postDescription);
    return model.addNewPost(postDescription);
  }

  void onDescriptionChanged(String newDescription) {
    postDescription = newDescription;
    checkNotifyListener();
  }

  void checkNotifyListener() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }
}
