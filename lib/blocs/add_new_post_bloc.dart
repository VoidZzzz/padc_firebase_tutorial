import 'package:flutter/foundation.dart';
import 'package:padc_firebase_tutorial/data/models/social_model.dart';
import 'package:padc_firebase_tutorial/data/models/social_model_impl.dart';

class AddNewPostBloc extends ChangeNotifier {
  bool isDisposed = false;
  bool isNewPostError = false;
  String postDescription = "";

  final SocialModel model = SocialModelImpl();

  Future onTapPost() {
    if (postDescription.isEmpty) {
      isNewPostError = true;
      checkNotifyListener();
      return Future.error("Error");
    } else {
      isNewPostError = false;
      checkNotifyListener();
      return model.addNewPost(postDescription);
    }
  }

  void onDescriptionChanged(String newDescription) {
    postDescription = newDescription;
    print(postDescription);
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
