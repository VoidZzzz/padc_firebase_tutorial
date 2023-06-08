import 'package:flutter/material.dart';
import 'package:padc_firebase_tutorial/data/vos/news_feed_vo.dart';

import '../resources/dimens.dart';
import '../resources/images.dart';

class NewsFeedItemView extends StatelessWidget {
  const NewsFeedItemView(
      {Key? key,
      required this.onTapEdit,
      required this.onTapDelete,
      required this.newsfeed})
      : super(key: key);

  final NewsfeedVO? newsfeed;
  final Function(int postId) onTapEdit;
  final Function(int postId) onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ProfileImageView(
              image: newsfeed?.profilePicture ?? "",
            ),
            const SizedBox(
              width: MARGIN_MEDIUM_2,
            ),
            NameLocationAndTimeAgoView(name: newsfeed?.userName ?? ''),
            const Spacer(),
            MoreButtonView(
              onTapDelete: () {
                onTapDelete(newsfeed!.id!);
              },
              onTapEdit: () {
                onTapEdit(newsfeed!.id!);
                print(newsfeed!.id!);
              },
            ),
          ],
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        PostImageView(
          postImg: newsfeed?.postImage ?? "",
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        PostDescriptionView(description: newsfeed?.description ?? ""),
        const SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        const Row(
          children: [
            Text(
              "See Comments",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Spacer(),
            Icon(
              Icons.mode_comment_outlined,
              color: Colors.grey,
            ),
            SizedBox(
              width: MARGIN_MEDIUM,
            ),
            Icon(
              Icons.favorite_border,
              color: Colors.grey,
            )
          ],
        )
      ],
    );
  }
}

class PostDescriptionView extends StatelessWidget {
  const PostDescriptionView({Key? key, required this.description})
      : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(
        fontSize: TEXT_REGULAR,
        color: Colors.black,
      ),
    );
  }
}

class PostImageView extends StatelessWidget {
  const PostImageView({Key? key, required this.postImg}) : super(key: key);

  final String postImg;

  @override
  Widget build(BuildContext context) {
    return (postImg == "")
        ? Container()
        : ClipRRect(
            borderRadius: BorderRadius.circular(MARGIN_CARD_MEDIUM_2),
            child: FadeInImage(
              height: 200,
              width: double.infinity,
              placeholder: const NetworkImage(
                NETWORK_IMAGE_POST_PLACEHOLDER,
              ),
              image: NetworkImage(
                postImg,
              ),
              fit: BoxFit.fill,
            ),
          );
  }
}

class MoreButtonView extends StatelessWidget {
  const MoreButtonView(
      {Key? key, required this.onTapDelete, required this.onTapEdit})
      : super(key: key);

  final Function onTapEdit;
  final Function onTapDelete;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 1,
          onTap: () => onTapEdit(),
          child: const Text("Edit"),
        ),
        PopupMenuItem(
          value: 2,
          onTap: () => onTapDelete(),
          child: const Text("Delete"),
        ),
      ],
      child: const Icon(
        Icons.more_vert,
        color: Colors.grey,
      ),
    );
  }
}

class ProfileImageView extends StatelessWidget {
  const ProfileImageView({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(
        image,
      ),
      radius: MARGIN_LARGE,
    );
  }
}

class NameLocationAndTimeAgoView extends StatelessWidget {
  const NameLocationAndTimeAgoView({Key? key, required this.name})
      : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: TEXT_REGULAR_2X,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: MARGIN_SMALL,
            ),
            const Text(
              "- 2 hours ago",
              style: TextStyle(
                fontSize: TEXT_SMALL,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        const Text(
          "Paris",
          style: TextStyle(
            fontSize: TEXT_SMALL,
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
