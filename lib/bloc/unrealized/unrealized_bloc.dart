
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/src/models/model_generator/trans.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';

import '../../src/models/model_generator/home.dart';
import '../../src/models/model_generator/unrealized.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'unrealized_event.dart';
part 'unrealized_state.dart';


class UnrealizedBloc extends Bloc<UnrealizedEvent, UnrealizedState>{
  final UserRepository userRepository;

  UnrealizedBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetUnrealizedState());

  @override
  Stream<UnrealizedState> mapEventToState(UnrealizedEvent event) async* {
    if (event is InitGetUnrealizedEvent) {
      yield* _getUnrealized();
    }
  }
  Stream<UnrealizedState> _getUnrealized() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingUnrealizedState();
      final response = await userRepository.getUnrealized();
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetUnrealizedState(response.data!);
      }
      else
        yield ErrorGetUnrealizedState(response.message ?? "");
    } catch (e) {
      yield ErrorGetUnrealizedState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static UnrealizedBloc of(BuildContext context) => BlocProvider.of<UnrealizedBloc>(context);
}