import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wizo/Bloc/wizo_bloc.dart';
import 'package:wizo/Repostory/Model%20Class/WizoModelSecond.dart';

import '../Bloc/second_bloc.dart';

class Screen2 extends StatefulWidget {
  final String id;
  const Screen2({super.key,required this.id});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  int yourActiveIndex = 0;
  late WizoModelSecond seconddetails;
  @override
  void initState() {
    BlocProvider.of<SecondBloc>(context).add(FetchWizoEventsecond(id:widget.id ));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<SecondBloc, SecondState>(
  builder: (context, state) {
      if(state is SecondBlocLoading){
        return Center(child: CircularProgressIndicator(),);
      }
      if(state is SecondBlocerror){
        return Center(child: Text("Error"),);
      }
      if(state is SecondBlocloaded) {
        seconddetails = BlocProvider
            .of<SecondBloc>(context)
            .wizoModelSecond;
        return Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.white,
                  child: CarouselSlider.builder(
                    itemCount:  seconddetails.data!.productPhotos!.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) =>
                        Container(
                          child: Image.network(
                            seconddetails.data!.productPhotos!.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                    options: CarouselOptions(
                      height: 400,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 3),
                      onPageChanged: (index, reason) {
                        setState(() {
                          yourActiveIndex = index;
                        });
                      },
                      autoPlayAnimationDuration:
                      Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 15.r,
                          child: Center(
                            child: CircleAvatar(
                              radius: 13.r,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 240.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Stack(
                        children: [
                          Icon(
                            Icons.notifications_outlined,
                            size: 28,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 2),
                            child: CircleAvatar(
                              backgroundColor: Color(0xFF8204FF),
                              radius: 5.r,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Icon(
                            Icons.favorite_border_outlined,
                            size: 28,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 17),
                          child: CircleAvatar(
                            backgroundColor: Color(0xFFE5DCFC),
                            radius: 10.r,
                            child: Text(
                              "1",
                              style: TextStyle(fontSize: 10.sp),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 380, left: 180),
                  child: AnimatedSmoothIndicator(
                    activeIndex: yourActiveIndex,
                    count:  seconddetails.data!.productPhotos!.length,
                    effect: WormEffect(dotWidth: 7.w, dotHeight: 7.h),
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 260.w,
                        child: Text(
                            seconddetails.data!.productTitle!.toString(),
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w700,
                                height: 0.h,
                              ),
                            )),
                      ),            Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Container(
                            width: 110.w,
                            height: 40.h,
                            decoration: ShapeDecoration(
                              color: Color(0x198204FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: 30.w,
                                      height: 30.h,
                                      child: Image.asset("assets/j.png")),
                                  Text(
                                    'On sale',
                                    style: TextStyle(
                                      color: Color(0xFF8204FF),
                                      fontSize: 17,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$155 / ',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            height: 0.h,
                          ),
                        ),
                      ),
                      Text(
                        '\$300',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            height: 0.h,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Container(
                    width: 80.w,
                    height: 40.h,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: ShapeDecoration(
                      color: Color(0x19FF8037),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.orange,
                          size: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text('4.2',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: Color(0xFF414141),
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    width: 80.w,
                    height: 40.h,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: ShapeDecoration(
                      color: Color(0x191F7DFD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.thumb_up_alt_rounded,
                          color: Colors.blue,
                          size: 25,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text('3.8',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: Color(0xFF414141),
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      '132  Reviews',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Color(0xFF414141),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 310, top: 15),
              child: Text('Color',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23, top: 8),
              child: Row(
                children: [
                  Container(
                    width: 29.w,
                    height: 29.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFF7F37),
                      shape: OvalBorder(),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    width: 29.w,
                    height: 29.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFF8B8B8B),
                      shape: OvalBorder(),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    width: 29.w,
                    height: 29.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFF8204FF),
                      shape: OvalBorder(),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    width: 29.w,
                    height: 29.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFF133568),
                      shape: OvalBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 248, top: 10),
              child: Text(
                'Description',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27, right: 15, top: 8),
              child: Text(
                'Our compact and foldable Bluetooth earbuds are renowned for their lightweight build, offering a convenient and portable solution for audiophiles on the go',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: Color(0xFF414141),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 227, top: 5),
              child: Text(
                'Specifications',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Model Name',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: Color(0xFF414141),
                            fontSize: 18.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Color',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: Color(0xFF414141),
                            fontSize: 18.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 120.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Boat Airdopes 121V2',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: Color(0xFF414141),
                            fontSize: 18.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Gray',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: Color(0xFF414141),
                            fontSize: 18.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 340,
              height: 67.h,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Container(
                      width: 114.w,
                      height: 48.h,
                      decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(
                                  width: 1.w, color: Color(0xFF8204FF)))),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 17, left: 15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.minimize_sharp,
                              color: Color(0xFF8204FF),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 10, top: 8),
                              child: Text(
                                "1",
                                style: TextStyle(
                                    color: Color(0xFF8204FF), fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 10, top: 10),
                              child: Icon(
                                Icons.add,
                                color: Color(0xFF8204FF),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    Container(
                      width: 114.w,
                      height: 48.h,
                      decoration: ShapeDecoration(
                          color: Color(0xFF8204FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 11),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'Buy now',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CircleAvatar(
                        radius: 25.r,
                        backgroundColor: Color(0xFFE5DCFC),
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: Color(0xFF8204FF),
                        ))
                  ],
                ),
              ),
            )
          ],
        );
      }else{
        return SizedBox();
      }
  },
),
        ),
      ),
    );
  }
}

// GoogleFonts.roboto(
//  textStyle:
