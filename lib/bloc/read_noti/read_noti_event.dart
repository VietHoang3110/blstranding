part of 'read_noti_bloc.dart';

abstract class ReadNotiEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ReadNotiEvent();
}



class ReadNotiSubmitted extends ReadNotiEvent {
  ReadNotiSubmitted({
    required this.id,
  });

  final String id;
  @override
  List<Object> get props => [id];
}


