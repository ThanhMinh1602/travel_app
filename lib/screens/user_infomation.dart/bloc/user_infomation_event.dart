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

class ChooseLanguage extends UserInfomationEvent {
  final List<String> language;
  const ChooseLanguage({required this.language});
  @override
  List<Object> get props => [language];
}
