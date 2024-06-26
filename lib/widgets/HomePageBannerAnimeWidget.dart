// ignore_for_file: file_names, deprecated_member_use

import 'package:animeapp/api/datamodel.dart';
import 'package:animeapp/api/fatchapi.dart';
import 'package:animeapp/features/animedetails.dart';
import 'package:animeapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadow_overlay/shadow_overlay.dart';

import 'package:url_launcher/url_launcher.dart';

class HomePageBannerAnimeWidget extends StatefulWidget {
  const HomePageBannerAnimeWidget({
    super.key,
  });

  @override
  State<HomePageBannerAnimeWidget> createState() =>
      _HomePageBannerAnimeWidgetState();
}

class _HomePageBannerAnimeWidgetState extends State<HomePageBannerAnimeWidget> {
  Future<List<AnimeData>>? _topRandomAnime;

  @override
  void initState() {
    super.initState();
    _topRandomAnime = Backend.getRandomAnime();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _topRandomAnime,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var anime = snapshot.data![0];
          return Stack(
            children: [
              ShadowOverlay(
                shadowHeight: 200,
                shadowWidth: 400,
                shadowColor: AppPallete.backgroundColor,
                child: Image.network(
                  anime.poster,
                  fit: BoxFit.cover,
                  height: 400,
                  width: 400,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      end: const Alignment(0.0, 0.4),
                      begin: const Alignment(0.0, -1),
                      colors: <Color>[
                        const Color(0x8A000000),
                        Colors.black12.withOpacity(0.0)
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: AppPallete.whiteColor,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings_outlined,
                    color: AppPallete.whiteColor,
                  ),
                ),
              ),
              // center column for the title and subtitle and play and add to list buttons
              Positioned(
                bottom: 20,
                left: 40,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      anime.title,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppPallete.whiteColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const SizedBox(height: 10),
                    Text(
                      anime.synopsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppPallete.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnimeDetail(
                                  // animeData: snapshot.data![index],
                                  poster: anime.poster,
                                  title: anime.title,
                                  trailerThumbnail: anime.trailerThumbnail,
                                  synopsis: anime.synopsis,
                                  releases: anime.year,
                                  score: anime.score,
                                  producers: anime.producers,
                                  genres: anime.genres,
                                  url: anime.url,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.play_arrow,
                              color: AppPallete.whiteColor),
                          label: const Text('Play',
                              style: TextStyle(color: AppPallete.whiteColor)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppPallete.primaryColor,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add,
                              color: AppPallete.whiteColor),
                          label: const Text(
                            'My List',
                            style: TextStyle(color: AppPallete.whiteColor),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            side:
                                const BorderSide(color: AppPallete.whiteColor),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                color: AppPallete.shimmerColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }
      },
    );
  }
}
