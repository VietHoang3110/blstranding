
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/src/models/model_generator/profile.dart';
import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'get_profile_inv_event.dart';
part 'get_profile_inv_state.dart';


class ProfileInvBloc extends Bloc<ProfileInvEvent, ProfileInvState>{
  final UserRepository userRepository;

  ProfileInvBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetProfileInvState());

  @override
  Stream<ProfileInvState> mapEventToState(ProfileInvEvent event) async* {
    if (event is InitGetProfileInvEvent) {
      yield* _getProfileInv();
    }
  }
  Stream<ProfileInvState> _getProfileInv() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingProfileInvState();
      final response = await userRepository.getProfileInv();
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetProfileInvState(response.data!);
      }
      else
        yield ErrorGetProfileInvState(response.message ?? "");
    } catch (e) {
      yield ErrorGetProfileInvState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ProfileInvBloc of(BuildContext context) => BlocProvider.of<ProfileInvBloc>(context);
}