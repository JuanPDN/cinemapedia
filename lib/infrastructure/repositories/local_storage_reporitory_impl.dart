import 'package:cinemapedia/domain/datasources/local_storeage_datasource.dart';
import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';

class LocalStorageRepsotoryImpl extends LocalStorageRepository {

  final LocalStorageDatasource datasource;

  LocalStorageRepsotoryImpl({required this.datasource});

  @override
  Future<void> toggleFavorite(Movie movie) {
    return datasource.toggleFavorite(movie);
  }

  @override
  Future<bool> isMovieFavorite(int movieId) {
    return datasource.isMovieFavorite(movieId);
  }
  @override
  Future<List<Movie>> loadingMovies({int limit = 10, offset = 0}) {
    return datasource.loadingMovies(limit: limit, offset: offset);
  }
  
}