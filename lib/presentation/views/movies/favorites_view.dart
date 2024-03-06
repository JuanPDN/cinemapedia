import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> with AutomaticKeepAliveClientMixin {
  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;
    final movies =
        await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final favoritesMovies = ref.watch(favoriteMoviesProvider).values.toList();
    bool isDark = false;
    if(Theme.of(context).brightness == Brightness.dark) isDark = true;

    if(favoritesMovies.isEmpty){
      final color = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.favorite_outline_sharp, size: 60, color: color.primary,),
            Text('Ohhh no!!', style: TextStyle(fontSize: 30, color: color.primary),),
            Text('No tienes peliculas favoritas', style: TextStyle(fontSize: 20, color:(isDark) ? Colors.white: Colors.black45),),
            const SizedBox(height: 20,),
            FilledButton.tonal(onPressed: ()=>context.go('/home/0'), child: const Text('Home'))
          ]
          ),
      );
    }

    return Scaffold(
        body: MovieMasonty(
      loadNextPage: loadNextPage,
      movies: favoritesMovies,
    ));
  }
  
  @override
  bool get wantKeepAlive => true;
}
