import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:animeapp/api/datamodel.dart';
import 'package:http/http.dart' as http;

class Backend {
  //search anime
  static Future<List<AnimeData>> searchAnime(String name) async {
    final response =
        await http.get(Uri.parse('https://api.jikan.moe/v4/anime?q=$name'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['data'];
      // log('fetching data from api:  $body ');

      List<AnimeData> animeList =
          body.map((dynamic item) => AnimeData.fromMap(item)).toList();

      log(' Searched Anime List :  animeList ');

      return animeList;
    } else {
      throw Exception('Failed to load anime');
    }
  }

  //get top anime

  static Future<List<AnimeData>> getTopAnime() async {
    final response =
        await http.get(Uri.parse('https://api.jikan.moe/v4/top/anime'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['data'];
      List<AnimeData> animeList =
          body.map((dynamic item) => AnimeData.fromMap(item)).toList();
      log('Top Anime List :  animeList ');
      return animeList;
    } else {
      throw Exception('Failed to load top anime');
    }
  }

  //get random anime
  static Future<List<AnimeData>> getRandomAnime() async {
    final response = await http
        .get(Uri.parse('https://api.jikan.moe/v4/random/anime'))
        .timeout(const Duration(seconds: 5), onTimeout: () {
      throw TimeoutException('The connection has timed out!');
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body)['data'];
      AnimeData anime = AnimeData.fromMap(body);
      log('Random Anime :  anime ');
      return [anime]; // Wrap the single anime object in a list
    } else if (response.statusCode == 429) {
      throw Exception('You are being rate limited!');
    } else {
      throw Exception('Failed to load random anime');
    }
  }

  //get upcoming anime season
  static Future<List<AnimeData>> getUpcomingAnime() async {
    final response =
        await http.get(Uri.parse('https://api.jikan.moe/v4/seasons/upcoming'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['data'];
      log('fetching data from api:  body ');

      List<AnimeData> animeList =
          body.map((dynamic item) => AnimeData.fromMap(item)).toList();
      log('Upcoming Anime List :  $animeList ');
      return animeList;
    } else {
      throw Exception('Failed to load upcoming anime');
    }
  }
}
