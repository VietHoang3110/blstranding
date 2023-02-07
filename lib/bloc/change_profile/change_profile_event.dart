part of 'change_profile_bloc.dart';

abstract class ChangeProfileEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ChangeProfileEvent();
}



class ChangeFileSubmitted extends ChangeProfileEvent {
  ChangeFileSubmitted({
    required this.sendimage,
    required this.email,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.gender,
    required this.address,
  });

  final File  sendimage;
  final String email;
  final String phoneNumber;
  final String dateOfBirth;
  final String gender;
  final String address;
  @override
  List<Object> get props => [sendimage, email, phoneNumber, dateOfBirth, gender, address];
}


