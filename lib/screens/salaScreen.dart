import 'package:flutter/material.dart';
import 'package:tafakari/screens/rootLayout.dart';
import 'package:tafakari/components/accordion.dart';
import 'package:tafakari/services/getData.dart';

class SalaScreen extends StatefulWidget {
  static const routeName = '/sala-home';
  const SalaScreen({super.key});

  @override
  State<SalaScreen> createState() => _SalaScreenState();
}

class _SalaScreenState extends State<SalaScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _loading = true;
  List? salazakawaida;
  List? salazakilasiku;
  List? salazafamilia;
  List? sakramenti;
  List? baraka;
  List? rozariitakatifu;
  List? njiayamsalaba;
  List? novena;

  Future<void> loadData() async {
    var res1 = await getData('salazakawaida');
    salazakawaida = res1 == null ? [] : res1;
    var res2 = await getData('salazakilasiku');
    salazakilasiku = res2 == null ? [] : res2;
    var res3 = await getData('salazafamilia');
    salazafamilia = res3 == null ? [] : res3;
    var res4 = await getData('sakramenti');
    sakramenti = res4 == null ? [] : res4;
    var res5 = await getData('baraka');
    baraka = res5 == null ? [] : res5;
    var res6 = await getData('rozariitakatifu');
    rozariitakatifu = res6 == null ? [] : res6;
    var res7 = await getData('njiayamsalaba');
    njiayamsalaba = res7 == null ? [] : res7;
    var res8 = await getData('novena');
    novena = res8 == null ? [] : res8;

    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  SingleChildScrollView myPrayerWidgets(List? prayers) {
    return SingleChildScrollView(
      child: Column(
        children: prayers!
            .map((e) => Accordion(title: e['title'], content: e['content']))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RootLayout(
      appBarTitle: 'Sala',
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                TabBar(
                  isScrollable: true,
                  labelPadding: EdgeInsets.all(5),
                  indicatorPadding:
                      EdgeInsets.symmetric(vertical: 11, horizontal: 5),
                  labelColor: Colors.grey,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Text(
                        'Sala za kawaida',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Tab(
                        child: Text(
                      'Sala za kila siku',
                      style: TextStyle(fontSize: 17),
                    )),
                    Tab(
                        child: Text(
                      'Sala za familia',
                      style: TextStyle(fontSize: 17),
                    )),
                    Tab(
                        child: Text(
                      'Sakramenti',
                      style: TextStyle(fontSize: 17),
                    )),
                    Tab(
                        child: Text(
                      'Baraka',
                      style: TextStyle(fontSize: 17),
                    )),
                    Tab(
                        child: Text(
                      'Rozari itakatifu',
                      style: TextStyle(fontSize: 17),
                    )),
                    Tab(
                        child: Text(
                      'Njia ya msalaba',
                      style: TextStyle(fontSize: 17),
                    )),
                    Tab(
                        child: Text(
                      'Novena',
                      style: TextStyle(fontSize: 17),
                    )),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        myPrayerWidgets(salazakawaida),
                        myPrayerWidgets(salazakilasiku),
                        myPrayerWidgets(salazafamilia),
                        myPrayerWidgets(sakramenti),
                        myPrayerWidgets(baraka),
                        myPrayerWidgets(rozariitakatifu),
                        myPrayerWidgets(njiayamsalaba),
                        myPrayerWidgets(novena),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
