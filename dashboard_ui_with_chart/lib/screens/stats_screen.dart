import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:dashboard_ui_with_chart/config/palette.dart';
import 'package:dashboard_ui_with_chart/config/style.dart';
import 'package:dashboard_ui_with_chart/data/data.dart';
import 'package:dashboard_ui_with_chart/widgets/covid_bar_chart.dart';
import 'package:dashboard_ui_with_chart/widgets/custom_app_bar.dart';
import 'package:dashboard_ui_with_chart/widgets/stat_grid.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(size.height),
          _buildRegionTabBar(size.height),
          _buildStatsTabBar(size.height),
          SliverPadding(
            padding: EdgeInsets.all(20.0),
            sliver: SliverToBoxAdapter(
              child: StatGrid(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: CovidBarChart(covidCases: covidUSADailyNewCases),
            ),
          )
        ],
      ),
    );
  }

  SliverPadding _buildHeader(double screenHeight) {
    return SliverPadding(
      padding: EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Statistics',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25.0),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRegionTabBar(double screenHeight) {
    return SliverToBoxAdapter(
      child: DefaultTabController(
          length: 2,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(25.0)),
            child: TabBar(
              indicator: BubbleTabIndicator(
                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                  indicatorHeight: 40,
                  indicatorColor: Colors.white),
              labelStyle: Styles.tabTextStyle,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              tabs: <Widget>[
                Text(
                  'My Country',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                Text(
                  'Global',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ],
              onTap: (index) {},
            ),
          )),
    );
  }

  SliverPadding _buildStatsTabBar(double screenHeight) {
    return SliverPadding(
      padding: EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: <Widget>[
              Text(
                'Total',
              ),
              Text(
                'Today',
              ),
              Text(
                'Yesterday',
              ),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }
}
