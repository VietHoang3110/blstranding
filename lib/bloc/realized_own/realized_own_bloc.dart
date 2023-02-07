
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/src/models/model_generator/realized.dart';
import 'package:quan_ly/src/models/model_generator/sumunrealized.dart';
import 'package:quan_ly/src/models/model_generator/trans.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';

import '../../src/models/model_generator/home.dart';
import '../../src/models/model_generator/realized_own.dart';
import '../../src/models/model_generator/unrealized.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'realized_own_event.dart';
part 'realized_own_state.dart';


class RealizedOwnBloc extends Bloc<RealizedOwnEvent, RealizedOwnState>{
  final UserRepository userRepository;

  RealizedOwnBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetRealizedOwnState());

  @override
  Stream<RealizedOwnState> mapEventToState(RealizedOwnEvent event) async* {
    if (event is InitGetRealizedOwnEvent) {
      yield* _getRealizedOwn();
    }
  }
  Stream<RealizedOwnState> _getRealizedOwn() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingRealizedOwnState();
      final response = await userRepository.getRealizedOwn();
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetRealizedOwnState(response.data!);
      }
      else
        yield ErrorGetRealizedOwnState(response.message ?? "");
    } catch (e) {
      yield ErrorGetRealizedOwnState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static RealizedOwnBloc of(BuildContext context) => BlocProvider.of<RealizedOwnBloc>(context);
}