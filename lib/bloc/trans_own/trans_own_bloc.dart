
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/models/model_generator/trans_own.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'trans_own_event.dart';
part 'trans_own_state.dart';


class TransOwnBloc extends Bloc<TransOwnEvent, TransOwnState>{
  final UserRepository userRepository;

  TransOwnBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetTransOwnState());

  @override
  Stream<TransOwnState> mapEventToState(TransOwnEvent event) async* {
    if (event is InitGetTransOwnEvent) {
      yield* _getTransOwn(event.page, event.numOfRecords);
    }
  }

  List<DataTableTransOwn> dataTableUpdate = [];

  Stream<TransOwnState> _getTransOwn(int page, int numOfRecords) async* {
    LoadingApi().pushLoading();
    try {
      if(page==1){
        yield LoadingTransOwnState();
      }
      final response = await userRepository.getTransOwn(page, numOfRecords);
      if(response.code == BASE_URL.SUCCESS_200){
        // yield UpdateGetTransOwnState(response.data!);
        if(page==1){
          dataTableUpdate=response.data!.dataTable!;
          yield UpdateGetTransOwnState(response.data!,response.data!.dataTable!);
        }
        else{
          dataTableUpdate=[...dataTableUpdate,...response.data!.dataTable!];
          yield UpdateGetTransOwnState(response.data!,dataTableUpdate);
        }
      }
      else
        yield ErrorGetTransOwnState(response.message ?? "");
    } catch (e) {
      yield ErrorGetTransOwnState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static TransOwnBloc of(BuildContext context) => BlocProvider.of<TransOwnBloc>(context);
}