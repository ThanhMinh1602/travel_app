part of 'user_infomation_bloc.dart';

abstract class UserInformationState extends Equatable {
  const UserInformationState();

  @override
  List<Object> get props => [];
}

class UserInfomationInitial extends UserInformationState {}

class UserInfomationFailure extends UserInformationState {
  final String errorMessage;
  const UserInfomationFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class PageChangedState extends UserInformationState {
  final int index;
  const PageChangedState({this.index = 0});
  @override
  List<Object> get props => [index];
}

class SelectGenderState extends UserInformationState {
  final String gender;

  const SelectGenderState({required this.gender});
  @override
  List<Object> get props => [gender];
}

class ImagePickerStateSuccess extends UserInformationState {
  final String path;

  const ImagePickerStateSuccess({required this.path});
  @override
  List<Object> get props => [path];
}

class ImagePickerStateFailure extends UserInformationState {
  final String errorMessage;

  const ImagePickerStateFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
