import 'package:flutter/material.dart';
import 'package:padc_firebase_tutorial/data/vos/news_feed_vo.dart';

import '../resources/dimens.dart';
import '../resources/images.dart';

class NewsFeedItemView extends StatelessWidget {
  const NewsFeedItemView({Key? key, required this.newsfeed}) : super(key: key);

  final NewsfeedVO? newsfeed;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            ProfileImageView(image: '',),
            SizedBox(
              width: MARGIN_MEDIUM_2,
            ),
            NameLocationAndTimeAgoView(),
            Spacer(),
            MoreButtonView(),
          ],
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        PostImageView(),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        PostDescriptionView(),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Row(
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
  const PostDescriptionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "You're bound to find the perfect beach caption to complement the stunning landscapes, golden hour selfies, and silly group photos filling your camera roll. Joke lovers will scream \"shell yeah!\"",
      style: TextStyle(
        fontSize: TEXT_REGULAR,
        color: Colors.black,
      ),
    );
  }
}

class PostImageView extends StatelessWidget {
  const PostImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(MARGIN_CARD_MEDIUM_2),
      child: const FadeInImage(
        height: 200,
        width: double.infinity,
        placeholder: NetworkImage(
          NETWORK_IMAGE_POST_PLACEHOLDER,
        ),
        image: NetworkImage(
          "https://images.unsplash.com/photo-1591266360949-c54e3296de4c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2VhJTIwdmlld3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}

class MoreButtonView extends StatelessWidget {
  const MoreButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Icon(
        Icons.more_vert,
        color: Colors.grey,
      ),
    );
  }
}

class ProfileImageView extends StatelessWidget {
  const ProfileImageView({
    Key? key, required this.image
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(image,
      ),
      radius: MARGIN_LARGE,
    );
  }
}

class NameLocationAndTimeAgoView extends StatelessWidget {
  const NameLocationAndTimeAgoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Emma Brody",
              style: TextStyle(
                fontSize: TEXT_REGULAR_2X,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: MARGIN_SMALL,
            ),
            Text(
              "- 2 hours ago",
              style: TextStyle(
                fontSize: TEXT_SMALL,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
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
