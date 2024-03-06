import 'package:cinemapedia/domain/entities/movies.dart';

abstract class LocalStorageDatasource {
  Future<void> toggleFavorite(Movie movie);
  Future<bool> isMovieFavorite(int movieId);
  Future<List<Movie>> loadingMovies({int limit = 10, offset = 0});
}