import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'profile_screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff191919),
        leading: null,centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Favorites",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            GestureDetector(
              onTap: () async {},
              child: SizedBox(
                height: 110,
                width: 110,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color:  Color(0xffFFBA38), width: 1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/avatar.png",
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () async {},
                          child: Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color:  Color(0xffFFBA38), width: 1),
                                borderRadius:
                                BorderRadius.circular(100)),
                            child: Icon(
                              Icons.edit,
                              color: Color(0xffFFBA38),
                              size: 16,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Text("Daniel Demehin"),
            SizedBox(height: 5,),
            Text("seyidave99@gmail.com"),
          ],
        ),
      ),
    );
  }
}
