import 'package:coursesapp/models/colors.dart';
import 'package:coursesapp/models/video_courses.dart';
import 'package:coursesapp/widgets/description_section.dart';
import 'package:coursesapp/widgets/favorite_button.dart';
import 'package:coursesapp/widgets/video_section.dart';
import 'package:coursesapp/models/name_courses.dart';
import 'package:flutter/material.dart';

class DetailCourseScreen extends StatefulWidget {
  String images;
  DetailCourseScreen(this.images);

  @override
  State<DetailCourseScreen> createState() => _DetailCourseScreenState();
}

class _DetailCourseScreenState extends State<DetailCourseScreen> {
  bool isVideoSection = true;

  @override
  Widget build(BuildContext context) {
    String coursesName;
    List<String>? videoList;

    switch (widget.images) {
      case 'Flutter':
        coursesName = coursesFlutter;
        break;
      case 'Python':
        coursesName = coursesPython;
        break;
      case 'React':
        coursesName = coursesReact;
        break;
      case 'JavaScript':
        coursesName = coursesJavascript;
        break;
      case 'Kotlin':
        coursesName = coursesKotlin;
        break;
      case 'Swift':
        coursesName = coursesSwift;
        break;
      default:
        coursesName =
            'Default'; // Default jika images tidak cocok dengan yang ada
        break;
    }

    switch (widget.images) {
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

    int numberOfVideos = videoList.length;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.images,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: const FavoriteButton(),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF1F2126).withOpacity(0.1),
                image: DecorationImage(
                  image: AssetImage("images/${widget.images}.png"),
                ),
              ),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: primaryColor,
                    size: 45,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              "$coursesName",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Created by Raflisalam",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: primaryVariantColor,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "${numberOfVideos} Videos",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: primaryVariantColor.withOpacity(0.6),
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    color: isVideoSection
                        ? primaryVariantColor
                        : primaryVariantColor.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isVideoSection = true;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        child: Text(
                          "Videos",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: isVideoSection
                        ? primaryVariantColor.withOpacity(0.6)
                        : primaryVariantColor,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isVideoSection = false;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        child: Text(
                          "Description",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            isVideoSection
                ? VideoSection(widget.images)
                : DescriptionSection(widget.images),
          ],
        ),
      ),
    );
  }
}
