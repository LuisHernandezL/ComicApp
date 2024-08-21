part of 'comics_bloc.dart';

abstract class ComicEvent extends Equatable {
  const ComicEvent();

  @override
  List<Object> get props => [];
}

class LoadComic extends ComicEvent {}
