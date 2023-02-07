
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/src/models/model_generator/trans.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';

import '../../src/models/model_generator/home.dart';
import '../../src/models/model_generator/unrealized.dart';
import '../../src/models/model_generator/unrealized_own.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'unrealized_own_event.dart';
part 'unrealized_own_state.dart';


class UnrealizedOwnBloc extends Bloc<UnrealizedOwnEvent, UnrealizedOwnState>{
  final UserRepository userRepository;

  UnrealizedOwnBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetUnrealizedOwnState());

  @override
  Stream<UnrealizedOwnState> mapEventToState(UnrealizedOwnEvent event) async* {
    if (event is InitGetUnrealizedOwnEvent) {
      yield* _getUnrealizedOwn();
    }
  }
  Stream<UnrealizedOwnState> _getUnrealizedOwn() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingUnrealizedOwnState();
      final response = await userRepository.getUnrealizedOwn();
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetUnrealizedOwnState(response.data!);
      }
      else
        yield ErrorGetUnrealizedOwnState(response.message ?? "");
    } catch (e) {
      yield ErrorGetUnrealizedOwnState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static UnrealizedOwnBloc of(BuildContext context) => BlocProvider.of<UnrealizedOwnBloc>(context);
}