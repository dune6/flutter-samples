import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';

class Movie {
  final String imageName;
  final String title;
  final String date;
  final String description;

  Movie(
      {required this.imageName,
      required this.title,
      required this.date,
      required this.description});
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      imageName: Images.dune,
      title: 'Записки баскетболиста',
      date: 'April 22, 2003',
      description:
          'This film about something... This film about something... This film about something... This film about something...',
    ),
    Movie(
      imageName: Images.dune,
      title: 'Начало',
      date: 'April 22, 2003',
      description:
          'This film about something... This film about something... This film about something... This film about something...',
    ),
    Movie(
      imageName: Images.dune,
      title: 'Эквилибриум',
      date: 'April 22, 2003',
      description:
          'This film about something... This film about something... This film about something... This film about something...',
    ),
    Movie(
      imageName: Images.dune,
      title: 'Социальная сеть',
      date: 'April 22, 2003',
      description:
          'This film about something... This film about something... This film about something... This film about something...',
    ),
    Movie(
      imageName: Images.dune,
      title: 'Большой куш',
      date: 'April 22, 2003',
      description:
          'This film about something... This film about something... This film about something... This film about something...',
    ),
    Movie(
      imageName: Images.dune,
      title: 'Джентельмены',
      date: 'April 22, 2003',
      description:
          'This film about something... This film about something... This film about something... This film about something...',
    ),
    Movie(
      imageName: Images.dune,
      title: 'Маяк',
      date: 'April 22, 2003',
      description:
          'This film about something... This film about something... This film about something... This film about something...',
    ),
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies =
          _movies.where((element) => element.title.toLowerCase().contains(query.toUpperCase())).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.only(top: 70),
        itemCount: _filteredMovies.length,
        itemExtent: 200,
        itemBuilder: (BuildContext context, int index) {
          final movie = _filteredMovies[index];
          return Padding(
            padding:
                const EdgeInsets.only(right: 20, top: 10, left: 20, bottom: 10),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    children: [
                      Image(image: AssetImage(movie.imageName)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  movie.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  movie.date,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  movie.description,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    onTap: () {},
                  ),
                )
              ],
            ),
          );
        },
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            labelText: 'Поиск',
            filled: true,
            fillColor: Colors.white.withAlpha(235),
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    ]);
  }
}
