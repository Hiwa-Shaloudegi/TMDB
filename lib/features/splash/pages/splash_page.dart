import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb/common/widgets/dot_loading.dart';
import 'package:tmdb/core/router/app_routes.dart';
import 'package:tmdb/features/splash/cubit/splash_cubit.dart';
import 'package:tmdb/features/splash/cubit/splash_state.dart';
import 'package:tmdb/features/splash/cubit/splash_status.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SvgPicture.asset('assets/images/tmdb_logo.svg'),
          ),
          Positioned(
            bottom: 32,
            right: 0,
            left: 0,
            child: BlocConsumer<SplashCubit, SplashState>(
              listener: (context, state) {
                if (state.initStatus is InitSuccess) {
                  context.go(AppRoutes.main);
                }
              },
              builder: (context, state) {
                if (state.initStatus is InitLoading) {
                  return const Center(
                    child: DotLoading(),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
