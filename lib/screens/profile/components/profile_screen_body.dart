// ignore_for_file: empty_catches, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/auth/components/custom_button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({super.key});

  @override
  _ProfileScreenBodyState createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    if (await Permission.photos.isDenied) {
      await Permission.photos.request();
    }

    if (await Permission.camera.isDenied) {
      await Permission.camera.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _ProfileImageSection(
                  profileImage: _profileImage,
                  onPickImage: _pickImage,
                ),
                const SizedBox(height: 32),
                _ProfileTextField(
                  controller: _nameController,
                  labelText: 'Full Name',
                  prefixIcon: Icons.person,
                ),
                const SizedBox(height: 24),
                _ProfileTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 24),
                _ProfileTextField(
                  controller: _phoneController,
                  labelText: 'Phone Number',
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 24),
                _ProfileTextField(
                  controller: _dobController,
                  labelText: 'Date of Birth',
                  prefixIcon: Icons.calendar_today,
                  onTap: _selectDate,
                  readOnly: true,
                ),
                const SizedBox(height: 32),
                CustomButton(
                  onTap: _saveProfile,
                  title: 'Continue',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _profileImage = File(pickedFile.path);
        });
      }
    } catch (e) {}
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // Save the profile data
    }
  }

  void _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }
}

class _ProfileImageSection extends StatelessWidget {
  final File? profileImage;
  final VoidCallback onPickImage;

  const _ProfileImageSection({
    required this.profileImage,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPickImage,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: profileImage != null
            ? FileImage(profileImage!)
            : const AssetImage('assets/images/default_profile.png')
                as ImageProvider,
        child: const Align(
          alignment: Alignment.bottomRight,
          child: Icon(Icons.edit, color: kSignUpColor),
        ),
      ),
    );
  }
}

class _ProfileTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final TextInputType? keyboardType;
  final GestureTapCallback? onTap;
  final bool? readOnly;

  const _ProfileTextField({
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.keyboardType,
    this.onTap,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: kSignUpColor),
        prefixIcon: Icon(prefixIcon, color: kSignUpColor),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: kSignUpColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: kSignUpColor),
        ),
      ),
      keyboardType: keyboardType,
      readOnly: readOnly ?? false,
      onTap: onTap,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $labelText';
        }
        return null;
      },
    );
  }
}
