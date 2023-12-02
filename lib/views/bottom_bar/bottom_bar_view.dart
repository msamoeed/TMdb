import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../src/helpers/constants/app_colors.dart';
import 'bottom_bar_view_model.dart';

class BottomBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomBarViewModel>.reactive(
      builder: (BuildContext context, BottomBarViewModel viewModel, Widget? _) {
        return Scaffold(
          body: viewModel.getViewForIndex(viewModel.currentIndex),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.r),
                  topLeft: Radius.circular(30.r)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.r),
                topLeft: Radius.circular(30.r),
              ),
              child: BottomNavigationBar(
                onTap: (val) => viewModel.setIndex(val),
                type: BottomNavigationBarType.fixed,
                //add background color
                backgroundColor: AppColors.primaryColor,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.dashboard,
                     
                    ),
                    label: 'Dashboard',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.media_bluetooth_on),
                    label: 'Watch',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.library_add),
                    label: 'Media Library',
                  ),
                   BottomNavigationBarItem(
                    icon: Icon(Icons.more),
                    label: 'More',
                  ),
                ],
                currentIndex: viewModel.currentIndex,
                selectedItemColor: Colors.white,
              ),
            ),
          ),
        );
        // );
      },
      viewModelBuilder: () => BottomBarViewModel(),
    );
  }
}

class ThemeAwareText extends StatelessWidget {
  final String text;
  const ThemeAwareText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodySmall?.color,
        ));
  }
}
