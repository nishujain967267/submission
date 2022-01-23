import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:submission/album.dart';
import 'api.dart';
import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    
    
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = ApiManager().fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    
    // futureAlbum = ApiManager().fetchAlbum();
    return Scaffold(
      
      bottomNavigationBar: buildBottomNavyBar(),
      body: buildBody(),
    );
  }

  BottomNavyBar buildBottomNavyBar() {
    return BottomNavyBar(
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() {
        _currentIndex = index;
      }),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.home),
          title: const Text('Home'),
          activeColor: Colors.red,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.chat),
          title: const Text('Chat'),
          activeColor: Colors.purpleAccent,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.mail),
          title: const Text(
            'Message',
          ),
          activeColor: Colors.pink,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: CircleAvatar(
            radius: 12,
            child:
                Image.network('https://www.woolha.com/media/2020/03/eevee.png'),
          ),
          title: const Text('Profile'),
          activeColor: Colors.blue,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  buildBody() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(left: 10),
        color: Colors.pink[100],
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: Image.network(
                        'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmV3JTIwemVhbGFuZCUyMHBlb3BsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                        height: 180,
                        width: 180,
                      ),
                    ),
                    const Text('Uddesh Rajoria',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const Text(
                      'Gwalior, India',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Relegion: '),
                          TextSpan(
                              text: 'Hindu',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink)),
                        ],
                      ),
                    ),
                    const Card(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
                        child: Text(
                          'My Visitors',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      color: Colors.pink,
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
                FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    print(snapshot.data.toString());
                    if (snapshot.hasData) {
                      var data = snapshot.data?.data;
                      // ignore: avoid_unnecessary_containers
                      return Container(
                        margin: new EdgeInsets.only(bottom: 20),
                        child: SizedBox(
                            height: 320,
                            width: 170,
                            child: PageView.builder(
                              controller: PageController(),
                                scrollDirection: Axis.vertical,
                                
                                      itemCount: data?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        return SafeArea(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Card(
                                                child: Image.network(
                                                  'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmV3JTIwemVhbGFuZCUyMHBlb3BsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                                                  height: 160,
                                                  width: 170,
                                                ),
                                              ),
                                              Text("${data?[index].name?.characters.take(9)}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16)),
                                              const Text(
                                                'Gwalior, India',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              RichText(
                                                text: const TextSpan(
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey,
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: 'Relegion: '),
                                                    TextSpan(
                                                        text: 'Hindu',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.pink)),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: const [
                                                  Card(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5.0,
                                                              vertical: 5),
                                                      child: Icon(
                                                        Icons
                                                            .health_and_safety_rounded,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    color: Colors.pink,
                                                  ),
                                                  Card(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5.0,
                                                              vertical: 5),
                                                      child: Icon(
                                                        Icons.message,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    color: Colors.pink,
                                                  ),
                                                  Card(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5.0,
                                                              vertical: 5),
                                                      child: Icon(
                                                        Icons.download,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    color: Colors.pink,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 50,
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                )
              ],
            ),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Image(
                  image: AssetImage(
                    'asset/images/img.png',
                  ),
                  height: 160,
                  width: 160,
                ),
                SizedBox(
                  height: 160,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
