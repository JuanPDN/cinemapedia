import 'package:cinemapedia/infrastructure/datasources/actor_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_respository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRespositoryProvider = Provider((ref) {
  return ActorRepositoryImpl( datasource: ActorMovieDbDatasource());
});