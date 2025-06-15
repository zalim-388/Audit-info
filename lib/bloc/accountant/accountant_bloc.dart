import 'dart:convert';

import 'package:audit_info/Repositry/Api/accountant/accountantApi.dart';
import 'package:audit_info/Repositry/model/accountant_modal.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

part 'accountant_event.dart';
part 'accountant_state.dart';

class AccountantBloc extends Bloc<AccountantEvent, AccountantState> {
  List<AccountantModel> account = [];
  static const String _accountItem = "Accounts";

  AccountantBloc() : super(AccountantblocInitial()) {
    on<fetchAccountant>((event, emit) async {
      emit(Accountantblocloading());
      try {
        final prefs = await SharedPreferences.getInstance();
        final String? accountsJson = prefs.getString(_accountItem);
        if (accountsJson != null) {
          final List<dynamic> jsonList = jsonDecode(accountsJson);
          account =
              jsonList.map((json) => AccountantModel.fromJson(json)).toList();
        }
        emit(Accountantblocloaded(Account: account));
      } catch (e) {
        print("Account fetch error: $e");
        emit(AccountantblocError(error: e.toString()));
      }
    });

    on<AddAccount>((event, emit) async {
      emit(Accountantblocloading());
      try {
        final prefs = await SharedPreferences.getInstance();
        // Parse date safely
        DateTime dateOfJoining = DateTime.now();
        final dateString = event.Accountdata['dateOfJoining'].toString().trim();
        if (dateString.isEmpty) {
          throw const FormatException("Date of joining cannot be empty");
        }

        bool parsed = false;
        final formats = [
          DateFormat('dd/MM/yyyy'), // 16/02/2022
          DateFormat('MM/dd/yyyy'), // 01/17/2022
          DateFormat('yyyy/MM/dd'), // 2022/02/12
        ];
        for (var format in formats) {
          try {
            dateOfJoining = format.parseStrict(dateString);
            parsed = true;
            break;
          } catch (_) {
            continue; // Try next format
          }
        }
        if (!parsed) {
          print(
            "Invalid date format '$dateString', using default: ${dateOfJoining.toIso8601String()}",
          );
        }

        final newAccount = AccountantModel(
          id: event.Accountdata['id'].toString(),
          name: event.Accountdata['name'].toString(),
          email: event.Accountdata['email'].toString(),
          password: event.Accountdata['password'].toString(),
          position: event.Accountdata['position'].toString(),
          employeeCode: event.Accountdata['employeeCode'].toString(),
          phoneNumber: event.Accountdata['phonenumber'].toString(),
          dateOfJoining: dateOfJoining,
          address: event.Accountdata['address'].toString(),
          status: event.Accountdata['state'] ?? true,
          isAdmin: false,
          headAdministractor: false,
          managerPoint: [],
          lead: [],
          registration: [],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          v: 0,
        );
        account.add(newAccount);

        // Call API (if using)
        await Accountantapi().AddAccount(event.Accountdata);

        await prefs.setString(
          _accountItem,
          jsonEncode(account.map((m) => m.toJson()).toList()),
        );
        emit(Accountantblocloaded(Account: account));
      } catch (e) {
        print("Account add error: $e");
        emit(AccountantblocError(error: e.toString()));
      }
    });

    on<deleteaccount>((event, emit) async {
      emit(Accountantblocloading());
      try {
        final prefs = await SharedPreferences.getInstance();
        account.removeWhere((m) => m.id == event.id);

        await prefs.setString(
          _accountItem,
          jsonEncode(account.map((m) => m.toJson()).toList()),
        );
        emit(Accountantblocloaded(Account: account));
      } catch (e) {
        print("Account delete error: $e");
        emit(AccountantblocError(error: e.toString()));
      }
    });

    on<UpdateAccountStatus>((event, emit) async {
      emit(Accountantblocloading());
      try {
        final prefs = await SharedPreferences.getInstance();
        final index = account.indexWhere((m) => m.id == event.id);
        if (index != -1) {
          account[index] = account[index];
          await prefs.setString(
            _accountItem,
            jsonEncode(account.map((m) => m.toJson()).toList()),
          );
        }
        emit(Accountantblocloaded(Account: account));
      } catch (e) {
        print("Account status update error: $e");
        emit(AccountantblocError(error: e.toString()));
      }
    });
  }
}
