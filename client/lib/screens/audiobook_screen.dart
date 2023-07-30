import 'package:audioplayers/audioplayers.dart';
import 'package:bookology/models/book_model.dart';
import 'package:bookology/providers/books_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AudioBookScreen extends ConsumerStatefulWidget {
  final BookModel? book;
  const AudioBookScreen({Key? key, this.book}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AudioBookScreenState();
}

class _AudioBookScreenState extends ConsumerState<AudioBookScreen> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _duration = duration;
      });
    });

    audioPlayer.onPositionChanged.listen((Duration position) {
      setState(() {
        _position = position;
      });
    });

    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        _position = _duration;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fav = ref.watch(favouriteProvider);
    final bought = ref.watch(buyProvider);

    final BookModel data =
        ModalRoute.of(context)?.settings.arguments as BookModel;

    void addFav() async {
      ref.read(favouriteProvider.notifier).addBook(data);
    }

    void removeFav() async {
      ref.read(favouriteProvider.notifier).removeBook(data);
    }

    bool isFav = fav.any((element) => element.bookId == data.bookId);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white.withOpacity(0.1),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 20,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white.withOpacity(0.1),
                      ),
                    ),
                    onPressed: () {
                      isFav ? removeFav() : addFav();
                    },
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: data.bookId,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: data.cover,
                        height: 250,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                data.name,
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                data.author,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const Spacer(),
              // music slider
              Slider(
                min: 0.0,
                max: _duration.inSeconds.toDouble(),
                value: _position.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);
                  await audioPlayer.resume();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.skip_previous,
                      size: 50,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      String url = "audio/ad.mp3";
                      isPlaying
                          ? audioPlayer.pause()
                          : audioPlayer.play(
                              AssetSource(url),
                            );
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 50,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.skip_next,
                      size: 50,
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
