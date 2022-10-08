import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:universe_app/data/data.dart';
import 'package:universe_app/utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStartColor, gradientEndColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.3, 0.7],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Explore",
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 44,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    DropdownButton(
                      items: const [
                        DropdownMenuItem(
                          child: Text(
                            "Solar System",
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 24,
                              color: Color(0x7cdbf1ff),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                      onChanged: (e) {},
                      underline: const SizedBox(),
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Image.asset("assets/drop_down_icon.png"),
                      ),
                    ),
                    Container(
                      height: 500,
                      padding: const EdgeInsets.only(left: 32),
                      child: Swiper(
                        pagination: const SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                              activeSize: 20, space: 8),
                        ),
                        itemCount: planets.length,
                        layout: SwiperLayout.STACK,
                        itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 110,
                                    ),
                                    Card(
                                      elevation: 8,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(32.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 100),
                                            Text(
                                              planets[index].name,
                                              style: const TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 44,
                                                color: Color(0xff47455f),
                                                fontWeight: FontWeight.w900,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              'Solar System',
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 23,
                                                color: primaryTextColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            const SizedBox(height: 32),
                                            Row(
                                              children: [
                                                Text(
                                                  'Know more',
                                                  style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: 18,
                                                    color: secondaryTextColor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Icon(
                                                  Icons.arrow_forward,
                                                  color: secondaryTextColor,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Hero(
                                  tag: planets[index].position,
                                  child: Image.asset(planets[index].iconImage),
                                ),
                                Positioned(
                                  right: 24,
                                  bottom: 60,
                                  child: Text(
                                    planets[index].position.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 200,
                                      color: primaryTextColor.withOpacity(0.08),
                                      fontWeight: FontWeight.w900,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(36.0),
            ),
            color: navigationColor,
          ),
          padding: const EdgeInsets.all(24),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/menu_icon.png'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Explore',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/search_icon.png'),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/profile_icon.png'),
              ),
            ],
          )),
    );
  }
}
