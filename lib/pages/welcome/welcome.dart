import 'package:contacts_buddy/providers/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SplashProvider>(context, listen: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<SplashProvider>(
          builder: (context, splashProvider, child) {
            return Stack(
              children: [
                ImageSlideshow(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  children: [
                    Image.asset(
                      'assets/images/welcome_image_1.png',
                      // fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/welcome_image_2.png',
                      // scale: 50,
                      // fit: BoxFit.cover,
                    ),
                    InkWell(
                      onTap: () {
                        splashProvider
                            .firstTimeLoginVerificationProcess(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const HomeScreen(),
                        //   ),
                        // );
                      },
                      child: Image.asset(
                        'assets/images/welcome_image_1.png',
                      ),
                    )
                  ],
                  // onPageChanged: (value) {
                  //   print('Page changed: $value');
                  // },
                  autoPlayInterval: 3000,
                  isLoop: true,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    splashProvider
                                        .firstTimeLoginVerificationProcess(
                                            context);
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        'Skip',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color.fromARGB(255, 0, 39, 71),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(
                                        Icons.navigate_next_outlined,
                                        size: 35,
                                        color: Color.fromARGB(255, 0, 39, 71),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            );
          },
          // child: Stack(
          //   children: [
          //     ImageSlideshow(
          //       width: double.infinity,
          //       height: MediaQuery.of(context).size.height,
          //       initialPage: 0,
          //       indicatorColor: Colors.blue,
          //       indicatorBackgroundColor: Colors.grey,
          //       children: [
          //         Image.asset(
          //           'assets/images/welcome_image_1.png',
          //           // fit: BoxFit.cover,
          //         ),
          //         Image.asset(
          //           'assets/images/welcome_image_2.png',
          //           // scale: 50,
          //           // fit: BoxFit.cover,
          //         ),
          //         InkWell(
          //           onTap: () {
          //             firstTimeLoginVerificationProcess
          //             // Navigator.push(
          //             //   context,
          //             //   MaterialPageRoute(
          //             //     builder: (context) => const HomeScreen(),
          //             //   ),
          //             // );
          //           },
          //           child: Image.asset(
          //             'assets/images/welcome_image_1.png',
          //           ),
          //         )
          //       ],
          //       // onPageChanged: (value) {
          //       //   print('Page changed: $value');
          //       // },
          //       autoPlayInterval: 3000,
          //       isLoop: true,
          //     ),
          //     const Column(
          //       mainAxisAlignment: MainAxisAlignment.end,
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.end,
          //           children: [
          //             Padding(
          //               padding: EdgeInsets.all(12.0),
          //               child: Row(
          //                 children: [
          //                   Text(
          //                     'Skip',
          //                     style: TextStyle(
          //                       fontSize: 18,
          //                       color: Color.fromARGB(255, 0, 39, 71),
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                   Icon(
          //                     Icons.navigate_next_outlined,
          //                     size: 35,
          //                     color: Color.fromARGB(255, 0, 39, 71),
          //                   )
          //                 ],
          //               ),
          //             )
          //           ],
          //         )
          //       ],
          //     )
          //   ],
          // ),
        ),
      ),
    );
  }
}
