import 'package:flutter/material.dart';
import 'package:ramene/constant/constant.dart';
import '../../model/Games.dart';
import '../../model/User.dart';
import '../../navigator/tab.dart';
import '../../viewmodel/game_service.dart';
import '../detail/detailGame.dart';

class Home extends StatefulWidget {
  // final UserModel user;
  int user;
  Home({Key? key, required this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  var lastIndex;

  @override
  Widget build(BuildContext context) {
    Widget tabSemua = FutureBuilder<List<GamesModel>>(
      future: GameService().fetchDataGame(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Container(
              color: white,
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailGame(
                                      game: snapshot.data![index],
                                      user: widget.user,
                                      fetchgame: GameService().fetchDataGame(),
                                    )));
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 190,
                            width: 400,
                            child: Image.network(
                              snapshot.data![index].cover,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![index].name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: black),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    snapshot.data![index].genre,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: black,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    "${snapshot.data![index].publisher}",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: black,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              )),
                        ],
                      ),
                    );
                  }),
            );
          }
        }
      },
    );

    Widget tabPC = FutureBuilder<List<GamesModel>>(
      future: GameService().fetchDataGamePlatform("PC"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Container(
                color: white,
                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailGame(
                                        game: snapshot.data![index],
                                        user: widget.user,
                                        fetchgame: GameService()
                                            .fetchDataGamePlatform("PC"),
                                      )));
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 190,
                              width: 400,
                              child: Image.network(
                                snapshot.data![index].cover,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].name,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: black),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      snapshot.data![index].genre,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: black,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      "${snapshot.data![index].publisher}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: black,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                )),
                          ],
                        ),
                      );
                    }));
          }
        }
      },
    );

    Widget tabMobile = FutureBuilder<List<GamesModel>>(
      future: GameService().fetchDataGamePlatform("Mobile"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Container(
                color: white,
                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailGame(
                                        game: snapshot.data![index],
                                        user: widget.user,
                                        fetchgame: GameService()
                                            .fetchDataGamePlatform("Mobile"),
                                      )));
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 190,
                              width: 400,
                              child: Image.network(
                                snapshot.data![index].cover,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].name,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: black),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      snapshot.data![index].genre,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: black,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      "${snapshot.data![index].publisher}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: black,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                )),
                          ],
                        ),
                      );
                    }));
          }
        }
      },
    );

    return TabsController(
      Tab1: tabSemua,
      Tab2: tabPC,
      Tab3: tabMobile,
      user: widget.user,
    );
  }
}
