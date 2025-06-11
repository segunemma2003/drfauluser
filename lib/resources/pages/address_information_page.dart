import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AddressInformationPage extends NyStatefulWidget {
  static RouteView path = ("/address-info", (_) => AddressInformationPage());

  AddressInformationPage({super.key})
      : super(child: () => _AddressInformationPageState());
}

class _AddressInformationPageState extends NyPage<AddressInformationPage> {
  final _zipcodeController = TextEditingController();
  final _houseNumberController = TextEditingController();
  final _roadController = TextEditingController();
  final _neighborhoodController = TextEditingController();
  final _complementController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();

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

                // Progress Indicator (Step 2 of 3)
                _buildProgressIndicator(currentStep: 2, totalSteps: 3),

                SizedBox(height: 32),

                // Section Title with Back Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Address Information',
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

                SizedBox(height: 24),

                // Zipcode
                _buildTextField(
                  controller: _zipcodeController,
                  label: 'Zipcode',
                  hint: 'Select your Zipcode',
                ),

                SizedBox(height: 16),

                // House Number and Road
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _houseNumberController,
                        label: 'House Number',
                        hint: 'Your house number',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        controller: _roadController,
                        label: 'Road',
                        hint: 'The road',
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16),

                // Neighborhood and Complement
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _neighborhoodController,
                        label: 'Neighborhood',
                        hint: 'Neighborhood',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        controller: _complementController,
                        label: 'Complement',
                        hint: 'Enter complement',
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16),

                // City and State
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _cityController,
                        label: 'City',
                        hint: 'Select City',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        controller: _stateController,
                        label: 'State',
                        hint: 'The state',
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40),

                // Continue Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => _handleContinue(),
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
                          'Continue',
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

                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(
      {required int currentStep, required int totalSteps}) {
    return Container(
      height: 20, // Give enough height for circles to sit on the line
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background line
          Container(
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Progress segments with animation
          Row(
            children: [
              // Segment 1 (Step 1 to Step 2)
              Expanded(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  height: 4,
                  decoration: BoxDecoration(
                    color:
                        currentStep >= 2 ? Color(0xFF8B5CF6) : Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              // Segment 2 (Step 2 to Step 3)
              Expanded(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  height: 4,
                  decoration: BoxDecoration(
                    color:
                        currentStep >= 3 ? Color(0xFF8B5CF6) : Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ],
          ),

          // Step indicators positioned on the line
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Step 1 indicator
              _buildStepIndicator(1, currentStep),

              // Step 2 indicator
              _buildStepIndicator(2, currentStep),

              // Step 3 indicator
              _buildStepIndicator(3, currentStep),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(int stepNumber, int currentStep) {
    if (stepNumber < currentStep) {
      // Completed step - show circle with animation
      return AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: Color(0xFF8B5CF6),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
      );
    } else if (stepNumber == currentStep) {
      // Current step - show dash/segment with animation
      return AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        width: 24,
        height: 8,
        decoration: BoxDecoration(
          color: Color(0xFF8B5CF6),
          borderRadius: BorderRadius.circular(4),
        ),
      );
    } else {
      // Future step - show small dot with animation
      return AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          shape: BoxShape.circle,
        ),
      );
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400]),
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
              borderSide: BorderSide(color: Color(0xFF8B5CF6), width: 2),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }

  void _handleContinue() {
    // Validate required fields
    if (_zipcodeController.text.isEmpty ||
        _houseNumberController.text.isEmpty ||
        _roadController.text.isEmpty ||
        _cityController.text.isEmpty ||
        _stateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all required fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Save data and navigate to next step
    routeTo('/profile-photo');
  }
}
