import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/newsfeed_bloc.dart';
import '../resources/dimens.dart';
import '../view_items/news_feed_item_view.dart';
import 'add_new_post_page.dart';

class NewsfeedPage extends StatelessWidget {
  const NewsfeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsfeedBloc(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Container(
            margin: const EdgeInsets.only(
              left: MARGIN_MEDIUM,
            ),
            child: const Text(
              "Social",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: TEXT_HEADING_1X,
                color: Colors.black,
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                /// TODO : - Handle Search Here
              },
              child: Container(
                margin: const EdgeInsets.only(
                  right: MARGIN_LARGE,
                ),
                child: const Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: MARGIN_LARGE,
                ),
              ),
            )
          ],
        ),
        body: Container(
          color: Colors.white,
          child: Consumer<NewsfeedBloc>(
            builder: (context, bloc, child) => ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: MARGIN_LARGE,
                horizontal: MARGIN_LARGE,
              ),
              itemBuilder: (context, index) {
                return NewsFeedItemView(
                  newsfeed: bloc.newsfeedLists?[index],
                  onTapDelete: (postId) => bloc.onTapDeletePost(postId),
                  onTapEdit: (postId) {
                    Future.delayed(const Duration(milliseconds: 1000)).then(
                      (value) => _navigateToEditPostPage(context, postId),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: MARGIN_XLARGE,
                );
              },
              itemCount: bloc.newsfeedLists?.length ?? 0,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _navigateToAddNewPostPage(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _navigateToAddNewPostPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddNewPostPage(),
      ),
    );
  }

  Future<dynamic> _navigateToEditPostPage(BuildContext context, int postId) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddNewPostPage(postId: postId),
      ),
    );
  }
}
