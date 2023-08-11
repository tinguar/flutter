import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:web_responsive_ui/screens/home/home_screen.dart';
import '../../screens/views/privacy_policy/privacy_policy.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => const HomeScreen(),
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        Future.delayed(const Duration(seconds: 2), () {
          if (kIsWeb) {
            MetaSEO meta = MetaSEO();

            meta.author(author: 'Gabriel Codigo');
            meta.description(
                description:
                    'Consultoría y desarrollo de aplicaciones móviles, web, tiendas online, portales educativos y proyectos.');
            meta.keywords(
                keywords: 'Gabriel Codigo, Flutter, Dart, SEO, Meta, Web');
          }
        });
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/politicas',
      builder: (BuildContext context, GoRouterState state) {
        Future.delayed(const Duration(seconds: 2), () {
          if (kIsWeb) {
            MetaSEO meta = MetaSEO();

            meta.author(author: 'Gabriel Codigo');
            meta.description(
                description:
                    'Aquí podrás ver nuestras políticas y devoluciones');
            meta.keywords(keywords: 'Gabriel Codigo, Politicas, Devoluciones');
          }
        });

        return const PrivacyPolicy();
      },
    ),
  ],
);
