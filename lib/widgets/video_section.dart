import 'package:coursesapp/models/colors.dart';
import 'package:coursesapp/models/video_courses.dart';
import 'package:flutter/material.dart';

class VideoSection extends StatelessWidget {
  final String images;

  VideoSection(this.images);

  @override
  Widget build(BuildContext context) {
    List<String>? videoList;

    switch (images) {
      case 'Flutter':
        videoList = flutterVideoList.cast<String>();
        break;
      case 'Python':
        videoList = pythonVideoList.cast<String>();
        break;
      case 'React':
        videoList = reactVideoList.cast<String>();
        break;
      case 'JavaScript':
        videoList = javascriptVideoList.cast<String>();
        break;
      case 'Kotlin':
        videoList = kotlinVideoList.cast<String>();
        break;
      case 'Swift':
        videoList = swiftVideoList.cast<String>();
        break;
      default:
        videoList = []; // Default jika images tidak cocok dengan yang ada
        break;
    }

    return ListView.builder(
      itemCount: videoList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: index == 0
                  ? primaryVariantColor
                  : primaryVariantColor.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Text(
            videoList![index],
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            "20 min 50 sec",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }
}
