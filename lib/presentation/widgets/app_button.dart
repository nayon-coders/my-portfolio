import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key, required this.text,  this.isLoading = false, required this.onClick,
  });

  final String text;
  final bool isLoading;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100)
        ),
        child: Center(child: isLoading ? CircularProgressIndicator(color: Colors.black,)  :Text("Login",
          style: TextStyle(
              color: Colors.black
          ),
        ),),
      ),
    );
  }
}
