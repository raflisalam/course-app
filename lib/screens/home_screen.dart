import 'package:coursesapp/models/colors.dart';
import 'package:coursesapp/models/video_courses.dart';
import 'package:coursesapp/screens/detail_course_screen.dart';
import 'package:flutter/material.dart';
import 'package:coursesapp/models/courses.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      size: 22,
                      color: primaryVariantColor,
                    ),
                    Icon(
                      Icons.notifications,
                      size: 22,
                      color: primaryVariantColor,
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 15),
                  child: Text(
                    "Hi, everyone let's learning programming language!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: primaryVariantColor,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search course here...",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 15, right: 15),
            child: Column(
              children: [
                GridView.builder(
                  itemCount: courseMenu.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(
                            child: courseMenuIcons[index],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          courseMenu[index],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        )
                      ],
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Courses",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: courseImage.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        (MediaQuery.of(context).size.height - 50 - 25) /
                            (4 * 200),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    // Dapatkan nama kursus dari courseImage[index]
                    String courseName = courseImage[index];

                    // Deklarasikan numberOfVideos di sini
                    int? numberOfVideos;

                    // Lakukan switch berdasarkan courseName
                    switch (courseName) {
                      case 'Flutter':
                        numberOfVideos = flutterVideoList.length;
                        break;
                      case 'Python':
                        numberOfVideos = pythonVideoList.length;
                        break;
                      case 'React':
                        numberOfVideos = reactVideoList.length;
                        break;
                      case 'JavaScript':
                        numberOfVideos = javascriptVideoList.length;
                        break;
                      case 'Kotlin':
                        numberOfVideos = kotlinVideoList.length;
                        break;
                      case 'Swift':
                        numberOfVideos = swiftVideoList.length;
                        break;
                      default:
                        numberOfVideos =
                            0; // Default jika nama kursus tidak cocok dengan yang ada
                        break;
                    }

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailCourseScreen(courseName),
                            ));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: secondaryColor,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                "images/$courseName.png",
                                width: 80,
                                height: 80,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              courseName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: primaryVariantColor,
                              ),
                            ),
                            Text(
                              "$numberOfVideos Videos",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: primaryVariantColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        selectedItemColor: primaryVariantColor,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: 'Courses'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
