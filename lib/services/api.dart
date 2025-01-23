import 'dart:convert';

import 'package:fultter_memer_app/model/memes_response.dart';
import 'package:http/http.dart' as http;

abstract class APis {
  static const String _baseUrl = 'https://api.imgflip.com';

  static Future<MemeData> getMeme() async {
    final response = await http.get(Uri.parse('$_baseUrl/get_memes'));
    if (response.statusCode == 200) {
      // final json = jsonDecode(response.body);
      // final memes = json['data']['memes'];
      // for (var meme in memes) {
      //   final memeModel = MemeModel(
      //     id: meme['id'],
      //     name: meme['name'],
      //     url: meme['url'],
      //     width: meme['width'],
      //     height: meme['height'],
      //     boxCount: meme['box_count'],
      //   );
      //   await MemeModel.insert(memeModel);
      // }
      final MemeResponse memeResponse =
          MemeResponse.fromJson(jsonDecode(response.body));
      return memeResponse.data!;
    } else {
      throw Exception('Failed to load memes');
    }
  }
}
