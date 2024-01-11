import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'user_infomation_event.dart';
part 'user_infomation_state.dart';

class UserInfomationBloc
    extends Bloc<UserInfomationEvent, UserInformationState> {
  UserInfomationBloc() : super(UserInfomationInitial()) {
    on<UserInfomationEvent>(mapToEvent);
  }

  Future<void> mapToEvent(event, emit) async {
    if (event is PageChanged) {
      final updatePage = event.index;
      emit(PageChangedState(index: updatePage));
    }
    if (event is SelectGenderEvent) {
      emit(SelectGenderState(gender: event.gender));
    }
    if (event is ImagePickerEvent) {
      final ImagePicker imagePicker = ImagePicker();
      XFile? pickedFile;
      try {
        pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
      } catch (e) {
        emit(ImagePickerStateFailure(errorMessage: e.toString()));
      }
      if (pickedFile != null) {
        emit(ImagePickerStateSuccess(path: pickedFile.path));
      } else {
        emit(const ImagePickerStateFailure(errorMessage: "No image selected"));
        print(ImagePickerStateFailure(errorMessage: "No image selected"));
      }
      // emit(ImagePickerState(path: event.path));
    }
  }
}
