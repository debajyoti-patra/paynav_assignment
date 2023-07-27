import 'package:flutter/material.dart';
import 'package:paynav_assignment/constants/colors.dart';
import 'package:paynav_assignment/constants/images.dart';
import 'package:paynav_assignment/data/userdata.dart';

import '../widgets/tab_widgets.dart';
import '../widgets/text_containers.dart';
import '../widgets/text_style.dart';
import '../widgets/user_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController controller;
  late ScrollController scrollController;
  int count = 0;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.5 + 100,
            child: Stack(
              children: [
                //background container
                Container(
                  height: size.height * 0.5 + 20,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors().blue1,
                          AppColors().blue2,
                        ],
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      )),
                  child: Stack(
                    children: [
                      //right first circle
                      Positioned(
                        top: 40,
                        right: -70,
                        child: Opacity(
                          opacity: 0.3,
                          child: CircleAvatar(
                            radius: 150,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors().purple3),
                            ),
                          ),
                        ),
                      ),
                      //left first circle
                      Positioned(
                        top: -70,
                        left: -70,
                        child: Opacity(
                          opacity: 0.8,
                          child: CircleAvatar(
                            radius: 200,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors().purple1,
                                    AppColors().purple2,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //top text and icons
                      Positioned(
                        top: 40,
                        left: 20,
                        right: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ImageIcon(
                                  AssetImage(
                                    Images().arrow,
                                  ),
                                  color: AppColors().white3,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  'Leader Board',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                //const ShowCustomDialoge();
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ShowCustomDialoge();
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'How it works',
                                    style: TextStyle(
                                      color: AppColors().white3,
                                    ),
                                  ),
                                  InkResponse(
                                    child: Image.asset(
                                      Images().settings,
                                      width: 30,
                                      height: 30,
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      //timeline of the app
                      Positioned(
                        top: 90,
                        left: 25,
                        right: 25,
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors().blue10,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            height: 42,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      count = 0;
                                    });
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: count == 0
                                          ? AppColors().white3
                                          : AppColors().blue10,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'This Week',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: count == 0
                                                ? Colors.black
                                                : AppColors().white3),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      count = 1;
                                    });
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: count == 1
                                          ? AppColors().white3
                                          : AppColors().blue10,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'This Month',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: count == 1
                                                ? Colors.black
                                                : AppColors().white3),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      count = 2;
                                    });
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: count == 2
                                          ? AppColors().white3
                                          : AppColors().blue10,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Last Month',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: count == 2
                                                ? Colors.black
                                                : AppColors().white3),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                      //right second circle
                      Positioned(
                        bottom: 40,
                        right: -30,
                        child: CircleAvatar(
                          radius: 130,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors().blue3,
                            ),
                          ),
                        ),
                      ),
                      //picture of top 1
                      Positioned(
                        // bottom: 40,
                        top: 150,
                        //left: 0,
                        right: 101,
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: 0.6,
                              child: Container(
                                height: 205,
                                width: 205,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors().blue5.withOpacity(0.8),
                                      AppColors().blue6.withOpacity(0.8),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Container(
                                    height: 150,
                                    width: 150,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 22.5,
                              left: 22.5,
                              child: Center(
                                child: Container(
                                  height: 165,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        Images().image1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      //picture of top 3
                      Positioned(
                        //bottom: 150,
                        top: 160,
                        //left: 0,
                        right: 10,
                        child: Column(
                          children: [
                            Text(
                              '3',
                              style: TextStyle(
                                color: AppColors().white3,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkResponse(
                              child: Image.asset(Images().polygonRed),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Stack(
                              children: [
                                Opacity(
                                  opacity: 0.2,
                                  child: Container(
                                    height: 108,
                                    width: 108,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          AppColors().white2,
                                          AppColors().blue2,
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 12,
                                  left: 13,
                                  child: Center(
                                    child: Container(
                                      height: 87,
                                      width: 83,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            Images().image3,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              '6260',
                              style: TextStyle(
                                  color: AppColors().white3.withOpacity(0.7),
                                  fontSize: 30),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Samvibhan singh',
                              style: TextStyle(
                                  color: AppColors().white3.withOpacity(0.7),
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      //picture of top 2
                      Positioned(
                        //bottom: 150,
                        top: 160,
                        //left: 0,
                        left: 10,
                        child: Column(
                          children: [
                            Text(
                              '2',
                              style: TextStyle(
                                color: AppColors().white3,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkResponse(
                              child: Image.asset(Images().polygonGreen),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Stack(
                              children: [
                                Opacity(
                                  opacity: 0.7,
                                  child: Container(
                                    height: 108,
                                    width: 108,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          AppColors().blue7,
                                          AppColors().blue8,
                                          AppColors().blue9
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: Center(
                                    child: Container(
                                      height: 88,
                                      width: 84,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            Images().image2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              '7260',
                              style: TextStyle(
                                  color: AppColors().white3.withOpacity(0.7),
                                  fontSize: 30),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Natsha Chowdary',
                              style: TextStyle(
                                  color: AppColors().white3.withOpacity(0.7),
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      //crown of 1st score
                      Positioned(
                        top: 130,
                        right: 179,
                        child: InkResponse(
                          child: Image.asset(
                            Images().crown,
                          ),
                        ),
                      ),

                      //score and name of 1st score
                      Positioned(
                        bottom: 50,
                        left: 170,
                        right: 0,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Text(
                                  '8370',
                                  style: TextStyle(
                                      color:
                                          AppColors().white3.withOpacity(0.7),
                                      fontSize: 35),
                                ),
                                Text(
                                  'Raja Reddy',
                                  style: TextStyle(
                                      color:
                                          AppColors().white3.withOpacity(0.7),
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            Positioned(
                                left: 70,
                                bottom: 10,
                                child: InkResponse(
                                  child: Image.asset(
                                    Images().rightIcon,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //details of the user
                Positioned(
                  top: 430,
                  left: 20,
                  right: 20,
                  child: UserDetails(
                    isUser: true,
                    name: 'Lalit Thakre',
                    score: '2130',
                    rank: 41,
                    image: Images().image6,
                  ),
                ),
                Positioned(
                  top: 480,
                  left: 113,
                  right: 113,
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    height: 45,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors().white3,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.black26,
                          spreadRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      height: 20,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors().blue10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My status & awadrs',
                            style: TextStyle(
                              color: AppColors().white3,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors().white3,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                    width: size.width - 40,
                    child: ListView.builder(
                      controller: scrollController,
                      padding: const EdgeInsets.only(top: 4),
                      shrinkWrap: true,
                      itemCount: UserData.userNames.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return UserDetails(
                          name: UserData.userNames[index],
                          score: UserData.userScores[index],
                          rank: index + 4,
                          image: UserData.userPics[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TabBarWidget(
                    controller: controller,
                    scrollcontroller: scrollController,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  final ScrollController scrollcontroller;
  const TabBarWidget({
    super.key,
    required this.controller,
    required this.scrollcontroller,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      //margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              // padding: EdgeInsets.symmetric(horizontal: 0),
              indicator: TabIndicator(),
              unselectedLabelColor: AppColors().black1,
              labelColor: AppColors().blue11,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              controller: controller,
              tabs: const [
                Tab(
                  child: Text(
                    'Prizes',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    'Points',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            height: 2,
            width: double.maxFinite,
            color: AppColors().blue11,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            height: 2300,
            child: TabBarView(
              controller: controller,
              children: [
                FirstTabView(
                  size: size,
                  controller: scrollcontroller,
                ),
                SecondTabView(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SecondTabView extends StatelessWidget {
  const SecondTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const SubtitleText(title: 'Earn more points to level up'),
        const SizedBox(
          height: 50,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BoldText(title: 'Rank'),
            BoldText(title: 'Prizes'),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        const BlueText(title: 'Only once'),
        const DataText(
          title: 'Joined Paynav',
          score: '50',
        ),
        const DataText(
          title: 'First Purchase',
          score: '250',
        ),
        const DataText(
          title: 'KYC',
          score: '50',
        ),
        const DataText(
          title: 'Account opened & Added Money',
          score: '50',
        ),
        const DataText(
          title: 'First Gold Purchase',
          score: '50',
        ),
        const DataText(
          title: 'First Voucher Purchase',
          score: '50',
        ),
        const DataText(title: 'First Direct Shoping', score: '50'),
        const DataText(
            title: 'Play "The legend of gold,car & the jet"', score: '50'),
        const DataText2(
          title: 'Add Money in Account through Bank transfer',
          score: '50',
          subTitle: '(Valid only once)',
        ),
        const DataText2(
          title: 'First Neo card Transaction',
          score: '50',
          subTitle: '(Comming soon*)',
        ),
        const DataText3(
          title: 'Neo card first offline Transaction',
          score: '50',
          subTitle: '(Comming soon*)',
        ),
        const SizedBox(
          height: 20,
        ),
        const BlueText(title: 'My Network'),
        const DataText2(
            title: 'Refer A Frend',
            score: '10',
            subTitle: '(After First successful transaction)'),
        const DataText3(
          title: 'Refer A Frend-on every fifth referal',
          score: '10',
          subTitle: '(Like 10th,15h,20th and so on..)',
        ),
        const SizedBox(
          height: 20,
        ),
        const BlueText(title: 'Once a day'),
        const DataText2(
          title: 'Highest gold purchase of the day',
          score: '100',
          subTitle: '(The amount should be highest of all users.)',
        ),
        const DataText2(
          title: 'Highest voucher purchase of the day',
          score: '150',
          subTitle: '(The amount should be highest of all users.)',
        ),
        const DataText3(
          title: 'Highest money added in the account for the day.',
          score: '100',
          subTitle:
              '(The amount should be highest of all the account holders.)',
        ),
        const SizedBox(
          height: 20,
        ),
        const BlueText(title: 'Unlimited'),
        const DataText2(
          title: 'Every time gold purchase',
          score: '1',
          subTitle: '(1 point for ₹20, 2 for ₹40 and so on.)',
        ),
        const DataText2(
          title: 'Every time voucher purchase',
          score: '10',
          subTitle: '(10 point for ₹50, 20 for ₹100 and so on.)',
        ),
        const DataText2(
          title: 'Every time money added to account',
          score: '1',
          subTitle: '(1 point for ₹50, 2 for ₹100 and so on.)',
        ),
        const DataText(title: 'Every time direct shoping', score: '10'),
        const DataText2(
          title: 'Every online transaction made with Neo card',
          score: '20',
          subTitle: '(Comming soon*)',
        ),
        const DataText3(
          title: 'Every offline transaction made with Neo card',
          score: '30',
          subTitle: '(Comming soon*)',
        ),
        const SizedBox(
          height: 20,
        ),
        const BlueText(title: 'Growth challenge'),
        const SubtitleText(
          title: '(Can be done multiple times)',
        ),
        const DataText2(
          title: '7 Days Gold Challenge',
          score: '50',
          subTitle: '7 Days contineous',
        ),
        const DataText2(
          title: '7 Days Voucher Challenge',
          score: '150',
          subTitle: '7 Days contineous',
        ),
        const DataText2(
          title: '7 Days Neo-Card Challenge',
          score: '100',
          subTitle: 'Comming soon*7 Days contineous',
        ),
        const DataText2(
          title: '30 Days Gold Challenge',
          score: '150',
          subTitle: 'Minimum amount ₹10*30 Days contineous',
        ),
        const DataText2(
          title: '30 Days Voucher Challenge',
          score: '100',
          subTitle: '30 Days contineous',
        ),
        const DataText3(
          title: '30 Days Neo-Card Challenge',
          score: '200',
          subTitle: 'Comming soon*30 Days contineous',
        ),
        const SizedBox(
          height: 50,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'There are also points on personalized',
            style: TextStyle(color: AppColors().blue4, fontSize: 17),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Challengs & Awards',
                style: TextStyle(color: AppColors().blue4, fontSize: 17),
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset(Images().arrowContainer)
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Align(
          alignment: Alignment.center,
          child: Image.asset(Images().bottomheart),
        )
      ],
    );
  }
}

class ShowCustomDialoge extends StatelessWidget {
  const ShowCustomDialoge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Dialog(
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      // surfaceTintColor: AppColors().black1,
      backgroundColor: Colors.transparent,
      child: dialogeContent(context, s),
    );
  }
}

dialogeContent(context, Size size) {
  return Container(
    margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.all(20),
    height: size.height / 2 - 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors().black2,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Stack(
      children: [
        InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              Images().cancel,
              height: 30,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors().white3.withOpacity(0.2)),
                  child: Image.asset(Images().settings),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'How It Works',
                  style: TextStyle(color: AppColors().white3),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors().white3,
                  radius: 2,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'At the bottom of the page you can access the',
                  style: TextStyle(
                    color: AppColors().white3,
                  ),
                )
              ],
            ),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text(
                'Prizes & Point system',
                style: TextStyle(
                  color: Colors.amber.shade700,
                ),
              ),
            ),
            const SizedBox(height: 20,),
             Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors().white3,
                  radius: 2,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'The point will be given as per the point system',
                  style: TextStyle(
                    color: AppColors().white3,
                  ),
                )
              ],
            ),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text(
                'and the prizes will be given as per the ranks achived.',
                style: TextStyle(
                  color: AppColors().white3,
                ),
              ),
            ),
            const SizedBox(height: 20,),
             Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors().white3,
                  radius: 2,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'You can see several personal &  public awards &',
                  style: TextStyle(
                    color: AppColors().white3,
                  ),
                )
              ],
            ),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text(
                'challenges that can be unlocked in',
                style: TextStyle(
                  color: AppColors().white3,
                ),
              ),
            ),
             const SizedBox(height: 5,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Text(
                    '"My Status and Awards"',
                    style: TextStyle(
                      color: Colors.amber.shade700,
                    ),
                  ),
                ),
                Text(
                  'Page',
                  style: TextStyle(
                    color: AppColors().white3,
                  ),
                )
              ],
            ),
             const SizedBox(height: 20,),
             Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors().white3,
                  radius: 2,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Points will be given to unlocked Awards & challengs',
                  style: TextStyle(
                    color: AppColors().white3,
                  ),
                )
              ],
            ),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text(
                'accepted & successfully completed.',
                style: TextStyle(
                  color: AppColors().white3,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
