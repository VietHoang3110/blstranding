
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/src/models/model_generator/profile.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'get_profile_event.dart';
part 'get_profile_state.dart';


class ProfileCumBloc extends Bloc<ProfileCumEvent, ProfileCumState>{
  final UserRepository userRepository;

  ProfileCumBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetProfileCumState());

  @override
  Stream<ProfileCumState> mapEventToState(ProfileCumEvent event) async* {
    if (event is InitGetProfileCumEvent) {
      yield* _getProfile();
    }
  }
  Stream<ProfileCumState> _getProfile() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingProfileCumState();
      final response = await userRepository.getProfile();
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetProfileCumState(response.data!);
      }
      else
        yield ErrorGetProfileCumState(response.message ?? "");
    } catch (e) {
      yield ErrorGetProfileCumState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ProfileCumBloc of(BuildContext context) => BlocProvider.of<ProfileCumBloc>(context);
}