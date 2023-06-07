import 'package:flutter/material.dart';
import 'package:padc_firebase_tutorial/blocs/add_new_post_bloc.dart';
import 'package:padc_firebase_tutorial/view_items/height_box.dart';
import 'package:padc_firebase_tutorial/view_items/icon_view.dart';
import 'package:padc_firebase_tutorial/view_items/text_view.dart';
import 'package:padc_firebase_tutorial/view_items/width_box.dart';
import 'package:provider/provider.dart';

class AddNewPostPage extends StatelessWidget {
  const AddNewPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddNewPostBloc(),
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
                Row(
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
                        "https://img.freepik.com/premium-vector/simple-powerful-black-white-logo-featuring-stylish-man-minimalist-style-with-clean-lines-simple-effective-design_567294-4343.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const WidthBox(width: 20),
                    const TextView(
                      text: "ZT",
                      fontSize: 20,
                    ),
                  ],
                ),
                const HeightBox(height: 20),
                const PostFieldView(),
                const HeightBox(height: 5),
                ErrorTextView(),
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

class ErrorTextView extends StatelessWidget {
  const ErrorTextView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNewPostBloc>(builder: (context, bloc, widget) => Visibility(
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
            bloc.onDescriptionChanged(text);
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
