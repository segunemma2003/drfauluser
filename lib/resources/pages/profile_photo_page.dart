import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ProfilePhotoPage extends NyStatefulWidget {
  static RouteView path = ("/profile-photo", (_) => ProfilePhotoPage());

  ProfilePhotoPage({super.key}) : super(child: () => _ProfilePhotoPageState());
}

class _ProfilePhotoPageState extends NyPage<ProfilePhotoPage> {
  String? _selectedImagePath;

  @override
  get init => () {};

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),

                // Logo
                Container(
                  height: 80,
                  child: Image.asset(
                    'mainlogo.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ).localAsset(),
                ),

                SizedBox(height: 4),

                // Title
                Text(
                  'Set Up your Account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: 8),

                // Subtitle
                Text(
                  'Enter your information to complete your registration',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),

                SizedBox(height: 32),

                // Progress Indicator (Step 3 of 3) - All segments filled
                _buildProgressIndicator(currentStep: 3, totalSteps: 3),

                SizedBox(height: 32),

                // Section Title with Back Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upload Profile Photo',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Back',
                        style: TextStyle(
                          color: Color(0xFF8B5CF6),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 32),

                // Upload Area
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF8B5CF6), width: 2),
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFF8B5CF6).withOpacity(0.05),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color(0xFF8B5CF6),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _handleTakePhoto(),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xFF8B5CF6)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14),
                        ),
                        icon: Icon(Icons.camera_alt, color: Color(0xFF8B5CF6)),
                        label: Text(
                          'Take Photo',
                          style: TextStyle(
                            color: Color(0xFF8B5CF6),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _handleUploadPhoto(),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xFF8B5CF6)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14),
                        ),
                        icon: Icon(Icons.upload, color: Color(0xFF8B5CF6)),
                        label: Text(
                          'Upload Photo',
                          style: TextStyle(
                            color: Color(0xFF8B5CF6),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 60),

                // Finish Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => _handleFinish(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8B5CF6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Finish',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward,
                            color: Colors.white, size: 18),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 16),

                // Skip Option
                Center(
                  child: GestureDetector(
                    onTap: () => _handleSkip(),
                    child: RichText(
                      text: TextSpan(
                        text: 'Complete this later. You can ',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                        children: [
                          TextSpan(
                            text: 'SKIP',
                            style: TextStyle(
                              color: Color(0xFF8B5CF6),
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(
      {required int currentStep, required int totalSteps}) {
    return Row(
      children: [
        // Step 1 circle
        AnimatedContainer(
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: Color(0xFF8B5CF6),
            shape: BoxShape.circle,
          ),
        ),

        // Segment 1
        Expanded(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            height: 4,
            margin: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: currentStep >= 1 ? Color(0xFF8B5CF6) : Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),

        // Step 2 circle
        AnimatedContainer(
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: Color(0xFF8B5CF6),
            shape: BoxShape.circle,
          ),
        ),

        // Segment 2
        Expanded(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            height: 4,
            margin: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: currentStep >= 2 ? Color(0xFF8B5CF6) : Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),

        // Step 3 circle
        AnimatedContainer(
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: Color(0xFF8B5CF6),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }

  void _handleTakePhoto() {
    // Implement camera functionality
    // You'll need to add camera permission and image_picker package
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Camera functionality - implement with image_picker'),
        backgroundColor: Color(0xFF8B5CF6),
      ),
    );
  }

  void _handleUploadPhoto() {
    // Implement gallery functionality
    // You'll need to add image_picker package
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Gallery functionality - implement with image_picker'),
        backgroundColor: Color(0xFF8B5CF6),
      ),
    );
  }

  void _handleFinish() {
    // Complete the registration process
    _completeRegistration();
  }

  void _handleSkip() {
    // Skip photo upload and complete registration
    _completeRegistration();
  }

  void _completeRegistration() {
    // Show completion message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Account setup completed successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    // Navigate to main dashboard or home page
    // Replace '/dashboard' with your actual main page route
    routeTo('/dashboard');
  }
}
