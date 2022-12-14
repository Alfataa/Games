import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ramene/model/Games.dart';
import 'package:ramene/viewmodel/game_service.dart';

import '../../model/User.dart';

import '../crud/update.dart';
import '../home/home.dart';
import '../profile/profile.dart';

class DetailGame extends StatefulWidget {
  final GamesModel game;
  int user;
  Future<List<GamesModel>> fetchgame;
  DetailGame(
      {Key? key,
      required this.game,
      required this.user,
      required this.fetchgame})
      : super(key: key);

  @override
  State<DetailGame> createState() => _DetailGameState();
}

class _DetailGameState extends State<DetailGame> {
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        Update(user: widget.user, gameid: widget.game.id),
                  ));
                },
                child: const Icon(
                  Icons.update,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () async {
                  Dio dio = Dio();

                  var baseUrlApi = GameService().baseUrlApi;

                  var responseApi =
                      await dio.delete('$baseUrlApi/games/${widget.game.id}');
                  debugPrint(responseApi.data.toString());

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(user: widget.user)));
                },
                child: const Icon(
                  Icons.delete,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: FutureBuilder<List<GamesModel>>(
        future: widget.fetchgame,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Stack(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("${widget.game.name}",
                                    style:
                                        Theme.of(context).textTheme.headline6),
                              ),
                              Text(
                                "Genre : ${widget.game.genre}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 49, 49, 49)),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Publisher : ${widget.game.publisher}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 49, 49, 49)),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Release Date : ${widget.game.release}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 49, 49, 49)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 395,
                      height: 470,
                      child: Image.network(
                        widget.game.cover,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "${widget.game.description}",
                        style: Theme.of(context).textTheme.bodyText1,
                        softWrap: true,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
