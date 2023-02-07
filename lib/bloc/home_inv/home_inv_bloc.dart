
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';

import '../../src/models/model_generator/home.dart';
import '../../src/models/model_generator/home_inv.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'home_inv_event.dart';
part 'home_inv_state.dart';


class HomeInvBloc extends Bloc<HomeInvEvent, HomeInvState>{
  final UserRepository userRepository;

  HomeInvBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetHomeInvState());

  @override
  Stream<HomeInvState> mapEventToState(HomeInvEvent event) async* {
    if (event is InitGetHomeInvEvent) {
      yield* _getHomeInv(event.page, event.numOfRecords);
    }
  }
  Stream<HomeInvState> _getHomeInv(int page,int numOfRecords) async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingHomeInvState();
      final response = await userRepository.getHomeInv(page, numOfRecords);
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetHomeInvState(response.data!);
      }
      else
        yield ErrorGetHomeInvState(response.message ?? "");
    } catch (e) {
      yield ErrorGetHomeInvState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static HomeInvBloc of(BuildContext context) => BlocProvider.of<HomeInvBloc>(context);
}