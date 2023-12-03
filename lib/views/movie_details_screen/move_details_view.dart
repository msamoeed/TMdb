import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/core/config.dart';
import 'package:flutterapp/src/helpers/constants/app_colors.dart';
import 'package:flutterapp/views/movie_details_screen/movie_details_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../i18n/strings.g.dart';
import '../../src/helpers/constants/app_typography.dart';

class MovieDetailsScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieDetailsScreenViewModel>.reactive(
      builder: (BuildContext context, MovieDetailsScreenViewModel viewModel,
          Widget? _) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
             backgroundColor: Colors.transparent,
            centerTitle: false,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_new, color: AppColors.textWhiteColor,),
            ),
            title: Text(t.movie_screen.watch,
                style: AppTypography.darkprimary.label16),
          ),
          body: Column(
            children: [
             
              Container(
                height: 550.h,
                 decoration: BoxDecoration(
                              shape: BoxShape.rectangle,

                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: CachedNetworkImageProvider(
                                    '${Config.imageUrl}${(viewModel.movieDetails.movie.posterPath).toString()}'),
                              ),
                            ),
                            child:Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('${t.movie_detail_screen.releaseDate} ${viewModel.movieDetails.movie.releaseDate}', style: AppTypography.darkprimary.label16.copyWith(fontWeight: FontWeight.bold),),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: SizedBox(
                                      height: 70.h,
                                      width: 250.w,
                                      child: Card(
                                        color: AppColors.buttonColor,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                        child: Center(child: Text(t.movie_detail_screen.getTickets, style: AppTypography.darkprimary.label16.copyWith(fontWeight: FontWeight.bold),)),
                                      )),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 15.h),
                                    child: SizedBox(
                                      height: 70.h,
                                      width: 250.w,
                                      child: Card(
                                        color: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(color: AppColors.buttonColor),
                                          borderRadius: BorderRadius.circular(15)),
                                        child: Center(child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.play_arrow, color: AppColors.textWhiteColor,), 
                                            Text(t.movie_detail_screen.watchTrailer, style: AppTypography.darkprimary.label16.copyWith(fontWeight: FontWeight.bold),),
                                          ],
                                        )),
                                      )),
                                  )
                                ],
                                
                              ),
                            ) ,
              )
            ],
          ),
        );
      },
      viewModelBuilder: () => MovieDetailsScreenViewModel(context),
    );
  }
}
