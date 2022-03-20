import 'package:flutter/material.dart';

class AdSection extends StatelessWidget {
  const AdSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 0.5,
              blurStyle: BlurStyle.solid,
              color: const Color.fromARGB(255, 250, 98, 98).withOpacity(0.5),
              offset: const Offset(0, 3))
        ],
        borderRadius: BorderRadius.circular(30),
        color: Colors.red,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("تبلیغات",
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  ),
        ],
      ),
    );
  }
}
