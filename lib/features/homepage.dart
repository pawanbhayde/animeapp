import 'package:animeapp/api/datamodel.dart';
import 'package:animeapp/api/fatchapi.dart';
import 'package:animeapp/utils/colors.dart';
import 'package:animeapp/widgets/HomePageBannerAnimeWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<AnimeData>>? _topAnime;
  Future<List<AnimeData>>? _upcomingAnime;
  // Future<List<Anime>>? _popularAnime;

  @override
  void initState() {
    super.initState();
    _topAnime = Backend.getTopAnime();
    _upcomingAnime = Backend.getUpcomingAnime();
    // _popularAnime = Backend.getAnimeRecommendations();
  }

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
            //list of popular anime
            FutureBuilder<List<AnimeData>>(
              future: _topAnime,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 200.0,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
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
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        snapshot.data![index].trailerThumbnail),
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
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: const Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: AppPallete
                                                      .backgroundColor,
                                                  size: 12,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  '4.5',
                                                  style: TextStyle(
                                                    color: AppPallete
                                                        .backgroundColor,
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
                              SizedBox(
                                width: 120,
                                child: Text(
                                  snapshot.data![index].title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: AppPallete.whiteColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                );
              },
            ),

            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcomming Anime',
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
            FutureBuilder<List<AnimeData>>(
              future: _upcomingAnime,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 200.0,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
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
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        snapshot.data![index].trailerThumbnail),
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
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: const Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: AppPallete
                                                      .backgroundColor,
                                                  size: 12,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  '4.5',
                                                  style: TextStyle(
                                                    color: AppPallete
                                                        .backgroundColor,
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
                              SizedBox(
                                width: 120,
                                child: Text(
                                  snapshot.data![index].title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:const TextStyle(
                                    color: AppPallete.whiteColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                );
              },
            ),
          const  SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
