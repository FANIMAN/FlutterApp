import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Idea {
  final String name;
  final String description;
  final String uploadors;
  final String image;
  final String detail_info;
  Idea(this.name, this.description, this.uploadors, this.image,
      this.detail_info);

  static List<Idea> getIdeas() {
    List<Idea> ideas = <Idea>[];
    ideas.add(Idea(
      "Technology",
      "Technology is the most featureful phone ever.",
      "Fani",
      "idea1.jpeg",
      "Anim et id proident cillum ea dolor nisi fugiat. Minim adipisicing eiusmod amet do commodo eu cupidatat reprehenderit dolor et reprehenderit elit. Amet sunt veniam commodo consequat dolore labore nisi aliqua labore duis officia. Nostrud laboris Lorem veniam id. Nisi veniam id nostrud aute nisi voluptate tempor laborum laborum ex laborum veniam aliqua. Tempor aliquip ipsum elit culpa anim.",
    ));
    ideas.add(Idea(
      "Laptop",
      "Laptop is most Ideaive development tool",
      "Sami",
      "idea2.jpeg",
      "Anim et id proident cillum ea dolor nisi fugiat. Minim adipisicing eiusmod amet do commodo eu cupidatat reprehenderit dolor et reprehenderit elit. Amet sunt veniam commodo consequat dolore labore nisi aliqua labore duis officia. Nostrud laboris Lorem veniam id. Nisi veniam id nostrud aute nisi voluptate tempor laborum laborum ex laborum veniam aliqua. Tempor aliquip ipsum elit culpa anim.",
    ));
    ideas.add(Idea(
      "Nature",
      "Nature is the most useful natural device ever for meeting",
      "Nati",
      "idea3.jpeg",
      "Anim et id proident cillum ea dolor nisi fugiat. Minim adipisicing eiusmod amet do commodo eu cupidatat reprehenderit dolor et reprehenderit elit. Amet sunt veniam commodo consequat dolore labore nisi aliqua labore duis officia. Nostrud laboris Lorem veniam id. Nisi veniam id nostrud aute nisi voluptate tempor laborum laborum ex laborum veniam aliqua. Tempor aliquip ipsum elit culpa anim.",
    ));
    ideas.add(Idea(
      "Pendrive",
      "iPhone is the stylist phone ever",
      "Kiddy",
      "idea4.jpeg",
      "Anim et id proident cillum ea dolor nisi fugiat. Minim adipisicing eiusmod amet do commodo eu cupidatat reprehenderit dolor et reprehenderit elit. Amet sunt veniam commodo consequat dolore labore nisi aliqua labore duis officia. Nostrud laboris Lorem veniam id. Nisi veniam id nostrud aute nisi voluptate tempor laborum laborum ex laborum veniam aliqua. Tempor aliquip ipsum elit culpa anim.",
    ));
    ideas.add(Idea(
      "Graduate Students",
      "iPhone is the stylist phone ever",
      "Betse",
      "idea5.jpeg",
      "Anim et id proident cillum ea dolor nisi fugiat. Minim adipisicing eiusmod amet do commodo eu cupidatat reprehenderit dolor et reprehenderit elit. Amet sunt veniam commodo consequat dolore labore nisi aliqua labore duis officia. Nostrud laboris Lorem veniam id. Nisi veniam id nostrud aute nisi voluptate tempor laborum laborum ex laborum veniam aliqua. Tempor aliquip ipsum elit culpa anim.",
    ));
    ideas.add(Idea(
      "What's New",
      "iPhone is the stylist phone ever",
      "Belly",
      "idea6.jpeg",
      "Anim et id proident cillum ea dolor nisi fugiat. Minim adipisicing eiusmod amet do commodo eu cupidatat reprehenderit dolor et reprehenderit elit. Amet sunt veniam commodo consequat dolore labore nisi aliqua labore duis officia. Nostrud laboris Lorem veniam id. Nisi veniam id nostrud aute nisi voluptate tempor laborum laborum ex laborum veniam aliqua. Tempor aliquip ipsum elit culpa anim.",
    ));
    return ideas;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Idea Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Idea Naviagtion demo home page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  final ideas = Idea.getIdeas();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("Idea"))),
        body: ListView.builder(
          itemCount: ideas.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: IdeaBox(item: ideas[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IdeaPage(item: ideas[index]),
                  ),
                );
              },
            );
          },
        ));
  }
}

class IdeaPage extends StatelessWidget {
  IdeaPage({Key key, this.item}) : super(key: key);
  final Idea item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.item.name),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
//                 ClipRRect(
//   borderRadius: BorderRadius.circular(50),
//   child: Center(child: Image.asset("assets/appimages/" + this.item.image)),
// ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Center(
                      child:
                          Image.asset("assets/appimages/" + this.item.image)),
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.name,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(this.item.description),
                            Text("User: " + this.item.uploadors.toString()),
                            RatingBox(),
                          ],
                        )))
              ]),
        ),
      ),
    );
  }
}

