import 'package:flutter/material.dart';

import '../model/currency.dart';
import '../screens/home.dart';

class ListViewItem extends StatelessWidget {
  int index;
  ListViewItem(this.index, {Key? key}) : super(key: key);

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
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(0, 3))
        ],
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(listOfCurrency[index].title!,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.black)),
          Text(getPersinaNumber(listOfCurrency[index].price.toString()),
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.black)),
          Text(getPersinaNumber(listOfCurrency[index].changes.toString()),
              style: listOfCurrency[index].status == "n"
                  ? Theme.of(context).textTheme.headline3
                  : Theme.of(context).textTheme.headline4),
        ],
      ),
    );
  }
}
