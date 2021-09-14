import 'package:flutter/material.dart';
import 'package:smartforce/models/post.dart';
import 'package:smartforce/views/widgets/carousel_indicator.dart';
import 'package:smartforce/views/widgets/image_carousel.dart';
import 'package:smartforce/views/widgets/like_btn.dart';

class PostWidget extends StatefulWidget {
  final Post post;

  const PostWidget({Key key, @required this.post}) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildUserInfo(),
          _buildImageCarousel(),
          _buildDetails(),
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              widget.post.user.avatar,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.post.user.username,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Visibility(
                      visible: widget.post.user.verified,
                      child: Icon(
                        Icons.verified_user,
                        color: Colors.green,
                        size: 15,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 15,
                      color: Colors.grey.shade600,
                    ),
                    Text(
                      widget.post.location,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("No Functionality"),
                  ),
                );
              },
              child: Icon(Icons.more_horiz)),
        ],
      ),
    );
  }

  Widget _buildImageCarousel() {
    return Stack(
      children: [
        ImageCarousel(
          images: widget.post.images,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: LikeBtn(
              initial: widget.post.liked,
              onChange: (v) {},
            ),
          ),
        )
      ],
    );
  }

  Widget _buildDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              Text(
                "${widget.post.date()}",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                ),
              ),
              Container(
                height: 3,
                width: 3,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              Text(
                "${widget.post.time()}",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            widget.post.title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              Text("\$${widget.post.cost()}"),
              Spacer(),
              Text(
                "${widget.post.matchRate}% Match",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
