import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quan_ly/bloc/change_pass/change_pass_bloc.dart';
import 'package:quan_ly/bloc/contact/contact_bloc.dart';
import 'package:quan_ly/bloc/get_profile/get_profile_bloc.dart';
import 'package:quan_ly/bloc/home/home_bloc.dart';
import 'package:quan_ly/bloc/info/info_bloc.dart';
import 'package:quan_ly/bloc/money/money_bloc.dart';
import 'package:quan_ly/bloc/proviso/proviso_bloc.dart';
import 'package:quan_ly/bloc/sumunrealized/sumunrealized_bloc.dart';
import 'package:quan_ly/bloc/unrealized/unrealized_bloc.dart';
import 'package:quan_ly/screens/login/LoginFake.dart';
import 'package:quan_ly/screens/notification/detail_notification.dart';
import 'package:quan_ly/screens/notification/notification.dart';
import 'package:quan_ly/screens/ui_customer/drawer/history_transaction/history_deposit.dart';
import 'package:quan_ly/screens/ui_customer/drawer/history_transaction/histrory_transaction.dart';
import 'package:quan_ly/screens/ui_customer/drawer/history_transaction/provisional_list.dart';
import 'package:quan_ly/screens/ui_customer/drawer/history_transaction/provisional_summary.dart';
import 'package:quan_ly/screens/screens.dart';
import 'package:quan_ly/screens/ui_inv/drawer_inv/finalization_contract_inv.dart';
import 'package:quan_ly/screens/ui_inv/main_screen_inv.dart';
import 'package:quan_ly/screens/ui_own/drawer_own/history_transaction_own/history_deposit_own.dart';
import 'package:quan_ly/screens/ui_own/drawer_own/history_transaction_own/histrory_transaction_own.dart';
import 'package:quan_ly/screens/ui_own/drawer_own/history_transaction_own/list_of_settlements_own.dart';
import 'package:quan_ly/screens/ui_own/drawer_own/history_transaction_own/provisional_list_own.dart';
import 'package:quan_ly/screens/ui_own/drawer_own/history_transaction_own/provisional_summary_own.dart';
import 'package:quan_ly/screens/ui_own/drawer_own/history_transaction_own/summary_of_settlements_own.dart';
import 'package:quan_ly/screens/ui_own/main_screen_own.dart';
import 'package:quan_ly/screens/user_profile/change_pass.dart';
import 'package:quan_ly/screens/user_profile/edit_user_profile.dart';
import 'package:quan_ly/screens/user_profile/user_screen.dart';
import 'package:quan_ly/screens/widget_ui/about_us.dart';
import 'package:quan_ly/screens/widget_ui/contact.dart';
import 'package:quan_ly/screens/widget_ui/language.dart';
import 'package:quan_ly/screens/widget_ui/rules.dart';
import 'package:quan_ly/src/base.dart';
import 'package:quan_ly/src/messages.dart';
import 'package:quan_ly/src/router.dart';
import 'package:quan_ly/storages/storages.dart';
import 'api_resfull/api.dart';

import 'bloc/blocs.dart';

import 'bloc/change_profile/change_profile_bloc.dart';
import 'bloc/change_profile_noAvt/change_profile_noAvt_bloc.dart';
import 'bloc/contract_inv/contract_inv_bloc.dart';
import 'bloc/get_profile_inv/get_profile_inv_bloc.dart';
import 'bloc/get_profile_own/get_profile_own_bloc.dart';
import 'bloc/home_inv/home_inv_bloc.dart';
import 'bloc/home_own/home_own_bloc.dart';
import 'bloc/money_own/money_own_bloc.dart';
import 'bloc/noti/noti_bloc.dart';
import 'bloc/read_noti/read_noti_bloc.dart';
import 'bloc/realized/realized_bloc.dart';
import 'bloc/realized_own/realized_own_bloc.dart';
import 'bloc/sumrealized/sumrealized_bloc.dart';
import 'bloc/sumrealized_own/sumrealized_own_bloc.dart';
import 'bloc/sumunrealized_own/sumunrealized_own_bloc.dart';
import 'bloc/trans/trans_bloc.dart';
import 'bloc/trans_own/trans_own_bloc.dart';
import 'bloc/unrealized_own/unrealized_own_bloc.dart';
import 'screens/ui_customer/drawer/history_transaction/list_of_settlements.dart';
import 'screens/ui_customer/drawer/history_transaction/summary_of_settlements.dart';


