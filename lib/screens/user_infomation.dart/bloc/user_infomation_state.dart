part of 'user_infomation_bloc.dart';

abstract class UserInformationState extends Equatable {
  const UserInformationState();

  @override
  List<Object> get props => [];
}

class UserInfomationInitial extends UserInformationState {}

class UserInfomationLoading extends UserInformationState {}

class UserInfomationSuccess extends UserInformationState {}

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

class ChooseLanguageState extends UserInformationState {
  final bool isChooseLanguage;
  const ChooseLanguageState({this.isChooseLanguage = false});
}

class ChooseLanguageSuccess extends UserInformationState {}

class LanguageSelectionState extends UserInformationState {
  final List<LanguageAndInterrestsModel> selectedLanguages;
  const LanguageSelectionState({required this.selectedLanguages});
}
