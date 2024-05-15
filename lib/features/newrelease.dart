import 'package:animeapp/api/datamodel.dart';
import 'package:animeapp/api/fatchapi.dart';
import 'package:animeapp/utils/colors.dart';
import 'package:flutter/material.dart';

class NewRelease extends StatefulWidget {
  const NewRelease({super.key});

  @override
  State<NewRelease> createState() => _NewReleaseState();
}

class _NewReleaseState extends State<NewRelease> {
  Future<List<AnimeData>>? _upcomingAnime;

  @override
  void initState() {
    super.initState();
    _upcomingAnime = Backend.getUpcomingAnime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppPallete.backgroundColor,
        title: const Text('New Releases'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // List upcoming anime in grid view
            FutureBuilder<List<AnimeData>>(
              future: _upcomingAnime,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      // scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 170,
                                width: 120,
                                margin: const EdgeInsets.only(right: 10),
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 160,
                                    child: Text(
                                      snapshot.data![index].title,
                                      // maxLines: 1,
                                      // overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: AppPallete.whiteColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 160,
                                    child: Text(
                                      "Releases Date : ${snapshot.data![index].releases}",
                                      style: const TextStyle(
                                        color: AppPallete.whiteColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 160,
                                    child: Text(
                                      "Description :${snapshot.data![index].synopsis}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: AppPallete.whiteColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
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
          ],
        ),
      ),
    );
  }
}
