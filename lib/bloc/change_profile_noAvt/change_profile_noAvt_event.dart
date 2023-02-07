part of 'change_profile_noAvt_bloc.dart';

abstract class ChangeProfileNoAvtEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ChangeProfileNoAvtEvent();
}





class ChangeFileNoAvtSubmitted extends ChangeProfileNoAvtEvent {
  ChangeFileNoAvtSubmitted({
    required this.email,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.gender,
    required this.address,
  });

  final String email;
  final String phoneNumber;
  final String dateOfBirth;
  final String gender;
  final String address;
  @override
  List<Object> get props => [email, phoneNumber, dateOfBirth, gender, address];
}

