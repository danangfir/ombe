import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController(text: 'info@example.com');
  final TextEditingController _passwordController = TextEditingController();
  bool _obscure = true;

  static const Color primaryGreen = Color(0xFF0A7A56);
  static const Color subtitleColor = Color(0xFF6B6B6B);
  static const Color beige = Color(0xFFF2DBB8);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              // Logo + Brand
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Online asset for coffee cup logo
                  Image.network(
                    'https://raw.githubusercontent.com/0xjimmy/hosted-assets/main/icons/coffee_cup_green.png',
                    width: 48,
                    height: 48,
                    errorBuilder: (_, __, ___) => Icon(Icons.coffee, size: 48, color: primaryGreen),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Ombe',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 36),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Sign In',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 36),
              ),
              const SizedBox(height: 12),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: subtitleColor),
              ),
              const SizedBox(height: 32),
              Text('Username', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: subtitleColor, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'info@example.com',
                ),
              ),
              const SizedBox(height: 24),
              Text('Password', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: subtitleColor, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                obscureText: _obscure,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility, color: primaryGreen),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {},
                  child: const Text('LOGIN', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text('Forgot Password?', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: subtitleColor)),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(foregroundColor: primaryGreen),
                    child: const Text('Reset Password'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: Text("Dont have any account?", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: subtitleColor)),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: size.width,
                height: 64,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: beige,
                    foregroundColor: Colors.black87,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('CREATE AN ACCOUNT', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}


