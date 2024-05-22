import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/core.dart';

part 'accounts_state.dart';
part 'accounts_cubit.freezed.dart';

class AccountsCubit extends Cubit<AccountsState> {
  AccountsCubit() : super(AccountsState.initial());

  Future<void> createAccount() async {
    await AppRouter.router.pushNamed(Routes.profileAccountsCreate.name);
  }
}
