import 'package:animeapp/utils/colors.dart';
import 'package:animeapp/widgets/HomePageBannerAnimeWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomePageBannerAnimeWidget(),
            // Trenidng Anime horizontal list
            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending Anime',
                    style: TextStyle(
                        color: AppPallete.whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: AppPallete.primaryColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            // Trending Anime List
            Container(
              padding: const EdgeInsets.only(left: 10),
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 170,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage('assets/demon.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Anime Rating At top left
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: AppPallete.primaryColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: AppPallete.backgroundColor,
                                            size: 12,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                              color: AppPallete.backgroundColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Demon Slayer',
                          style: TextStyle(
                            color: AppPallete.whiteColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommanded Anime',
                    style: TextStyle(
                        color: AppPallete.whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: AppPallete.primaryColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            // Trending Anime List
            Container(
              padding: const EdgeInsets.only(left: 10),
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 170,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage('assets/demon.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Anime Rating At top left
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: AppPallete.primaryColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: AppPallete.backgroundColor,
                                            size: 12,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                              color: AppPallete.backgroundColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Demon Slayer',
                          style: TextStyle(
                            color: AppPallete.whiteColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
