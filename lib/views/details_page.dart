import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:readmore/readmore.dart';
import 'package:universe_app/models/data.dart';
import 'package:universe_app/utils/colors.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.planetInfo}) : super(key: key);
  final PlanetInfo planetInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 250),
                        Text(
                          planetInfo.name,
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: 'Avenir',
                            fontSize: 56,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Solar System',
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: 'Avenir',
                            fontSize: 31,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 32),
                        const Divider(color: Colors.black45),
                        const SizedBox(height: 32),
                        ReadMoreText(
                          planetInfo.description,
                          trimLines: 3,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: ' Show more',
                          trimExpandedText: ' Show less',
                          textAlign: TextAlign.left,
                          moreStyle: const TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Divider(color: Colors.black45),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 32.0),
                            child: Text(
                              'Gallery',
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 25,
                                color: Color(0xff47455f),
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Container(
                          height: 250,
                          padding: const EdgeInsets.only(left: 4.0),
                          child: ListView.builder(
                            itemCount: planetInfo.images.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Card(
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                    planetInfo.images[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: -70,
              child: Hero(
                tag: planetInfo.position,
                child: Image.asset(planetInfo.iconImage),
              ),
            ),
            Positioned(
              top: 50,
              left: 32,
              child: Text(
                planetInfo.position.toString(),
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 247,
                  color: primaryTextColor.withOpacity(0.08),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
            )
          ],
        ),
      ),
    );
  }
}
