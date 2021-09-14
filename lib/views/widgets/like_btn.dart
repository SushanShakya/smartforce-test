import 'package:flutter/material.dart';

class LikeBtn extends StatefulWidget {
  final bool initial;
  final Function(bool) onChange;

  const LikeBtn({Key key, this.initial = false, @required this.onChange})
      : super(key: key);

  @override
  _LikeBtnState createState() => _LikeBtnState();
}

class _LikeBtnState extends State<LikeBtn> {
  bool value;

  @override
  void initState() {
    super.initState();
    value = widget.initial;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          value = !value;
        });
        widget.onChange(value);
      },
      child: Icon(
        (value) ? Icons.favorite : Icons.favorite_border,
        color: Colors.white,
      ),
    );
    // return Container();
  }
}
