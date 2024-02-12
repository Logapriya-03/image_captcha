import 'package:flutter/material.dart';

class ImageCardShuffler extends StatefulWidget {
  final List<String> images;
  final void Function(int)? onImageSelected;

  ImageCardShuffler({required this.images, required this.onImageSelected});

  @override
  _ImageCardShufflerState createState() => _ImageCardShufflerState();
}

class _ImageCardShufflerState extends State<ImageCardShuffler> {
  late PageController _pageController;
  int _currentPage = 0;


  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> shuffledImages = List.from(widget.images)..shuffle();
    return Container(
      height: 180,
      width: 180,
      child: PageView.builder(
        controller: _pageController,
        itemCount: shuffledImages.length,
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(shuffledImages[index],
            height: 50,
            width: 50,
          );
        },
      ),
    );
  }
  bool onImageSelected(){
    return _currentPage ==
  }
}