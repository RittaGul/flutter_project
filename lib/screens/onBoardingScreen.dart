import '../toolsUtilites.dart';
import 'accountScreen.dart';
import 'package:flutter/material.dart';

//ليست من نوع الاونبوردينغ موديل اللي انشأتها بكلاسها
List<OnBoardingModel> sliderData = [
  OnBoardingModel(
      "assets/images/1.png", "Do You Searching About Clothes Like You ?"),
  OnBoardingModel("assets/images/2.png", "Look To My Application"),
  OnBoardingModel("assets/images/3.png", "IT'S HEREE !!!"),
];

//هي الستاتفول ويجيد
class OnBoardingPage extends StatefulWidget {


  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  //متغير مكان ما بيبدأ الاندكس يعد لحتى اعرف بأنو صفحة
  int currentIndex = 0;
  //لمعرفة اذا وصل للاخر او لا
  bool atEnd = false;
  PageController? _pageController;
  @override
  //اول دالة ح تشتغل استدعاء جميع الصفحات بدون بوتون
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //الفلاكسبل بتجي مع التشيلد دغري و منضيفها لحتى اذا بدنا نقسم كل قسم ادي ياخد تلت نص وهيك
        Flexible(
          //تقليب الصفحات
          child: PageView.builder(
            itemCount: sliderData.length,
            controller: _pageController,
            onPageChanged: (index) {
              //لحتى بس يوصل ع اخر صفحة يغير النص

              if (index == (sliderData.length - 1)) {
                setState(() {
                  atEnd = true;
                  currentIndex = index;
                });
              } else {
                setState(() {
                  atEnd = false;
                  currentIndex = index;
                });
              }
            },
            itemBuilder: (context, index) {
              return Scaffold(
                //لون االخلفية
                backgroundColor: Toolsutilites.mainColor,
                appBar: AppBar(
                  //لحتى يصير لون الاب بار شفاف
                  backgroundColor: Colors.transparent,
                  //لحتى نخفي الشادو
                  elevation: 0,
                  //الاكشن اللي عاليمين والليدينغ اللي عاليسار
                  actions: [
                    RaisedButton(
                      //معلومات البوتونات
                      onPressed: () {},
                      color: Colors.transparent,
                      elevation: 0,
                      child: atEnd
                          ? InkWell(
                              onTap: () {
                                //لتروح ع غير صفحة
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AccountPage()));
                              },
                              child: Text(
                                //معلومات النص
                                "Let's Create Account",
                                style: TextStyle(
                                    color: Toolsutilites.whiteColor,
                                    fontSize: 17),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                //تروح ع غير صفحة
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AccountPage()));
                              },
                              child: Text(
                                //معلومات النص
                                "skip",
                                style: TextStyle(
                                    color: Toolsutilites.whiteColor,
                                    fontSize: 17),
                              ),
                            ),
                    ),
                  ],
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //نادينا للوجدات كلن
                    _slideImage(),
                    _headLine(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: _drawDots(sliderData.length),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _slideImage() {
    //وجد تبع الصور
    return Container(
      width: 800,
      height: 330,
      decoration: BoxDecoration(
          color: Toolsutilites.whiteColor,
          shape: BoxShape.circle,
          image: DecorationImage(
              //لحتى ياخد الصور من فوق
              image: ExactAssetImage(sliderData[currentIndex].image),
              fit: BoxFit.cover)),
    );
  }

  Widget _headLine() {
    //وجد تبع النص
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        //لياخد النصوص من فوق
        sliderData[currentIndex].title,
        style: TextStyle(
            color: Toolsutilites.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }

//تصميم النقاط تبع التلاتة
  List<Widget> _drawDots(int length) {
    List<Widget> widgets = [];
    for (int index = 0; index < length; index++) {
      widgets.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            //درجة التدوير تبع الدائرة
            borderRadius: BorderRadius.circular(20),
            //لتغيير لون النقطة حسب الاختيار
            color: (index == currentIndex)
                ? Toolsutilites.secondColor
                : Toolsutilites.whiteColor,
          ),
        ),
      ));
    }

    return widgets;
  }
}

class OnBoardingModel {
  String? _image;
  String? _title;
  OnBoardingModel(this._image, this._title);
  String get image => _image!;
  String get title => _title!;
}
