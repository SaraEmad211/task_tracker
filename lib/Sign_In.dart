// ignore: duplicate_ignore
// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, camel_case_types

import 'package:flutter/material.dart';
import 'package:to_do_list/Home_screen.dart';

class Sign_in extends StatelessWidget {
  const Sign_in({super.key});

  static final TextEditingController nameController = TextEditingController();
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController = TextEditingController();
  static final TextEditingController phoneController = TextEditingController(); 
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[150],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleText(),
                  const SizedBox(height: 30),
                  inputField(
                    label: "Name",
                    hint: "Enter your name",
                    icon: Icons.person,
                    controller: nameController,
                    validator: (value) =>
                        value == null || value.isEmpty ||value.length > 11 ? "Please enter your name" : null,
                  ),
                  const SizedBox(height: 20),
                  inputField(
                    label: "Email",
                    hint: "Enter your email",
                    icon: Icons.email,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        value == null || value.isEmpty ? "Please enter your email" : null,
                  ),
                  const SizedBox(height: 20),
                  inputField(
                    label: "Phone Number", 
                    hint: "Enter your phone number",
                    icon: Icons.phone,
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) =>
                        value == null || value.isEmpty ? "Please enter your phone number" : null,
                  ),
                  const SizedBox(height: 20),
                  inputField(
                    label: "Password",
                    hint: "Create a password",
                    icon: Icons.lock,
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) => value == null || value.length < 8
                        ? "Password must be at least 8 characters long"
                        : null,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Must be at least 8 characters",
                    style: TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  const SizedBox(height: 20),
                  actionButton(
                    label: "Create Account",
                    color: Colors.blue,
                    textColor: Colors.white,
                    onTap: () {
                      if (formKey.currentState?.validate() == true) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Homescreen(
                              username: nameController.text,
                              email: emailController.text,
                              phone:phoneController.text,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  dividerText("or"),
                  const SizedBox(height: 15),
                  outlineButton(
                    label: "Sign up with Google",
                    icon: Icons.g_mobiledata,
                    onTap: () {},
                  ),
                  const SizedBox(height: 15),
                  outlineButton(
                    label: "Sign up with Apple ID",
                    icon: Icons.apple,
                    onTap: () {},
                  ),
                  const SizedBox(height: 15),
                  endText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget inputField({
    required String label,
    required String hint,
    IconData? icon,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    required String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.blue),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.purpleAccent),
            ),
            prefixIcon: icon != null ? Icon(icon, color: Colors.lightBlue) : null,
          ),
          style: const TextStyle(color: Colors.purpleAccent),
        ),
      ],
    );
  }

  Widget actionButton({
    required String label,
    required Color color,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
          ),
        ),
      ),
    );
  }

  Widget outlineButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.purpleAccent),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.teal, size: 26),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dividerText(String text) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.grey, thickness: 1.5)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            text,
            style: const TextStyle(color: Colors.black87, fontSize: 16),
          ),
        ),
        const Expanded(child: Divider(color: Colors.grey, thickness: 1.5)),
      ],
    );
  }

  Widget endText() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Have an account?",
            style: TextStyle(color: Colors.black87, fontSize: 16),
          ),
          InkWell(
            onTap: () {},
            child: const Text(
              " Try to sign in",
              style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Create account",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        SizedBox(height: 8),
        Text(
          "Start your 30-day free trial. Cancel anytime",
          style: TextStyle(color: Colors.amber, fontSize: 16),
        ),
      ],
    );
  }
}