Future main() async {


  Bloc.observer = SimpleBlocObserver();
  await dotenv.load(fileName: BASE_URL.ENV);
  shareLocal = await ShareLocal.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  UserRepository userRepository = UserRepository();
  await GetStorage.init();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);

  FlutterDownloader.registerCallback(callBack);
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            userRepository: userRepository,
            localRepository: const EventRepositoryStorage(),
          )..add(AuthenticationStateInit()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(
              userRepository: userRepository,
              localRepository: const EventRepositoryStorage(),
            ),
          ),
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<HomeInvBloc>(
            create: (context) => HomeInvBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<HomeOwnBloc>(
            create: (context) => HomeOwnBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<TransBloc>(
            create: (context) => TransBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<TransOwnBloc>(
            create: (context) => TransOwnBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<MoneyBloc>(
            create: (context) => MoneyBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<MoneyOwnBloc>(
            create: (context) => MoneyOwnBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<UnrealizedBloc>(
            create: (context) => UnrealizedBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<UnrealizedOwnBloc>(
            create: (context) => UnrealizedOwnBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<SumunrealizedBloc>(
            create: (context) => SumunrealizedBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<SumunrealizedOwnBloc>(
            create: (context) => SumunrealizedOwnBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<RealizedBloc>(
            create: (context) => RealizedBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<RealizedOwnBloc>(
            create: (context) => RealizedOwnBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<SumrealizedBloc>(
            create: (context) => SumrealizedBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<SumrealizedOwnBloc>(
            create: (context) => SumrealizedOwnBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<ProfileCumBloc>(
            create: (context) => ProfileCumBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<ProfileOwnBloc>(
            create: (context) => ProfileOwnBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<ProfileInvBloc>(
            create: (context) => ProfileInvBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<ContractInvBloc>(
            create: (context) => ContractInvBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<ContactBloc>(
            create: (context) => ContactBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<InfoBloc>(
            create: (context) => InfoBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<ChangePassBloc>(
            create: (context) => ChangePassBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<NotiBloc>(
            create: (context) => NotiBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<ChangeProfileBloc>(
            create: (context) => ChangeProfileBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<ChangeProfileNoAvtBloc>(
            create: (context) => ChangeProfileNoAvtBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<ReadNotiBloc>(
            create: (context) => ReadNotiBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<ProvisoBloc>(
            create: (context) => ProvisoBloc(
              userRepository: userRepository,
            ),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'NunitoSans'),
      title: MESSAGES.APP_TITLE,
      initialRoute: ROUTE_NAMES.SPLASH,
      getPages: [
        GetPage(
          name: ROUTE_NAMES.MAIN,
          page: () => MainScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.MAIN_INV,
          page: () => MainScreenInv(),
        ),
        GetPage(
          name: ROUTE_NAMES.MAIN_OWN,
          page: () => MainScreenOwn(),
        ),
        GetPage(
          name: ROUTE_NAMES.SPLASH,
          page: () => SplashPage(),
        ),
        GetPage(
          name: ROUTE_NAMES.LOGIN,
          page: () => LoginScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.LOGIN_Fake,
          page: () => LoginFake(),
        ),
        GetPage(
          name: ROUTE_NAMES.History_Transaction,
          page: () => const HistoryTransaction(),
        ),
        GetPage(
          name: ROUTE_NAMES.History_Deposit,
          page: () =>  const HistoryDeposit(),
        ),
        GetPage(
          name: ROUTE_NAMES.Provisional_List,
          page: () =>  const ProvisionalList(),
        ),
        GetPage(
          name: ROUTE_NAMES.Provisional_Summary,
          page: () =>  const ProvisionalSummary(),
        ),
        GetPage(
          name: ROUTE_NAMES.List_of_Settlements,
          page: () =>  const ListofSettlements(),
        ),
        GetPage(
          name: ROUTE_NAMES.Summary_Of_Settlements,
          page: () =>  const SummaryOfSettlements(),
        ),

        GetPage(
          name: ROUTE_NAMES.History_Transaction_Own,
          page: () => const HistoryTransactionOwn(),
        ),
        GetPage(
          name: ROUTE_NAMES.History_Deposit_Own,
          page: () =>  const HistoryDepositOwn(),
        ),
        GetPage(
          name: ROUTE_NAMES.Provisional_List_Own,
          page: () =>  const ProvisionalListOwn(),
        ),
        GetPage(
          name: ROUTE_NAMES.Provisional_Summary_Own,
          page: () =>  const ProvisionalSummaryOwn(),
        ),
        GetPage(
          name: ROUTE_NAMES.List_of_Settlements_Own,
          page: () =>  const ListofSettlementsOwn(),
        ),
        GetPage(
          name: ROUTE_NAMES.Summary_Of_Settlements_Own,
          page: () =>  const SummaryOfSettlementsOwn(),
        ),
        GetPage(
          name: ROUTE_NAMES.UserProfileScreen,
          // page: () =>  const EditProfileScreen(),
          page: () =>  const UserProfileScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.DetailNoti,
          page: () =>  const DetailNotificationPage(),
        ),
        GetPage(
          name: ROUTE_NAMES.noti,
          page: () =>  const NotificationPage(),
        ),
        GetPage(
          name: ROUTE_NAMES.Language,
          page: () =>  const LanguagePage(),
        ),
        GetPage(
          name: ROUTE_NAMES.aboutUs,
          page: () =>  const AboutUsPage(),
        ),
        GetPage(
          name: ROUTE_NAMES.Rules,
          page: () =>  const RulesPage(),
        ),
        GetPage(
          name: ROUTE_NAMES.Contact,
          page: () =>  const ContactPage(),
        ),
        GetPage(
          name: ROUTE_NAMES.Finalization_Contract_Inv,
          page: () =>  const FinalizationContractInv(),
        ),
        GetPage(
          name: ROUTE_NAMES.CHANGE_PASSWORD,
          page: () =>  const ChangePassScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.CHANGE_INFORMATION_ACCOUNT,
          page: () =>  const EditProfileScreen(),
        ),


        // GetPage(
        //   name: ROUTE_NAMES.TEST,
        //   page: () => MyHomePage(),
        // ),
      //   GetPage(
      //     name: ROUTE_NAMES.INTRO,
      //     page: () => const IntroducePage(),
      //   ),
      ],
    );
  }
}

void callBack(String id, DownloadTaskStatus status, int progress) {
  print(status.toString());
}
