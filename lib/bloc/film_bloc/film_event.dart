import 'package:equatable/equatable.dart';

abstract class FilmEvent extends Equatable {}

class FetchFilmsEvent extends FilmEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
