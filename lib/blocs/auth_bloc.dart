import 'dart:async';


  class AuthBloc {
  final StreamController<String> _emailController = StreamController<String>.broadcast();
  final StreamController<String> _passwordController = StreamController<String>.broadcast();
  final StreamController<String> _confirmPasswordController = StreamController<String>.broadcast();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get confirmPasswordStream => _confirmPasswordController.stream;

  void dispose() {
  _emailController.close();
  _passwordController.close();
  _confirmPasswordController.close();
  }

  void updateEmail(String email) {
    _emailController.sink.add(email);
  }

  void updatePassword(String password) {
    _passwordController.sink.add(password);
  }

  void updateConfirmPassword(String confirmPassword) {
    _confirmPasswordController.sink.add(confirmPassword);
  }
}
