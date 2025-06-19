import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleLogin() {
    // TODO: Validate & xử lý đăng nhập
    print(
      'Đăng nhập với: ${_emailController.text}, ${_passwordController.text}',
    );
  }

  void _handleForgotPassword() {
    // TODO: Điều hướng đến quên mật khẩu
    print('Đi đến Quên mật khẩu');
  }

  void _handleRegister() {
    // TODO: Điều hướng đến đăng ký
    print('Đi đến Đăng ký');
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close, size: 28),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              const SizedBox(height: 48),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://media.giphy.com/media/MBP7KcK9d3lyqNWRaF/giphy.gif',
                    width: width * 0.4,
                    height: width * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Đăng nhập tài khoản',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF58CC02),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              _buildInput(
                label: 'Địa chỉ email',
                hint: 'Nhập địa chỉ email',
                controller: _emailController,
              ),
              _buildInput(
                label: 'Mật khẩu',
                hint: 'Nhập mật khẩu',
                controller: _passwordController,
                obscure: true,
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _handleForgotPassword,
                child: Text.rich(
                  TextSpan(
                    text: 'Bạn không nhớ mật khẩu? ',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF4B5563),
                    ),
                    children: [
                      TextSpan(
                        text: 'nhấn vào đây để khôi phục',
                        style: const TextStyle(
                          color: Color(0xFF58CC02),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 44),
              ElevatedButton(
                onPressed: _handleLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF58CC02),
                  shadowColor: const Color(0xFF58A700),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Đăng Nhập',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Bạn chưa có tài khoản? ',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4B5563),
                    ),
                    children: [
                      TextSpan(
                        text: 'Đăng ký tại đây',
                        style: const TextStyle(
                          color: Color(0xFF58CC02),
                          decoration: TextDecoration.underline,
                        ),
                        recognizer:
                            null, // Bạn có thể dùng TapGestureRecognizer nếu cần
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool obscure = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color(0xFFF9FAFB),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
          ),
          style: const TextStyle(fontSize: 14, color: Color(0xFF374151)),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
