import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _usernameController = TextEditingController();

  void _handleRegister() {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
    final username = _usernameController.text;

    if (email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        username.isEmpty) {
      _showToast('Dữ liệu không được để trống');
      return;
    }

    if (password != confirmPassword) {
      _showToast('Mật khẩu xác nhận không khớp');
      return;
    }

    // TODO: Gọi API tạo tài khoản (registerAccount)
    _showToast('Đăng ký thành công!');
    Navigator.of(context).pop(); // Quay lại Login
  }

  void _showToast(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _navigateToLogin() {
    Navigator.of(context).pop(); // hoặc dùng Navigator.push nếu khác stack
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, size: 28),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Center(
              child: Image.network(
                'https://media.giphy.com/media/TFNbcscr9JUUigDzrZ/giphy.gif',
                width: width * 0.5,
                height: width * 0.5,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Tạo tài khoản',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF58CC02),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            const Text(
              'Hãy tạo tài khoản để đồng hành cùng tớ',
              style: TextStyle(fontSize: 15, color: Color(0xFF374151)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            _buildInputField(
              label: 'Địa chỉ email',
              controller: _emailController,
              hint: 'Nhập địa chỉ email',
            ),
            _buildInputField(
              label: 'Mật khẩu',
              controller: _passwordController,
              hint: 'Nhập mật khẩu',
              obscure: true,
            ),
            _buildInputField(
              label: 'Nhập lại mật khẩu',
              controller: _confirmPasswordController,
              hint: 'Nhập lại mật khẩu',
              obscure: true,
            ),
            _buildInputField(
              label: 'Tên người dùng',
              controller: _usernameController,
              hint: 'Nhập tên người dùng',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleRegister,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF58CC02),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
                shadowColor: const Color(0xFF58A700),
              ),
              child: const Text(
                'Tạo tài khoản của bạn',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text.rich(
                TextSpan(
                  text: 'Bạn đã có tài khoản? ',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6b7280),
                  ),
                  children: [
                    TextSpan(
                      text: 'Đăng nhập tại đây',
                      style: const TextStyle(
                        color: Color(0xFF58CC02),
                        decoration: TextDecoration.underline,
                      ),
                      recognizer:
                          null, // bạn có thể dùng TapGestureRecognizer nếu cần
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String hint,
    bool obscure = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
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
        ],
      ),
    );
  }
}
