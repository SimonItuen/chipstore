import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StoryPreviewScreen extends StatefulWidget {
  const StoryPreviewScreen({Key? key}) : super(key: key);
  static final String routeName = '/story-preview';

  @override
  _StoryPreviewScreenState createState() => _StoryPreviewScreenState();
}

class _StoryPreviewScreenState extends State<StoryPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Stack(
            children: [
              Column(crossAxisAlignment:CrossAxisAlignment.stretch,children: [
        Expanded(
                child: Container(child: Image.asset('assets/images/demo/st1.jpg', fit: BoxFit.fitHeight,))),
        Container(
              margin: EdgeInsets.only(top:16, bottom: 34, left: 16, right: 16),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24)
              ),

              child: Center(child: Text('View details',style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600, fontSize: 14),)),
        )
      ]),
              Positioned(
                left: 0,
                  right: 0,
                  top: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, left: 12, right: 16),
                        child: Row(
                          children: [
                            for(int i=0; i<3; i++)
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: LinearProgressIndicator(backgroundColor: Colors.white.withOpacity(0.5), value: i==0?0.6:0.0, minHeight: 2,valueColor: i==0?AlwaysStoppedAnimation<Color>(Colors.white):AlwaysStoppedAnimation<Color>(Colors.white.withOpacity(0.5)),),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.close, color: Colors.white,),
                        ),
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}
