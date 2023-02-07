import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api_resfull/user_repository.dart';
import '../../src/models/model_generator/contact.dart';
import '../../src/models/model_generator/proviso.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'proviso_event.dart';
part 'proviso_state.dart';


class ProvisoBloc extends Bloc<ProvisoEvent, ProvisoState>{
  final UserRepository userRepository;

  ProvisoBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetProvisoState());

  @override
  Stream<ProvisoState> mapEventToState(ProvisoEvent event) async* {
    if (event is InitGetProvisoEvent) {
      yield* _getProviso();
    }
  }
  Stream<ProvisoState> _getProviso() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingProvisoState();
      final response = await userRepository.getProviso();
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetProvisoState(response.data!);
      }
      else
        yield ErrorGetProvisoState(MESSAGES.CONNECT_ERROR);
    } catch (e) {
      yield ErrorGetProvisoState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ProvisoBloc of(BuildContext context) => BlocProvider.of<ProvisoBloc>(context);
}