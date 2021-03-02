import 'package:http/http.dart'as http;
import 'package:review_app/Models/RegisterViewModel.dart';

abstract class IAccountRepository{
 Future<http.Response> Register(RegisterViewModel registerViewModel);
}