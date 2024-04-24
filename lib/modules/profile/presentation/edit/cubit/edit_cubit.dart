import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_state.dart';
part 'edit_cubit.freezed.dart';

class EditCubit extends Cubit<EditState> {
  EditCubit() : super(EditState.initial());
}
