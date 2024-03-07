import 'package:flutter/material.dart';
import 'package:login_page/utils/colors.dart';
import 'package:login_page/views/welcome.dart';

List onboardingData = [
  {
    "image": "assets/images/onboarding1.png",
    "title": "Monitor Kualitas Udara\nReal-time",
    "desc":
    "Pantau tingkat polusi udara, konsentrasi partikel berbahaya, dan indeks kualitas udara dengan akurat.",
  },
  {
    "image": "assets/images/onboarding2.png",
    "title": "Monitor Tampilan Peta\nSecara Interaktif",
    "desc":
    "Identifikasi area dengan udara bersih dan area yang memerlukan perhatian ektra untuk menjaga kesehatan anda.",
  },
  {
    "image": "assets/images/onboarding3.png",
    "title": "History dan Tren\nKualitas Udara",
    "desc":
    "Lihat riwayat kualitas udara selama beberapa waktu terakhir. Amati tren dan pola perubahan kualitas udara. ",
  },
];

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: pageController,
                onPageChanged: (v) {
                  setState(() {
                    currentPage = v;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (_, i) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(onboardingData[i]['image']),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                onboardingData[i]['title'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: "InterBold", fontSize: 24),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                onboardingData[i]['desc'],
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
                    ],
                  );
                }),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Wrap(
                  spacing: 6,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.decelerate,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: currentPage == 0 ? greenColor : greyColor,
                      ),
                      width: currentPage == 0 ? 20 : 8,
                      height: 8,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.decelerate,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: currentPage == 1 ? greenColor : greyColor,
                      ),
                      width: currentPage == 1 ? 20 : 8,
                      height: 8,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.decelerate,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: currentPage == 2 ? greenColor : greyColor,
                      ),
                      width: currentPage == 2 ? 20 : 8,
                      height: 8,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () {
                    if (currentPage == 2) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const WelcomeView(),
                        ),
                      );
                    } else {
                      pageController.animateToPage(currentPage + 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate);
                    }
                  },
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
                        currentPage == 2 ? "Mulai Sekarang" : "Lanjutkan",
                        style: TextStyle(
                            fontFamily: "InterSemiBold",
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              currentPage == 2
                  ? const SizedBox(height: 47)
                  : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () {
                    pageController.animateToPage(2,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.decelerate);
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
                        "Lewati",
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
        ],
      ),
    );
  }
}
