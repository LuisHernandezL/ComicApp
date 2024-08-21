import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comic_vine_app/repositories/repositories.dart';
import '/models/models.dart';

part 'comicdetail_event.dart';
part 'comicdetail_state.dart';

class ComicDetailBloc extends Bloc<ComicDetailEvent, ComicDetailState> {
  final ComicDetailRepository _comicsRepository;

  ComicDetailBloc({required ComicDetailRepository comicsRepository})
      : _comicsRepository = comicsRepository,
        super(ComicDetailLoading()) {
    on<LoadComicDetail>(_onLoadComic);
  }

  void _onLoadComic(
    LoadComicDetail event,
    Emitter<ComicDetailState> emit,
  ) async {
    try {
      emit(ComicDetailLoading());
      final response = await _comicsRepository.getComicDetail(event.url);
      emit(ComicDetailLoaded(comicDetail: response));
    } on DioException catch (e) {
      emit(
        ComicDetailError(message: e.message ?? 'An error occurred'),
      );
    } on HttpException catch (e) {
      emit(
        ComicDetailError(message: e.message),
      );
    }
  }
}
