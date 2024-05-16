import 'package:animeapp/api/datamodel.dart';
import 'package:animeapp/api/fatchapi.dart';
import 'package:animeapp/features/animedetails.dart';
import 'package:animeapp/utils/colors.dart';
import 'package:animeapp/widgets/HomePageBannerAnimeWidget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnimeDetail(
                                  // animeData: snapshot.data![index],
                                  poster: snapshot.data![index].poster,
                                  title: snapshot.data![index].title,
                                  trailerThumbnail:
                                      snapshot.data![index].trailerThumbnail,
                                  synopsis: snapshot.data![index].synopsis,
                                  releases: snapshot.data![index].year,
                                  score: snapshot.data![index].score,
                                  producers: snapshot.data![index].producers,
                                  genres: snapshot.data![index].genres,
                                  url: snapshot.data![index].url,
                                ),
                              ),
                            );
                          },
                          child: Padding(
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
                                          snapshot.data![index].poster),
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
                                              decoration: BoxDecoration(
                                                color: AppPallete.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color:
                                                        AppPallete.whiteColor,
                                                    size: 12,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    snapshot.data![index].score,
                                                    style: const TextStyle(
                                                      color:
                                                          AppPallete.whiteColor,
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
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Shimmer.fromColors(
                    baseColor: AppPallete.shimmerColor,
                    highlightColor: AppPallete.shimmerColor,
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 120,
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 120,
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                  if (snapshot.data!.isEmpty) {
                    return const Text('No upcoming anime');
                  }
                  return Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 200.0,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnimeDetail(
                                  // animeData: snapshot.data![index],
                                  poster: snapshot.data![index].poster,
                                  title: snapshot.data![index].title,
                                  trailerThumbnail:
                                      snapshot.data![index].trailerThumbnail,
                                  synopsis: snapshot.data![index].synopsis,
                                  releases: snapshot.data![index].year,
                                  score: snapshot.data![index].score,
                                  producers: snapshot.data![index].producers,
                                  genres: snapshot.data![index].genres,
                                  url: snapshot.data![index].url,
                                ),
                              ),
                            );
                          },
                          child: Padding(
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
                                          snapshot.data![index].poster),
                                      fit: BoxFit.cover,
                                    ),
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
