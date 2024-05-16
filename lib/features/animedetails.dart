import 'package:animeapp/api/datamodel.dart';
import 'package:animeapp/api/fatchapi.dart';
import 'package:animeapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimeDetail extends StatefulWidget {
  const AnimeDetail(
      {super.key,
      required this.title,
      required this.poster,
      required this.trailerThumbnail,
      required this.synopsis,
      required this.releases,
      required this.producers,
      required this.score,
      required this.genres,
      required this.url});
  final String title;
  final String poster;
  final String trailerThumbnail;
  final String synopsis;
  final String releases;
  final String producers;
  final String score;
  final List<String> genres;
  final String url;

  @override
  State<AnimeDetail> createState() => _AnimeDetailState();
}

class _AnimeDetailState extends State<AnimeDetail> {
  Future<List<AnimeData>>? _topAnime;

  @override
  void initState() {
    super.initState();
    _topAnime = Backend.getTopAnime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 350,
              child: Stack(
                children: [
                  Stack(
                    children: <Widget>[
                      Image.network(
                        widget.trailerThumbnail,
                        fit: BoxFit.cover,
                        height: 300,
                        width: double.infinity,
                      ),
                      Container(
                        height: 300,
                        width: double.infinity,
                        color: Colors.black
                            .withOpacity(0.3), // Adjust opacity as needed
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(widget.poster),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'year : ${widget.releases}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Anime Rating ${widget.score}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '${widget.genres}, ${widget.producers}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // ignore: deprecated_member_use
                        launch(widget.url);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppPallete.primaryColor,
                      ),
                      child: const Text(
                        "Play Trailer",
                        style: TextStyle(
                          color: AppPallete.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Anime Synopsis',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.synopsis,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
