import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String operation;
  final VoidCallback onPressed;
  final Color operationColor;
  final bool isLoading;

  const AppButton(
      {required this.operation,
      required this.onPressed,
      required this.operationColor,
      required this.isLoading,
      super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        width: double.infinity,
        height: size.height * 0.07,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                operation,
                style: TextStyle(
                    color: operationColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.blue,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