class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;
  void _setRatingAsOne() {
    setState(() {
      _rating = 1;
    });
  }

  void _setRatingAsTwo() {
    setState(() {
      _rating = 2;
    });
  }

  void _setRatingAsThree() {
    setState(() {
      _rating = 3;
    });
  }

  Widget build(BuildContext context) {
    double _size = 20;
    print(_rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 1
                ? Icon(
                    Icons.star,
                    size: _size,
                  )
                : Icon(
                    Icons.star_border,
                    size: _size,
                  )),
            color: Colors.red[500],
            onPressed: _setRatingAsOne,
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 2
                ? Icon(
                    Icons.star,
                    size: _size,
                  )
                : Icon(
                    Icons.star_border,
                    size: _size,
                  )),
            color: Colors.red[500],
            onPressed: _setRatingAsTwo,
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 3
                ? Icon(
                    Icons.star,
                    size: _size,
                  )
                : Icon(
                    Icons.star_border,
                    size: _size,
                  )),
            color: Colors.red[500],
            onPressed: _setRatingAsThree,
            iconSize: _size,
          ),
        ),
      ],
    );
  }
}

class IdeaBox extends StatelessWidget {
  IdeaBox({Key key, this.item}) : super(key: key);
  final Idea item;

  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.blue[10],
      // ),
      padding: EdgeInsets.all(2),
      height: 340,
      child: Card(
        margin: EdgeInsets.all(5),
        elevation: 10,
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(20),
  ),
     //   borderRadius: BorderRadius.circular(5),
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Image.asset(
                "assets/appimages/" + this.item.image,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(this.item.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            ),
                        // SizedBox(width: 10,),
                        Text(this.item.description),
                        Text("User: " + this.item.uploadors.toString(),
                        //textAlign: TextAlign.center,
                       // textAlign: WrapAlignment.center,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        ),
                        LikeDislike(),
                        //  RatingBox(),
                      ],
                    )))
          ],
        ),
      ),
      
    );
    // FloatingActionButtonAnimator.scaling;
    // floatingActionButton:
    // FloatingActionButton(
    //   onPressed: () {},
    //   // tooltip: 'Increment',
    //   child: Icon(Icons.add),
    // );
  }
}

class LikeDislike extends StatefulWidget {
  @override
  _LikeDislikeState createState() => _LikeDislikeState();
}

class _LikeDislikeState extends State<LikeDislike> {
  @override
  int _like = 0;
  int _dislike = 0;
  void _setLke() {
    setState(() {
      _like += 1;
    });
  }

  void _setDislike() {
    setState(() {
      _dislike += 1;
    });
  }

  Widget build(BuildContext context) {
    double _sizeIcon = 20;
    print(_like);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_like % 2 == 1
                ? Icon(
                    Icons.thumb_up,
                    size: _sizeIcon,
                    color: Colors.blue[500],
                  )
                : Icon(
                    Icons.thumb_up,
                    size: _sizeIcon,
                  )),
            //  icon: Icon(Icons.thumb_up),

            onPressed: _setLke,
            iconSize: _sizeIcon,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_dislike % 2 == 1
                ? Icon(
                    Icons.thumb_down,
                    size: _sizeIcon,
                    color: Colors.blue[500],
                  )
                : Icon(
                    Icons.thumb_down,
                    size: _sizeIcon,
                  )),
            //   icon: Icon(Icons.thumb_down),

            onPressed: _setDislike,
            iconSize: _sizeIcon,
          ),
        ),
        // Container(
        //   padding: EdgeInsets.all(0),
        //   child: IconButton(
        //     icon: (_rating >= 3
        //         ? Icon(
        //             Icons.star,
        //             size: _size,
        //           )
        //         : Icon(
        //             Icons.star_border,
        //             size: _size,
        //           )),
        //     color: Colors.red[500],
        //     onPressed: _setRatingAsThree,
        //     iconSize: _size,
        //   ),
        //),
      ],
    );
  }
}

// class LikedButton extends StatefulWidget {
//   @override
//   _LikedButtonState createState() => _LikedButtonState();
// }

// class _LikedButtonState extends State<LikedButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//         LikeButton(
//           size: buttonSize,
//           circleColor:
//               CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
//           bubblesColor: BubblesColor(
//             dotPrimaryColor: Color(0xff33b5e5),
//             dotSecondaryColor: Color(0xff0099cc),
//           ),
//           likeBuilder: (bool isLiked) {
//             return Icon(
//               Icons.home,
//               color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
//               size: buttonSize,
//             );
//           },
//           likeCount: 665,
//           countBuilder: (int count, bool isLiked, String text) {
//             var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
//             Widget result;
//             if (count == 0) {
//               result = Text(
//                 "love",
//                 style: TextStyle(color: color),
//               );
//             } else
//               result = Text(
//                 text,
//                 style: TextStyle(color: color),
//               );
//             return result;
//           },
//         ),

//     );
//   }
// }
