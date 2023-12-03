
import 'package:flutter/material.dart';
import 'package:flutterapp/views/movie_details_screen/movie_details_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../i18n/strings.g.dart';
import '../../src/helpers/constants/app_typography.dart';

class MovieDetailsScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieDetailsScreenViewModel>.reactive(
      builder:
          (BuildContext context, MovieDetailsScreenViewModel viewModel, Widget? _) {
        return Scaffold(
           extendBodyBehindAppBar: true,
           appBar:AppBar(
             centerTitle: false,
             title: Text(t.movie_screen.watch,
                                style: AppTypography.primary.label16),
           ) ,

        );
      },
      viewModelBuilder: () => MovieDetailsScreenViewModel(context),
    );
  }
}
