import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comic_vine_app/repositories/repositories.dart';
import '/models/models.dart';

part 'comics_event.dart';
part 'comics_state.dart';

class ComicBloc extends Bloc<ComicEvent, ComicState> {
  final ComicsRepository _comicsRepository;

  ComicBloc({required ComicsRepository comicsRepository})
      : _comicsRepository = comicsRepository,
        super(ComicLoading()) {
    on<LoadComic>(_onLoadComic);
  }

  void _onLoadComic(
    LoadComic event,
    Emitter<ComicState> emit,
  ) async {
    try {
      emit(ComicLoading());
      final response = await _comicsRepository.getAllComics();
      emit(ComicLoaded(comic: response.results));
    } on DioException catch (e) {
      emit(
        ComicError(message: e.message ?? 'An error occurred'),
      );
    } on HttpException catch (e) {
      emit(
        ComicError(message: e.message),
      );
    }
  }
}
