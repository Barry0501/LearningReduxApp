import 'package:flutter/material.dart';
import 'package:mobile/app/data/images.dart';

class Header extends StatelessWidget {
  // TODO: Xử lý callback hiển thị danh sách các rạp phim

  @override
  Widget build(BuildContext context) {
    final subtitle = Text(
      'Test',
      style: const TextStyle(
        fontSize: 12.0,
        color: Colors.white70,
      ),
    );

    final title = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('inKino'),
        subtitle,
      ],
    );

    return GestureDetector(
      onTap: null,
      child: Row(
        children: <Widget>[
          Image.asset(ImageAssets.logo,width: 28.0,height: 28.0,),
          SizedBox(width: 8.0,),
          title
        ],
      ),    
    );
  }
}
