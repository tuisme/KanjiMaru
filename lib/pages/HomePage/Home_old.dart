/* import 'package:KanjiMaru/models/UserModel.dart';
import 'package:KanjiMaru/models/VocabModel.dart';
import 'package:KanjiMaru/pages/HomePage/GamesTab.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List bottomNavBarPages = [
    {'page': home, 'title': Text('Home')},
    {'page': study, 'title': Text('Study')},
    {'page': settings, 'title': Text('Settings')},
  ];

  static Widget home(BuildContext context) {
    User user = Provider.of<User>(context);
    Vocab vocab = Provider.of<Vocab>(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xff0d1124),
              const Color(0xff181921),
              //Color(0xff7303c0),
              //Color(0xffec38bc),
            ]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'こんにちは！',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              width: 300,
              child: Card(
                color: Color(0xFF262A34),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              width: 300,
              child: Card(
                color: Color(0xFF262A34),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(),
              ),
            ),
          ),
          /* CircularPercentIndicator(
            radius: 150.0,
            lineWidth: 10.0,
            percent: ((user.stats.reviews) / (user.settings.reviewGoal))
                .clamp(.0, 1.0),
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${user.stats.reviews}/${user.settings.reviewGoal}'),
                Text('Reviews'),
              ],
            ),
            progressColor: Theme.of(context).accentColor,
          ), */
          /* Padding(
            padding: const EdgeInsets.only(top: 36.0),
            child: Text('Learned'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Center(child: Text('Kanji')),
                    ),
                    Center(child: Text(user.stats.kanjiLearned.toString())),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Center(child: Text('Vocab')),
                    ),
                    Center(child: Text(user.stats.vocabLearned.toString())),
                  ],
                ),
              ),
            ],
          ), */
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, 'study');
                /* Firestore.instance
                    .collection('users')
                    .document('ExitTrance')
                    .updateData({
                  'settings.reviewGoal': FieldValue.increment(1),
                }); */
                /*  Firestore.instance
                    .collection('users')
                    .document('ExitTrance')
                    .setData({
                  'settings': {
                    'reviewGoal': 100,
                  },
                  'reviewSet': {
                    '丸': {
                      'char': '丸',
                      'desc': 'maru lmao',
                    },
                    '他': {
                      'char': '他',
                      'desc': 'something',
                    },
                  },
                  'stats': {
                    'kanjiLearned': 0,
                    'reviews': 0,
                    'vocabLearned': 0,
                  }
                }); */

                /* Firestore.instance.runTransaction((transaction) async => transaction
                        .update(
                            Firestore.instance
                                .collection('users')
                                .document('ExitTrance'),
                            {
                          'settings': {
                            'review_goal': 200,
                          }
                        })); */
              },
              child: Text(
                'Quick Study',
              ),
              color: Theme.of(context).primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MaterialButton(
              onPressed: () {
                vocab.vocab.forEach((i) => print(i.reading));
                print(vocab.vocab[0].reading);
              },
              child: Text(
                'Test',
              ),
              color: Theme.of(context).primaryColor,
            ),
          ),
          /* Flexible(
            child: StreamBuilder<DocumentSnapshot>(
              stream: Firestore.instance
                  .collection('users')
                  .document('ExitTrance')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new Text('Loading...');
                  default:
                    var values = snapshot.data['review_set'];
                    return new ListView.builder(
                      itemCount: values.length,
                      itemBuilder: (BuildContext context, int index) {
                        String key = values.keys.elementAt(index);

                        return new Column(
                          children: <Widget>[
                            new ListTile(
                              title: new Text("$key"),
                              subtitle: new Text("${values[key]['desc']}"),
                            ),
                            new Divider(
                              height: 2.0,
                            ),
                          ],
                        );
                      },
                    );
                }
              },
            ),
          ), */
        ],
      ),
    );
    /* return Center(
      child: Container(
        child: Text('Lmao'),
      ),
    ); */
  }

  static Widget settings(BuildContext context) {
    return Container(
      child: Center(child: Text('')),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xff0d1124),
              const Color(0xff181921),
            ]),
      ),
    );
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      /* appBar: AppBar(
        title: bottomNavBarPages[_currentIndex]['title'],
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
      ), */
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          home(context),
          study(context),
          settings(context),
        ],
      ),

      //bottomNavBarPages[_currentIndex]['page'](context),

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Study',
              icon: Icon(Icons.slow_motion_video),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.settings),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            });
          }),
    );
  }
}
 */