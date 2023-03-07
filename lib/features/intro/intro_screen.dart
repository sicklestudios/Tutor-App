import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tutorapp/colors.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget animation(
    int index,
    int delay,
    Widget child,
  ) {
    // if (index == 1) {
    return FadeInDown(
      delay: Duration(milliseconds: delay),
      child: child,
    );
    // }
    // return FadeInUp(
    //   delay: Duration(milliseconds: delay),
    //   child: child,
    // );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return WillPopScope(
      onWillPop: () {
        // Navigator.pushNamed(context, 'welcome');
        return Future.value(true);
      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor: scaffoldBackgroundColor,
            body: SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: 3,
                      onPageChanged: (newIndex) {
                        setState(() {
                          currentIndex = newIndex;
                        });
                      },
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return SizedBox(
                          width: size.width,
                          height: size.height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              animation(
                                index,
                                150,
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/intro/${index + 1}.png",
                                    width: size.width / 1.2,
                                    height: size.height / 2,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: animation(
                                  index,
                                  500,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        index == 0
                                            ? Icons.search
                                            : index == 1
                                                ? Icons.message_rounded
                                                : Icons.notifications,
                                        color: primaryColor,
                                        size: 40,
                                      ),
                                      Text(
                                        index == 0
                                            ? " Search"
                                            : index == 1
                                                ? " Messaging"
                                                : " Notifications",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 25,
                                            color: primaryColor,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 40),
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        spacing: 6.0,
                        radius: 10.0,
                        dotWidth: 20.0,
                        dotHeight: 10.0,
                        expansionFactor: 3.8,
                        dotColor: primaryColor.withOpacity(0.2),
                        activeDotColor: primaryColor,
                      ),
                      onDotClicked: (newIndex) {
                        setState(() {
                          currentIndex = newIndex;
                          pageController.animateToPage(newIndex,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                        });
                      },
                    ),
                  ),
                  currentIndex <= 1
                      ? Padding(
                          padding: const EdgeInsets.all(45.0),
                          child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  currentIndex = 2;
                                  setState(() {
                                    currentIndex = currentIndex;
                                    pageController.animateToPage(currentIndex,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.ease);
                                  });
                                });
                              },
                              style: OutlinedButton.styleFrom(
                                fixedSize: Size(size.width / 2, 50),
                                shadowColor: Colors.transparent,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                // side: BorderSide(color: Colors.red, width: 1),
                              ),
                              child: const Text(
                                "Skip",
                                style: TextStyle(
                                    fontSize: 22, color: primaryColor),
                              )),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(45.0),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                shadowColor: Colors.transparent,
                                fixedSize: Size(size.width / 2, 50),
                                side: const BorderSide(
                                    color: Colors.black, width: 2),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                // side: BorderSide(color: Colors.red, width: 1),
                              ),
                              child: const Text(
                                "Get Started",
                                style: TextStyle(
                                    fontSize: 19, color: primaryColor),
                              )),
                        ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       /// PAGE INDICATOR
                  //       SmoothPageIndicator(
                  //         controller: pageController,
                  //         count: listOfItems.length,
                  //         effect: const ExpandingDotsEffect(
                  //           spacing: 6.0,
                  //           radius: 10.0,
                  //           dotWidth: 10.0,
                  //           dotHeight: 10.0,
                  //           expansionFactor: 3.8,
                  //           dotColor: Colors.amber,
                  //           activeDotColor: Colors.blue,
                  //         ),
                  //         onDotClicked: (newIndex) {
                  //           setState(() {
                  //             currentIndex = newIndex;
                  //             pageController.animateToPage(newIndex,
                  //                 duration: const Duration(milliseconds: 500),
                  //                 curve: Curves.ease);
                  //           });
                  //         },
                  //       ),
                  //       currentIndex == 2

                  //           /// GET STARTED BTN
                  //           ? Text("data1")

                  //           /// SKIP BTN
                  //           : Text("data2")
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            )),
      ),
    );
  }
}
