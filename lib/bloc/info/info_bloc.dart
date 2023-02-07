import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api_resfull/user_repository.dart';
import '../../src/models/model_generator/info.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'info_event.dart';
part 'info_state.dart';


class InfoBloc extends Bloc<InfoEvent, InfoState>{
  final UserRepository userRepository;

  InfoBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetInfoState());

  @override
  Stream<InfoState> mapEventToState(InfoEvent event) async* {
    if (event is InitGetInfoEvent) {
      yield* _getInfo();
    }
  }
  Stream<InfoState> _getInfo() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingInfoState();
      final response = await userRepository.getInfo();
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetInfoState(response.data!);
      }
      else
        yield ErrorGetInfoState(MESSAGES.CONNECT_ERROR);

    } catch (e) {
      yield ErrorGetInfoState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static InfoBloc of(BuildContext context) => BlocProvider.of<InfoBloc>(context);
}