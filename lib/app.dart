// Copyright 2022 The FlutterCandies author. All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the
// LICENSE file.

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';

import 'exports.dart';
import 'internals/navigator_observer.dart';
import 'routes/ledger_route.dart';

class LedgerApp extends StatefulWidget {
  const LedgerApp({super.key});

  @override
  State<LedgerApp> createState() => LedgerAppState();
}

class LedgerAppState extends State<LedgerApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildOKToast({required Widget child}) {
    return OKToast(
      duration: const Duration(seconds: 3),
      position: ToastPosition.bottom.copyWith(
        offset: -MediaQueryData.fromWindow(ui.window).size.height / 12,
      ),
      radius: 5,
      child: child,
    );
  }

  Widget _buildAnnotatedRegion(BuildContext context, Widget child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.brightness.isDark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: child,
    );
  }

  Widget _buildBottomPaddingVerticalShield(BuildContext context) {
    return PositionedDirectional(
      start: 0,
      end: 0,
      bottom: 0,
      height: MediaQuery.of(context).padding.bottom,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onVerticalDragStart: (_) {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildOKToast(
      child: MaterialApp(
        title: 'Ledger',
        theme: ThemeData(
          primarySwatch: themeColorLight.swatch,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: themeColorLight.swatch,
        ),
        initialRoute: Routes.splashPage.name,
        navigatorKey: Ledger.navigatorKey,
        navigatorObservers: <NavigatorObserver>[
          Ledger.routeObserver,
          LedgerNavigatorObserver(),
        ],
        onGenerateRoute: (RouteSettings settings) => onGenerateRoute(
          settings: settings,
          getRouteSettings: getRouteSettings,
          notFoundPageBuilder: () => Container(
            alignment: Alignment.center,
            color: Colors.black,
            child: Text(
              '${settings.name ?? 'Unknown'} route not found.',
              style: const TextStyle(color: Colors.white, inherit: false),
            ),
          ),
        ),
        localizationsDelegates: const <LocalizationsDelegate>[
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const <Locale>[Locale('zh')],
        builder: (BuildContext context, Widget? child) => Stack(
          children: <Widget>[
            _buildAnnotatedRegion(context, child!),
            _buildBottomPaddingVerticalShield(context),
          ],
        ),
      ),
    );
  }
}
