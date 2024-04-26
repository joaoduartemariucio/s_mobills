part of 'select_category_cubit.dart';

@freezed
class SelectCategoryState with _$SelectCategoryState {
  const factory SelectCategoryState.initial({
    @Default(CategoryType.values) List<CategoryType> categories,
  }) = _Initial;
}
