import 'package:flutter/material.dart';
import 'package:login_page/views/login.dart';

import '../utils/colors.dart';
import 'onboarding.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeState();
}

class _WelcomeState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 69),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Nikmati Aktifitas Dengan Udara Terbaik",
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(fontFamily: "InterBold", fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Buat akun atau masuk untuk mendapatkan\ninformasi kualitas udara disekitarmu",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "InterMedium",
                        fontSize: 14,
                        color: fontGreyColor),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(55, 0, 55, 78),
            child: Image.asset("assets/images/welcome.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: greenColor,
                ),
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 13.5),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Buat Akun",
                    style: TextStyle(
                        fontFamily: "InterSemiBold",
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13.5),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Masuk",
                    style: TextStyle(
                        fontFamily: "InterSemiBold",
                        fontSize: 14,
                        color: greenColor),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
