import 'package:flutter/material.dart';
import 'package:smartforce/views/widgets/carousel_indicator.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> images;

  const ImageCarousel({Key key, this.images}) : super(key: key);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: widget.images.length,
            onPageChanged: (v) {
              setState(() {
                _currentPage = v;
              });
            },
            itemBuilder: (c, i) {
              var image = widget.images[i];
              return Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CarouselIndicator(
              length: widget.images.length,
              selected: _currentPage,
            ),
          ),
        ],
      ),
    );
  }
}
