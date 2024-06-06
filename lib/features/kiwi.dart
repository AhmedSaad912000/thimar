import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/features/auth/confirm_code/bloc.dart';
import 'package:thimar_app/features/auth/forget_password/bloc.dart';
import 'package:thimar_app/features/auth/login/bloc.dart';
import 'package:thimar_app/features/auth/register/bloc.dart';
import 'package:thimar_app/features/main/current_order/bloc.dart';
import 'package:thimar_app/features/main/delete_from_cart/bloc.dart';
import 'package:thimar_app/features/main/favorite/bloc.dart';
import 'package:thimar_app/features/main/finished_order/bloc.dart';
import 'package:thimar_app/features/main/get_cart/bloc.dart';
import 'package:thimar_app/features/main/notifications/bloc.dart';
import 'package:thimar_app/features/main/rate_products/bloc.dart';
import 'package:thimar_app/features/main/update_quantity/bloc.dart';
import 'package:thimar_app/features/my_accont/get_wallet/bloc.dart';
import 'auth/new_password/bloc.dart';
import 'main/categories/bloc.dart';
import 'main/products/bloc.dart';
import 'main/slider/bloc.dart';

void initKiwi(){
  final container=KiwiContainer();
  container.registerFactory((container) => LoginBloc());
  container.registerFactory((container) => RegisterBloc());
  container.registerFactory((container) => ForgetPasswordBloc());
  container.registerFactory((container) => NewPasswordBloc());
  container.registerFactory((container) => ConfirmCodeBloc());
  container.registerFactory((container) => SliderBloc());
  container.registerFactory((container) => CategoryBloc());
  container.registerFactory((container) => ProductBloc());
  container.registerFactory((container) => CurrentOrderBloc());
  container.registerFactory((container) => FinishedOrderBloc());
  container.registerFactory((container) => FavoriteProductsBloc());
  container.registerFactory((container) =>NotificationsBloc());
  container.registerFactory((container) =>CartBloc());
  container.registerFactory((container) =>DeleteFromCartBloc());
  container.registerFactory((container) =>QuantityCartBloc());
  container.registerFactory((container) =>GetWalletBloc());
  container.registerFactory((container) =>RateProductsBloc());
}