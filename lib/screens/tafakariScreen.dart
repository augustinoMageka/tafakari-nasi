import 'package:flutter/material.dart';
import 'package:tafakari/screens/rootLayout.dart';
import 'package:tafakari/components/myCircularIconButton.dart';
import 'package:intl/intl.dart';
import 'package:tafakari/services/getData.dart';

class TafakariHomeScreen extends StatefulWidget {
  static const routeName = '/tafakari-home';
  const TafakariHomeScreen({super.key});

  @override
  State<TafakariHomeScreen> createState() => _TafakariHomeScreenState();
}

class _TafakariHomeScreenState extends State<TafakariHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _loading = true;

  Widget tabContent(String? title, String? content) {
    return _loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title == null ? 'No content yet.' : title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                content == null ? '' : content,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          );
  }

  DateTime _selectedDate = DateTime.now();
  Map? somolakwanza;
  Map? zaburi;
  Map? injili;
  Map? tafakari;
  Map? mtakatifuwasiku;
  Map? nukuu;
  Map? nyimbo;
  Map? salayawaumini;

  Future<void> loadData(DateTime date, {bool firstLoad = false}) async {
    //TODO We have to put some caching mechanism here.....
    setState(() {
      _loading = true;
    });
    var res1 = await getDataByDate('somolakwanza', date);
    var res2 = await getDataByDate('zaburi', date);
    var res3 = await getDataByDate('injili', date);
    if (firstLoad)
      setState(() {
        _loading = false;
        somolakwanza = res1 == null ? {} : res1;
        zaburi = res2 == null ? {} : res2;
        injili = res3 == null ? {} : res3;
      });
    var res4 = await getDataByDate('tafakari', date);
    var res5 = await getDataByDate('mtakatifuwasiku', date);
    var res6 = await getDataByDate('nukuu', date);
    var res7 = await getDataByDate('nyimbo', date);
    var res8 = await getDataByDate('salayawaumini', date);
    setState(() {
      if (!firstLoad) {
        somolakwanza = res1 == null ? {} : res1;
        zaburi = res2 == null ? {} : res2;
        injili = res3 == null ? {} : res3;
      }
      tafakari = res4 == null ? {} : res4;
      mtakatifuwasiku = res5 == null ? {} : res5;
      nukuu = res6 == null ? {} : res6;
      nyimbo = res7 == null ? {} : res7;
      salayawaumini = res8 == null ? {} : res8;
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData(_selectedDate, firstLoad: true);
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RootLayout(
      appBarTitle: 'Tafakari Nasi',
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
        ),
        child: Column(
          children: [
            Text(
              'Juma la 2 la pasaka',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCircluarIconButton(
                  icon: Icons.arrow_back,
                  onPressed: () async {
                    var newDate =
                        _selectedDate.subtract(const Duration(days: 1));
                    loadData(newDate);
                    setState(() {
                      _selectedDate = newDate;
                    });
                  },
                ),
                TextButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null && pickedDate != _selectedDate) {
                      loadData(pickedDate);
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    }
                  },
                  child: Text(
                    DateFormat.yMMMEd().format(_selectedDate).toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                MyCircluarIconButton(
                  icon: Icons.arrow_forward,
                  onPressed: () async {
                    var newDate = _selectedDate.add(const Duration(days: 1));
                    loadData(newDate);
                    setState(() {
                      _selectedDate = newDate;
                    });
                  },
                )
              ],
            ),
            TabBar(
              isScrollable: true,
              labelPadding: EdgeInsets.all(10),
              indicatorPadding:
                  EdgeInsets.symmetric(vertical: 17, horizontal: 5),
              // padding: EdgeInsets.all(0),
              labelColor: Colors.grey,
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text(
                    'Somo la kwanza',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Tab(
                    child: Text(
                  'Zaburi',
                  style: TextStyle(fontSize: 17),
                )),
                Tab(
                    child: Text(
                  'Injili',
                  style: TextStyle(fontSize: 17),
                )),
                Tab(
                    child: Text(
                  'Tafakari',
                  style: TextStyle(fontSize: 17),
                )),
                Tab(
                    child: Text(
                  'Mtakatifu wa siku',
                  style: TextStyle(fontSize: 17),
                )),
                Tab(
                    child: Text(
                  'Nukuu',
                  style: TextStyle(fontSize: 17),
                )),
                Tab(
                    child: Text(
                  'Nyimbo',
                  style: TextStyle(fontSize: 17),
                )),
                Tab(
                    child: Text(
                  'Sala ya waumini',
                  style: TextStyle(fontSize: 17),
                )),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    tabContent(
                        somolakwanza?['title'], somolakwanza?['content']),
                    tabContent(zaburi?['title'], zaburi?['content']),
                    tabContent(injili?['title'], injili?['content']),
                    tabContent(tafakari?['title'], tafakari?['content']),
                    tabContent(
                        mtakatifuwasiku?['title'], mtakatifuwasiku?['content']),
                    tabContent(nukuu?['title'], nukuu?['content']),
                    tabContent(nyimbo?['title'], nyimbo?['content']),
                    tabContent(
                        salayawaumini?['title'], salayawaumini?['content']),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
