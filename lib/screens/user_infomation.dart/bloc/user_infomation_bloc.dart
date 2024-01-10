import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app/models/language_and_interrestsmodel.dart';

part 'user_infomation_event.dart';
part 'user_infomation_state.dart';

class UserInfomationBloc
    extends Bloc<UserInfomationEvent, UserInformationState> {
  List<LanguageAndInterrestsModel> _selectedLanguages = [];
  UserInfomationBloc() : super(UserInfomationInitial()) {
    on<UserInfomationEvent>((event, emit) {
      if (event is PageChanged) {
        final updatePage = event.index;
        emit(PageChangedState(index: updatePage));
      } else if (event is IsChooseLanguage) {
        _selectedLanguages = []; // Reset danh sách ngôn ngữ được chọn
        emit(LanguageSelectionState(selectedLanguages: _selectedLanguages));
      } else if (event is ToggleLanguageSelection) {
        final LanguageAndInterrestsModel selectedLanguage =
            event.language as LanguageAndInterrestsModel;
        final bool isSelected = _selectedLanguages.contains(selectedLanguage);

        if (isSelected) {
          _selectedLanguages.remove(selectedLanguage);
        } else {
          _selectedLanguages.add(selectedLanguage);
        }

        emit(LanguageSelectionState(selectedLanguages: _selectedLanguages));
      }
    });
  }
}
