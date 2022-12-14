import 'package:dio/dio.dart';

import '../model/Games.dart';

import '../model/User.dart';

class GameService {
  final String baseUrlApi = "http://192.168.5.21:3000";

  Future<List<GamesModel>> fetchDataGame() async {
    Response response = await Dio().get("$baseUrlApi/games");
    List<GamesModel> shrimps =
        (response.data as List).map((v) => GamesModel.fromJSON(v)).toList();
    return shrimps;
  }

  Future<List<GamesModel>> fetchDataGamePlatform(String platform) async {
    Response response = await Dio().get("$baseUrlApi/games?platform=$platform");
    List<GamesModel> shrimps =
        (response.data as List).map((v) => GamesModel.fromJSON(v)).toList();
    return shrimps;
  }
}
