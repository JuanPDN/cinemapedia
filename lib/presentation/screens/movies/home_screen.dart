import 'package:cinemapedia/presentation/views/views.dart';
import 'package:flutter/material.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';

  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {

  final viewRoutes = const <Widget>[HomeView(), PopularView(), FavoritesView()];

  final pageController = PageController(keepPage: true);

  @override
  void initState() {
    super.initState();
    pageController;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // ignore: prefer_const_constructors
     if ( pageController.hasClients ) {
      pageController.animateToPage(
        widget.pageIndex, 
        curve: Curves.easeInOut, 
        duration: const Duration( milliseconds: 250),
      );
    }
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        //index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomNavigationBar( currentIndex: widget.pageIndex),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
