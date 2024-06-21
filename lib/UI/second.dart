import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wizo/Bloc/wizo_bloc.dart';
import 'package:wizo/Repostory/Model%20Class/WizoModelSecond.dart';
import 'package:wizo/Repostory/Model%20Class/WizoReview.dart';

import '../Bloc/review_bloc.dart';
import '../Bloc/second_bloc.dart';

class Screen2 extends StatefulWidget {
  final String id;

  const Screen2({super.key, required this.id});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  int yourActiveIndex = 0;
  late WizoModelSecond seconddetails;
  late WizoReviewModel thirwedReview;

  @override
  void initState() {
    BlocProvider.of<SecondBloc>(context)
        .add(FetchWizoEventsecond(id: widget.id));

    BlocProvider.of<ReviewBloc>(context).add(FetchReviewEvent(id: widget.id));
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
              if (state is SecondBlocLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is SecondBlocerror) {
                return Center(
                  child: Text("Error"),
                );
              }
              if (state is SecondBlocloaded) {
                seconddetails =
                    BlocProvider.of<SecondBloc>(context).wizoModelSecond;
                return Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          color: Colors.white,
                          child: CarouselSlider.builder(
                            itemCount:
                                seconddetails.data!.productPhotos!.length,
                            itemBuilder: (BuildContext context, int itemIndex,
                                    int pageViewIndex) =>
                                Container(
                              child: Image.network(
                                seconddetails.data!.productPhotos![itemIndex]
                                    .toString(),
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
                                    padding:
                                        const EdgeInsets.only(left: 16, top: 2),
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
                            count: seconddetails.data!.productPhotos!.length,
                            effect: WormEffect(dotWidth: 7.w, dotHeight: 7.h),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 250.w,
                                height: 100.h,
                                child: ReadMoreText(
                                  seconddetails.data!.productTitle!.toString(),
                                  trimMode: TrimMode.Line,
                                  trimLines: 2,
                                  colorClickableText: Colors.pink,
                                  trimCollapsedText: 'Show more',
                                  trimExpandedText: 'Show less',
                                  moreStyle: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
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
                            ],
                          ),
                          // SizedBox(
                          //   height: 5.h,
                          // ),
                          Row(
                            children: [
                              Text(
                                seconddetails.data!.productPrice.toString(),
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500,
                                    height: 0.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                '\$300',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.black45,
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
                    SizedBox(
                      height: 15.h,
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
                              color: Color(0xFFFF7F37).withOpacity(0.7),
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
                              color: Color(0xFF8B8B8B).withOpacity(0.7),
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
                              color: Color(0xFF8204FF).withOpacity(0.7),
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
                              color: Color(0xFF133568).withOpacity(0.7),
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
                      padding:
                          const EdgeInsets.only(left: 27, right: 15, top: 8),
                      child: ReadMoreText(
                        seconddetails.data!.productDescription.toString(),
                        trimMode: TrimMode.Line,
                        trimLines: 2,
                        colorClickableText: Colors.pink,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        moreStyle: GoogleFonts.roboto(
                          textStyle: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 19.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
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
                                          width: 1.w,
                                          color: Color(0xFF8204FF)))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 17, left: 15),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.minimize_sharp,
                                      color: Color(0xFF8204FF),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 8),
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            color: Color(0xFF8204FF),
                                            fontSize: 25),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
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
                    ),
                    BlocBuilder<ReviewBloc, ReviewState>(
                      builder: (context, state) {
                        if (state is ReviewBlocLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is ReviewBlocerror) {
                          return Center(
                            child: Text("Error"),
                          );
                        }
                        if (state is ReviewBlocloaded) {
                          thirwedReview = BlocProvider.of<ReviewBloc>(context)
                              .wizoReviewModel;
                          return SizedBox(
                            height: 240* thirwedReview.data!.reviews!.length.toDouble(),
                            child: ListView.separated(
                              itemCount: thirwedReview.data!.reviews!.length,
                              scrollDirection: Axis.vertical,physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, position) {
                                return Container(
                                  decoration: ShapeDecoration(
                                      color: Colors.white38,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1.w,
                                              color: Colors.green.shade50))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 20.r,
                                              backgroundImage: NetworkImage(
                                                  thirwedReview
                                                      .data!
                                                      .reviews![position]
                                                      .reviewAuthorAvatar
                                                      .toString()),
                                            ),
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            Text(
                                              thirwedReview
                                                  .data!
                                                  .reviews![position]
                                                  .reviewAuthor
                                                  .toString(),
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 9.h,
                                        ),
                                        RatingBar.builder(
                                          itemSize: 19,
                                          initialRating: double.parse(
                                              thirwedReview
                                                  .data!
                                                  .reviews![position]
                                                  .reviewStarRating
                                                  .toString()),
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 1.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                        SizedBox(
                                          height: 9.h,
                                        ),
                                        Text(
                                          thirwedReview.data!.reviews![position]
                                              .reviewDate
                                              .toString(),
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Colors.pinkAccent,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        SizedBox(
                                          height: 9.h,
                                        ),
                                        ReadMoreText(
                                          thirwedReview.data!.reviews![position]
                                              .reviewComment
                                              .toString(),
                                          trimMode: TrimMode.Line,
                                          trimLines: 5,
                                          colorClickableText: Colors.black,
                                          trimCollapsedText: 'Show more',
                                          trimExpandedText: 'Show less',
                                          moreStyle: GoogleFonts.roboto(
                                            textStyle: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, position) {
                                return SizedBox(
                                  height: 20.h,
                                );
                              },
                            ),
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                  ],
                );
              } else {
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
