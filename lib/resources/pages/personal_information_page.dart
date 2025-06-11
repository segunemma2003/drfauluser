import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class PersonalInformationPage extends NyStatefulWidget {
  static RouteView path = ("/personal-info", (_) => PersonalInformationPage());

  PersonalInformationPage({super.key})
      : super(child: () => _PersonalInformationPageState());
}

class _PersonalInformationPageState extends NyPage<PersonalInformationPage> {
  final _dobController = TextEditingController();
  final _cpfController = TextEditingController();
  final _motherNameController = TextEditingController();
  String _selectedGender = 'Female';

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

                // Progress Indicator (Step 1 of 3)
                _buildProgressIndicator(currentStep: 1, totalSteps: 3),

                SizedBox(height: 32),

                // Section Title
                Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: 24),

                // Date of Birth
                Text(
                  'Date Of Birth',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _dobController,
                  decoration: InputDecoration(
                    hintText: 'DD/MM/YYYY',
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
                      borderSide:
                          BorderSide(color: Color(0xFF8B5CF6), width: 2),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    suffixIcon:
                        Icon(Icons.calendar_today, color: Colors.grey[600]),
                  ),
                  onTap: () async {
                    DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      _dobController.text =
                          "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
                    }
                  },
                  readOnly: true,
                ),

                SizedBox(height: 20),

                // CPF
                Text(
                  'Cadastro de Pessoas Físicas (CPF)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _cpfController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '999.999.999-99',
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
                      borderSide:
                          BorderSide(color: Color(0xFF8B5CF6), width: 2),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),

                SizedBox(height: 20),

                // Gender
                Text(
                  'Gender',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedGender = 'Male'),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _selectedGender == 'Male'
                                  ? Color(0xFF8B5CF6)
                                  : Colors.grey[300]!,
                              width: _selectedGender == 'Male' ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: _selectedGender == 'Male'
                                ? Color(0xFF8B5CF6).withOpacity(0.1)
                                : Colors.white,
                          ),
                          child: Text(
                            'Male',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _selectedGender == 'Male'
                                  ? Color(0xFF8B5CF6)
                                  : Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedGender = 'Female'),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _selectedGender == 'Female'
                                  ? Color(0xFF8B5CF6)
                                  : Colors.grey[300]!,
                              width: _selectedGender == 'Female' ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: _selectedGender == 'Female'
                                ? Color(0xFF8B5CF6).withOpacity(0.1)
                                : Colors.white,
                          ),
                          child: Text(
                            'Female',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _selectedGender == 'Female'
                                  ? Color(0xFF8B5CF6)
                                  : Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedGender = 'Other'),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _selectedGender == 'Other'
                                  ? Color(0xFF8B5CF6)
                                  : Colors.grey[300]!,
                              width: _selectedGender == 'Other' ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: _selectedGender == 'Other'
                                ? Color(0xFF8B5CF6).withOpacity(0.1)
                                : Colors.white,
                          ),
                          child: Text(
                            'Other',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _selectedGender == 'Other'
                                  ? Color(0xFF8B5CF6)
                                  : Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Mother's Name
                Text(
                  "Mother's Name",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _motherNameController,
                  decoration: InputDecoration(
                    hintText: 'My Mama',
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
                      borderSide:
                          BorderSide(color: Color(0xFF8B5CF6), width: 2),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
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

  void _handleContinue() {
    // Validate fields
    if (_dobController.text.isEmpty ||
        _cpfController.text.isEmpty ||
        _motherNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all required fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Save data and navigate to next step
    // You can save to shared preferences, session, or pass as arguments
    routeTo('/address-info');
  }
}
