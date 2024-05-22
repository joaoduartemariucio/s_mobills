import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/navigation/routes/app_router.dart';
import 'package:s_mobills/modules/transactions/domain/model/category_type.dart';
import 'package:s_mobills/modules/transactions/domain/model/transaction_type.dart';

part 'select_category_state.dart';
part 'select_category_cubit.freezed.dart';

class SelectCategoryCubit extends Cubit<SelectCategoryState> {
  SelectCategoryCubit() : super(const SelectCategoryState.initial());

  void onSelectedCategory(CategoryType categoryType) {
    AppRouter.router.pop({'categoryType': categoryType});
  }

  void filterBy(TransactionType type) {
    final filterByReceived = type == TransactionType.income;

    final categoriesFiltered = CategoryType.values
        .where((e) => e.isReceived == filterByReceived)
        .toList();

    emit(
      state.copyWith(
        categories: categoriesFiltered,
      ),
    );
  }
}
