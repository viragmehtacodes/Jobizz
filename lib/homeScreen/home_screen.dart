// ignore_for_file: unused_field, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../modals/data/data_model.dart';
import './widgets/home_screen_app_bar.dart';
import './widgets/near_by_job_section.dart';

class HomeScreenMain extends StatefulWidget {
  const HomeScreenMain({super.key});

  @override
  State<HomeScreenMain> createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<HomeScreenMain>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<double> _appBarAnimation;
  late final Animation<double> _headerAnimation;
  late final Animation<double> _popularJobAnimation;
  late final Animation<double> _nearByJobAnimation;
  late List<DataModel> data;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _appBarAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.0,
        0.4,
        curve: Curves.decelerate,
      ),
    );

    _headerAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.1,
        0.6,
        curve: Curves.decelerate,
      ),
    );

    _popularJobAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.2,
        0.8,
        curve: Curves.decelerate,
      ),
    );

    _nearByJobAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.3,
        1.0,
        curve: Curves.decelerate,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: Offset(
                          0,
                          _size.height * (1 - _appBarAnimation.value),
                        ),
                        child: const HomeScreenAppBar(),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Find your Dream\nJob Today',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Transform.translate(
                        offset: Offset(
                          0,
                          _size.height * (1 - _nearByJobAnimation.value),
                        ),
                        child: ApplyJobSection(size: _size),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
