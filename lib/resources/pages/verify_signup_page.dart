import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'dart:async';

class VerifySignupPage extends NyStatefulWidget {
  static RouteView path = ("/verify-signup", (_) => VerifySignupPage());

  VerifySignupPage({super.key}) : super(child: () => _VerifySignupPageState());
}

class _VerifySignupPageState extends NyPage<VerifySignupPage> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  int _resendTimer = 130;
  Timer? _timer;
  String _userEmail =
      "madeup@email.com"; // This should come from previous page or user data

  @override
  get init => () {
        _startResendTimer();
      };

  void _startResendTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resendTimer > 0) {
        setState(() {
          _resendTimer--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _resendCode() {
    if (_resendTimer == 0) {
      // Handle resend code logic here
      setState(() {
        _resendTimer = 130;
      });
      _startResendTimer();

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Verification code sent successfully'),
          backgroundColor: Color(0xFF8B5CF6),
        ),
      );
    }
  }

  void _onCodeChanged(String value, int index) {
    if (value.length == 1 && index < 3) {
      // Move to next field
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      // Move to previous field
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }

    // Check if all fields are filled
    _checkIfCodeComplete();
  }

  void _checkIfCodeComplete() {
    String code = _controllers.map((controller) => controller.text).join();
    if (code.length == 4) {
      // Auto verify when all 4 digits are entered
      _verifyCode();
    }
  }

  void _verifyCode() {
    String code = _controllers.map((controller) => controller.text).join();

    if (code.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter the complete verification code'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Handle verification logic here
    // For now, just navigate to next page
    routeTo(
        '/dashboard'); // or wherever you want to navigate after verification
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),

              // Logo
              Container(
                height: 80,
                child: Row(
                  children: [
                    Image.asset(
                      'mainlogo.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ).localAsset(),
                  ],
                ),
              ),

              SizedBox(height: 40),

              // Title
              Text(
                'Verify your email',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: 16),

              // Subtitle
              Text(
                'Enter the confirmation code sent to:',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),

              SizedBox(height: 8),

              // Email Display
              Text(
                _userEmail,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: 40),

              // Verification Code Input Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return Container(
                    width: 60,
                    height: 60,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: Color(0xFF8B5CF6), width: 2),
                        ),
                        fillColor: Colors.grey[50],
                        filled: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) => _onCodeChanged(value, index),
                    ),
                  );
                }),
              ),

              SizedBox(height: 24),

              // Resend Code
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: _resendCode,
                  child: Text(
                    _resendTimer > 0
                        ? 'Resend Code (${_resendTimer}s)'
                        : 'Resend Code',
                    style: TextStyle(
                      color: _resendTimer > 0
                          ? Colors.grey[500]
                          : Color(0xFF8B5CF6),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40),

              // Verify Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _verifyCode,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF8B5CF6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Verify',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              Spacer(),

              // Back to Sign In Option (Optional)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code? ",
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {
                      routeTo('/signin');
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                    ),
                    child: Text(
                      'Back to Sign In',
                      style: TextStyle(
                        color: Color(0xFF8B5CF6),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
