part of 'user_infomation_bloc.dart';

abstract class UserInfomationEvent extends Equatable {
  const UserInfomationEvent();

  @override
  List<Object> get props => [];
}

class PageChanged extends UserInfomationEvent {
  final int index;
  const PageChanged({required this.index});
  @override
  List<Object> get props => [index];
}

class SelectGenderEvent extends UserInfomationEvent {
  final String gender;

  const SelectGenderEvent({required this.gender});
  @override
  List<Object> get props => [gender];
}

class ImagePickerEvent extends UserInfomationEvent {}
