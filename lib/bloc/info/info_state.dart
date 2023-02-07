part of 'info_bloc.dart';


abstract class InfoState extends Equatable {

  @override
  List<Object?> get props => [];

  InfoState();
}
class InitGetInfoState extends InfoState {}

class UpdateGetInfoState extends InfoState{
  List<DataInfo> data;

  UpdateGetInfoState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingInfoState extends InfoState {
}


class ErrorGetInfoState extends InfoState{
  final String msg;


  ErrorGetInfoState(this.msg);

  @override
  List<Object> get props => [msg];
}