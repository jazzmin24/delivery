import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/dimentions.dart';
import 'package:delivery/widgets/app_column.dart';
import 'package:delivery/widgets/big_text.dart';
import 'package:delivery/widgets/icon_and_text_widget.dart';
import 'package:delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(); //viewport isnt working
  //used taaki next jo bhi slide hogi visible itna percent appear hoga at current slide

  //for scaling up and down while scrolling the size of next slide increases or decreases
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimentions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      //page controller gives page value
      setState(() {
        //set state is used taaki jasa ki pta lgega new page aaya to state chnge
        _currPageValue = pageController.page!;
        //to get current page value
        //print('current value is ' + _currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    //to keep the memory as small as possible
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        Container(
          //color: Colors.red,     //for basic debugging ki kon si height acquire ki h
          height: Dimentions.pageView,
          //scrollable list that works page by page.
          child: PageView.builder(
              controller: PageController(viewportFraction: 0.85),
              itemCount: 5,
              itemBuilder: (context, position) {
                //postion starts from zero and enda at 4
                return _buildPageItem(position);
              }),
        ),
        //dots
        new DotsIndicator(
          dotsCount: 5,
          //position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        //popular text
        SizedBox(
          width: Dimentions.width30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimentions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(
                width: Dimentions.widtht10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimentions.widtht10,
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 2),
                  child: SmallText(text: 'Food pairing')),
            ],
          ),
        ),
        //list of food and images
        ListView.builder(
            //when we want to create a list recursively without writing code again and again then ListView.builder is used instead of ListView.  ListView.builder creates a scrollable, linear array of widgets.
            // shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            //taaki page view aur list view sath m scroll ho in case of always scrollable sathm scroll ni hora
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimentions.width20,
                    right: Dimentions.width20,
                    bottom: Dimentions.height10),
                child: Row(
                  children: [
                    //image section
                    Container(
                      height: Dimentions.listViewImgSize,
                      width: Dimentions.listViewImgSize,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimentions.radius20),
                        color: Color.fromARGB(255, 235, 229, 211),
                        // Colors.white38,
                        // image: DecorationImage(
                        //   fit: BoxFit.cover,
                        //   image: AssetImage('')
                        // ),
                      ),
                    ),
                    //text section
                    Expanded(
                      //bacha hua sara space aquire kr le
                      child: Container(
                        height: Dimentions.pageViewTextContainer,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimentions.radius20),
                              bottomRight: Radius.circular(Dimentions.radius20),
                            ),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimentions.widtht10,
                              right: Dimentions.widtht10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(text: 'Nutritious food meal in China'),
                              SizedBox(
                                height: Dimentions.height10,
                              ),
                              SmallText(text: 'With chinese characteristics'),
                              SizedBox(
                                height: Dimentions.height10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  //since we are using these icons again and again so lets make it a widget
                                  IconAndTextWidget(
                                      icon: Icons.circle_sharp,
                                      text: 'Normal',
                                      iconColor: AppColors.iconColor1),

                                  IconAndTextWidget(
                                      icon: Icons.location_on,
                                      text: '1.7 km',
                                      iconColor: AppColors.mainColor),

                                  IconAndTextWidget(
                                      icon: Icons.access_time_rounded,
                                      text: '32 min',
                                      iconColor: AppColors.iconColor2),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    //Matrix4 is an api from flutter that is used for scaling up and down
    //provides easy ways to do transformations such as translation, scaling, and rotation,
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      //condition for next slide
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    ;

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimentions.pageViewContainer,
            //no need kyuki apna parent widget ki hi height its taking
            //but jb it is wrapped in stack tb le lega ye height
            margin: EdgeInsets.only(
                left: Dimentions.widtht10, right: Dimentions.widtht10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimentions.radius30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              //by the tym image is loaded as network image toh ye color rhega
              // image:
              //     DecorationImage(fit: BoxFit.cover, image: AssetImage(''))
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimentions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimentions.width30,
                  right: Dimentions.width30,
                  bottom: Dimentions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimentions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0, //shade of blurness
                      offset: Offset(0,
                          5), //implies x axis pr no change y axis pr 5 pixel downwards
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    )
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimentions.height15, left: 15, right: 15),
                child: AppColumn(
                  text: 'Chinese Side',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
