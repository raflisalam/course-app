import 'package:coursesapp/models/description_courses.dart';
import 'package:flutter/material.dart';
import 'package:read_more_text/read_more_text.dart';

class DescriptionSection extends StatelessWidget {
  final String images;

  DescriptionSection(this.images);
  @override
  Widget build(BuildContext context) {
    String? descCourses;

    switch (images) {
      case 'Flutter':
        descCourses = descFlutter;
        break;
      case 'Python':
        descCourses = descPython;
        break;
      case 'React':
        descCourses = descReact;
        break;
      case 'JavaScript':
        descCourses = descJavascript;
        break;
      case 'Kotlin':
        descCourses = descKotlin;
        break;
      case 'Swift':
        descCourses = descSwift;
        break;
      default:
        descCourses = ''; // Default jika images tidak cocok dengan yang ada
        break;
    }

    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          ReadMoreText(
            "$descCourses",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black.withOpacity(0.7),
            ),
            numLines: 4,
            readMoreText: 'show more',
            readLessText: 'show less',
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Courses Length: ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.timer,
                color: Colors.red,
              ),
              SizedBox(width: 5),
              Text(
                "26 Hours",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                "Rating:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              SizedBox(width: 5),
              Text(
                "4.5",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
