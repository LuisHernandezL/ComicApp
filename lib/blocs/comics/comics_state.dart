part of 'comics_bloc.dart';

class ComicState extends Equatable {
  const ComicState();

  @override
  List<Object?> get props => [];
}

class ComicLoading extends ComicState {}

class ComicLoaded extends ComicState {
  final List<Comic>? comic;

  const ComicLoaded({this.comic});

  @override
  List<Object?> get props => [comic];
}

class ComicError extends ComicState {
  final String message;

  const ComicError({required this.message});

  @override
  List<Object?> get props => [message];
}
