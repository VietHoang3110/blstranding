
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';

import '../../src/models/model_generator/home.dart';
import '../../src/models/model_generator/home_own.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'home_own_event.dart';
part 'home_own_state.dart';


class HomeOwnBloc extends Bloc<HomeOwnEvent, HomeOwnState>{
  final UserRepository userRepository;

  HomeOwnBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetHomeOwnState());

  @override
  Stream<HomeOwnState> mapEventToState(HomeOwnEvent event) async* {
    if (event is InitGetHomeOwnEvent) {
      yield* _getHomeOwn();
    }
  }
  Stream<HomeOwnState> _getHomeOwn() async* {
    LoadingApi().pushLoading();
    try {
      // yield LoadingHomeOwnState();
      final response = await userRepository.getHomeOwn();
      print("response home ${response.toString()}");
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetHomeOwnState(response.data!);
      }
      else
        yield ErrorGetHomeOwnState(response.message ?? "");
    } catch (e) {
      yield ErrorGetHomeOwnState(MESSAGES.CONNECT_ERROR);
      LoadingApi().popLoading();
      throw e;
    }
    LoadingApi().popLoading();
  }


  static HomeOwnBloc of(BuildContext context) => BlocProvider.of<HomeOwnBloc>(context);
}