import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/modules.dart';
import 'package:s_mobills/modules/profile/module.dart';

part 'accounts_state.dart';
part 'accounts_cubit.freezed.dart';

class AccountsCubit extends Cubit<AccountsState> {
  AccountsCubit({
    required this.getUserBankAccountsUseCase,
  }) : super(const AccountsState.initial()) {
    _loadAccounts();
  }
  final GetUserBankAccountsUseCase getUserBankAccountsUseCase;

  void setIsNewTransaction(bool value) {
    emit(state.copyWith(isNewTransaction: value));
  }

  Future<void> _loadAccounts() async {
    try {
      emit(state.copyWith(isLoading: true));
      final result = await getUserBankAccountsUseCase();
      emit(state.copyWith(isEmptyAccounts: result.isEmpty, accounts: result));
    } on SMobillsException catch (e) {
      AppRouter.showError(message: e.message);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> createAccount() async {
    await AppRouter.router.pushNamed(Routes.profileAccountsCreate.name);
    await _loadAccounts();
  }

  Future<void> editAccount({required BankAccount account}) async {
    await AppRouter.router.pushNamed(
      Routes.profileAccountsEdit.name,
      extra: account,
    );
    await _loadAccounts();
  }

  void onSelectedAccount(BankAccount account) {
    AppRouter.router.pop({'bankAccount': account});
  }
}
