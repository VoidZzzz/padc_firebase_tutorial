
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:padc_firebase_tutorial/blocs/add_new_post_bloc.dart';
import 'package:padc_firebase_tutorial/view_items/height_box.dart';
import 'package:padc_firebase_tutorial/view_items/icon_view.dart';
import 'package:padc_firebase_tutorial/view_items/text_view.dart';
import 'package:padc_firebase_tutorial/view_items/width_box.dart';
import 'package:provider/provider.dart';

import '../resources/dimens.dart';

class AddNewPostPage extends StatelessWidget {
  const AddNewPostPage({Key? key, this.postId}) : super(key: key);

  final int? postId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddNewPostBloc(postId),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconView(
                size: 25,
                icon: Icons.keyboard_arrow_left,
                onTap: () => Navigator.of(context).pop(),
              ),
              const WidthBox(width: 20),
              const TextView(
                text: "Add New Post",
                fontSize: 20,
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightBox(height: 20),
                ProfileImageAndNameView(),
                const HeightBox(height: 20),
                const PostFieldView(),
                const HeightBox(height: 5),
                const ErrorTextView(),
                const HeightBox(height: 20),
                PostImageView(),
                const HeightBox(height: 20),
                Consumer<AddNewPostBloc>(
                  builder: (context, bloc, child) => PostButtonView(
                    onTap: () {
                      bloc
                          .onTapPost()
                          .then((value) => Navigator.of(context).pop());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PostImageView extends StatelessWidget {
  const PostImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNewPostBloc>(
      builder: (context, bloc, child) => Container(
        padding: const EdgeInsets.all(MARGIN_MEDIUM),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Stack(
          children: [
            Container(
              child: (bloc.chosenImageFile == null)
                  ? GestureDetector(
                      child: SizedBox(
                        height: 300,
                        child: Image.network(
                          "https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png?w=640",
                        ),
                      ),
                      onTap: () async {
                        final ImagePicker _picker = ImagePicker();
                        // Pick an image
                        final XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        if (image != null) {
                          bloc.onImageChosen(File(image.path));
                        }
                      },
                    )
                  : SizedBox(
                      height: 300,
                      child: Image.file(
                        bloc.chosenImageFile ?? File(""),
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Visibility(
                visible: bloc.chosenImageFile != null,
                child: GestureDetector(
                  onTap: () {
                    bloc.onTapDeleteImage();
                  },
                  child: const Icon(
                    Icons.delete_rounded,
                    color: Colors.red,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileImageAndNameView extends StatelessWidget {
  const ProfileImageAndNameView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNewPostBloc>(
      builder: (context, bloc, child) => Row(
        children: [
          Container(
            height: 50,
            width: 50,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Image.network(
              bloc.profilePicture,
              fit: BoxFit.cover,
            ),
          ),
          const WidthBox(width: 20),
          TextView(
            text: bloc.userName,
            fontSize: 20,
          ),
        ],
      ),
    );
  }
}

class ErrorTextView extends StatelessWidget {
  const ErrorTextView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNewPostBloc>(
      builder: (context, bloc, widget) => Visibility(
        visible: bloc.isNewPostError,
        child: const TextView(
          text: "Error: Field cannot be empty",
          color: Colors.red,
          fontSize: 10,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

class PostFieldView extends StatelessWidget {
  const PostFieldView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNewPostBloc>(
      builder: (context, bloc, child) => Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: TextField(
          controller: TextEditingController(text: bloc.postDescription),
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.grey,
          maxLines: 15,
          decoration: InputDecoration(
            hintText: "What's on your mind?",
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black.withOpacity(0.5),
            ),
            focusedBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
          ),
          onChanged: (text) {
            bloc.postDescription = text;
            // bloc.onDescriptionChanged(text); //<= not working
          },
        ),
      ),
    );
  }
}

class PostButtonView extends StatelessWidget {
  const PostButtonView({super.key, required this.onTap});

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () => onTap(),
      child: const SizedBox(
        height: 45,
        width: double.maxFinite,
        child: Center(
          child: TextView(
            text: "Post",
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
