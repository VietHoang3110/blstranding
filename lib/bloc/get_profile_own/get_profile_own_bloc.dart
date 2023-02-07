
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/src/models/model_generator/profile.dart';
import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'get_profile_own_event.dart';
part 'get_profile_own_state.dart';


class ProfileOwnBloc extends Bloc<ProfileOwnEvent, ProfileOwnState>{
  final UserRepository userRepository;

  ProfileOwnBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetProfileOwnState());

  @override
  Stream<ProfileOwnState> mapEventToState(ProfileOwnEvent event) async* {
    if (event is InitGetProfileOwnEvent) {
      yield* _getProfileOwn();
    }
  }
  Stream<ProfileOwnState> _getProfileOwn() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingProfileOwnState();
      final response = await userRepository.getProfileOwn();
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetProfileOwnState(response.data!);
      }
      else
        yield ErrorGetProfileOwnState(response.message ?? "");
    } catch (e) {
      yield ErrorGetProfileOwnState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ProfileOwnBloc of(BuildContext context) => BlocProvider.of<ProfileOwnBloc>(context);
}