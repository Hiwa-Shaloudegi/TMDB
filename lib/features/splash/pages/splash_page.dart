import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb/core/router/app_routes.dart';
import 'package:tmdb/features/splash/notifier/splash_controller.dart';
import 'package:tmdb/features/splash/notifier/splash_state.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(splashControllerProvider.notifier).init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ref.listen
    setRefListener();

    // ref.watch
    final splashState = ref.watch(splashControllerProvider);

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
            child: splashState.splashStatus == AsyncStatus.loading
                ? const Center(
                    child: SpinKitThreeBounce(
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  setRefListener() {
    ref.listen(
      splashControllerProvider,
      (previous, next) {
        if (next.splashStatus == AsyncStatus.success) {
          context.go(AppRoutes.main);
        }
      },
    );
  }
}
