import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularView extends ConsumerStatefulWidget {
  const PopularView({super.key});

  @override
  PopularViewState createState() => PopularViewState();
}

class PopularViewState extends ConsumerState<PopularView> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final pupularMovies = ref.watch(populaMoviesProvider);

    if (pupularMovies.isEmpty) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }

    Future<void> loadNextPage() async {
      return await ref.read(populaMoviesProvider.notifier).loadNextPage();
    }

    return Scaffold(
      body: MovieMasonty(
        movies: pupularMovies,
        loadNextPage: loadNextPage,
      ),
    );
  }
  
  @override

  bool get wantKeepAlive => true;
}
