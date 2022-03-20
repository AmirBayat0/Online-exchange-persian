import 'dart:developer' as developer;
import 'dart:convert' as convert;
//
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
//
import '../model/currency.dart';
import '../widget/ad.dart';
import '../widget/listview_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  Future getResponse(BuildContext context) async {
    var url =
        "https://sasansafari.com/flutter/api.php?access_key=flutter123456";

    var res = await http.get(Uri.parse(url));

    developer.log(res.body, name: "main");
    print(res.statusCode);
    if (listOfCurrency.isEmpty) {
      if (res.statusCode == 200) {

        developer.log(res.body,
            name: "get response", error: convert.jsonDecode(res.body));
        _showSnackBar(context, "بروز رسانی اطلاعات با موفقیت انجام شد");
        List jsonList = convert.jsonDecode(res.body);

        if (jsonList.isNotEmpty) {
          for (int i = 0; i < jsonList.length; i++) {
            //
            setState(
              () {
                listOfCurrency.add(
                  Currency(
                    id: jsonList[i]["id"],
                    title: jsonList[i]["title"],
                    price: jsonList[i]["price"],
                    changes: jsonList[i]["changes"],
                    status: jsonList[i]["status"],
                  ),
                );
              },
            );
          }
        }
      }
    }
    return res;
  }

  @override
  void initState() {
    getResponse(context);
    super.initState();
  }

/////////////////////////////////////
//@CodeWithFlexz on Instagram
//
//AmirBayat0 on Github
//Programming with Flexz on Youtube
/////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: Container(
            margin: const EdgeInsets.all(4),
            width: 50,
            height: 50,
            child: Image.asset(
              "assets/images/icon.png",
            ),
          ),
          title: Text("صرافی آنلاین",
              style: Theme.of(context).textTheme.headline1),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(4),
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      "assets/images/icon_q.png",
                    ),
                  ),
                  Text(
                    "نرخ ارز آزاد چیست؟",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(
                    "نرخ ارزها در معاملات نقدی و رایج روزانه است. معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل مینمایند.",
                    style: Theme.of(context).textTheme.bodyText1),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: double.infinity,
                height: 35,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 130, 130, 130),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("نام ازاد ارز",
                        style: Theme.of(context).textTheme.headline2),
                    Text(
                      "قیمت",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Text(
                      "تغییر",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.9,
                child: isLoaded(context),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 16,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 16,
                      child: TextButton.icon(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 202, 193, 255),
                            ),
                          ),
                          onPressed: () {
                            listOfCurrency.clear();
                            isLoaded(context);
                          },
                          icon: const Icon(
                            CupertinoIcons.refresh_thin,
                            color: Colors.black,
                          ),
                          label: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text(
                              "به روز رسانی",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(fontSize: 16),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Text(
                        "اخرین بروز رسانی  ${_getTime()}",
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method for loading the data
  FutureBuilder<dynamic> isLoaded(BuildContext context) {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return snapshot.hasData
            ? ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: listOfCurrency.length,
                itemBuilder: (ctx, index) {
                  return ListViewItem(index);
                },
                separatorBuilder: (BuildContext context, int index) {
                  if (index % 9 == 0) {
                    return const AdSection();
                  } else {
                    return Container();
                  }
                })
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
      future: getResponse(context),
    );
  }
}

// SnackBar Function
void _showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
      action: SnackBarAction(
          label: "فهمیدم", onPressed: () {}, textColor: Colors.green),
    ),
  );
}

// Geting the update Time
String _getTime() {
  DateTime now = DateTime.now();
  return DateFormat('kk:mm').format(now);
}

// convert english number to persian number
String getPersinaNumber(String num) {
  const List<String> en = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const List<String> pe = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

  en.forEach((element) {
    num = num.replaceAll(element, pe[en.indexOf(element)]);
  });

  return num;
}
