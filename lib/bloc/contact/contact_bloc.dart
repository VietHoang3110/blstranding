import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api_resfull/user_repository.dart';
import '../../src/models/model_generator/contact.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'contact_event.dart';
part 'contact_state.dart';


class ContactBloc extends Bloc<ContactEvent, ContactState>{
  final UserRepository userRepository;

  ContactBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetContactState());

  @override
  Stream<ContactState> mapEventToState(ContactEvent event) async* {
    if (event is InitGetContactEvent) {
      yield* _getContact();
    }
  }
  Stream<ContactState> _getContact() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingContactState();
      final response = await userRepository.getContact();
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetContactState(response.data!);
      }
      else
        yield ErrorGetContactState(MESSAGES.CONNECT_ERROR);
    } catch (e) {
      yield ErrorGetContactState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ContactBloc of(BuildContext context) => BlocProvider.of<ContactBloc>(context);
}