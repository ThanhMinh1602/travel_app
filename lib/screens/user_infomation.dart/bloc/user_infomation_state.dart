part of 'user_infomation_bloc.dart';

abstract class UserInfomationState extends Equatable {
  const UserInfomationState();

  @override
  List<Object> get props => [];
}

class UserInfomationInitial extends UserInfomationState {}

class UserInfomationLoading extends UserInfomationState {}

class UserInfomationSuccess extends UserInfomationState {}

class UserInfomationFailure extends UserInfomationState {
  final String errorMessage;
  const UserInfomationFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class PageChangedState extends UserInfomationState {
  final int index;
  const PageChangedState({this.index = 0});
  @override
  List<Object> get props => [index];
}

class ChooseLanguageState extends UserInfomationState {
  final bool isChooseLanguage;
  const ChooseLanguageState({this.isChooseLanguage = false});
}

class ChooseLanguageSuccess extends UserInfomationState {}
