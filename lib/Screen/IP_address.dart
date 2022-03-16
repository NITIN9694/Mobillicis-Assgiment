import 'package:assignment/API/Device_info.dart';
import 'package:assignment/API/ip_api.dart';
import 'package:flutter/material.dart';

class IP_Screen extends StatefulWidget {
  const IP_Screen({Key? key}) : super(key: key);

  @override
  State<IP_Screen> createState() => _IP_ScreenState();
}

class _IP_ScreenState extends State<IP_Screen> {
  Map<String, dynamic> map = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  Future init() async {
    final ipAddress = await IpInfoApi.getIp();
    final phone = await DevoceInfoAPi.getPhoneInfo();
    if (!mounted) return;
    setState(() => map = {'IP Address': ipAddress, 'Phone': phone});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("IP Address"),
        centerTitle: true,
      ),
      body: Container(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            map.toString().isEmpty ? "Loding..." : map.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ))),
    );
  }
}
