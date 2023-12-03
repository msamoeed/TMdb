// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../views/movie_details_screen/movie_details_view_model.dart';
import 'movie_button.dart';

class MyVideoPlayer extends ConsumerWidget {
  final MovieDetailsScreenViewModel movieViewModel;

  MyVideoPlayer({super.key, required this.movieViewModel});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return movieViewModel.getVideos(ref).when(
        data: (data) {
          YoutubePlayerController controller = YoutubePlayerController(
            initialVideoId: data!.results![0].key.toString(),
            flags: YoutubePlayerFlags(
              autoPlay: true,
              showLiveFullscreenButton: true,
              mute: true,
              
            ),
          );
          return YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: controller,
              ),
              builder: (context, player) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MovieButton(isTransparent: true, text: "Done", onTap: (){
                       // controller.dispose();
                        movieViewModel.stopVideo();
                      },),
                    ),
                    player,
                  ],
                );
              });
        },
        error: (error, stack) => Text(error.toString()),
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }
}
