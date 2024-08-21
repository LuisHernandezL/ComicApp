part of 'comicdetail_bloc.dart';

abstract class ComicDetailState extends Equatable {
  const ComicDetailState();

  @override
  List<Object?> get props => [];
}

class ComicDetailLoading extends ComicDetailState {}

class ComicDetailError extends ComicDetailState {
  final String message;

  const ComicDetailError({required this.message});

  @override
  List<Object?> get props => [message];
}

class ComicDetailLoaded extends ComicDetailState {
  final ImagenComic? comicDetail;
  final Comic? comic;

  const ComicDetailLoaded({
    this.comicDetail,
    this.comic,
  });

  @override
  List<Object?> get props => [comic];
}
