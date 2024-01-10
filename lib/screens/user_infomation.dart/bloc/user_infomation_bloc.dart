import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_infomation_event.dart';
part 'user_infomation_state.dart';

class UserInfomationBloc
    extends Bloc<UserInfomationEvent, UserInfomationState> {
  UserInfomationBloc() : super(UserInfomationInitial()) {
    on<UserInfomationEvent>((event, emit) {
      if (event is PageChanged) {
        final updatePage = event.index;
        emit(PageChangedState(index: updatePage));
      }
    });
  }
}
