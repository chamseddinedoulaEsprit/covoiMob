import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : Welcome0Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : Welcome0Widget(),
        ),
        FFRoute(
          name: HomePageWidget.routeName,
          path: HomePageWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'HomePage')
              : HomePageWidget(),
        ),
        FFRoute(
          name: PaimentReservationWidget.routeName,
          path: PaimentReservationWidget.routePath,
          builder: (context, params) => PaimentReservationWidget(),
        ),
        FFRoute(
          name: PaimentConfirmationWidget.routeName,
          path: PaimentConfirmationWidget.routePath,
          builder: (context, params) => PaimentConfirmationWidget(),
        ),
        FFRoute(
          name: DetailCovoiturageWidget.routeName,
          path: DetailCovoiturageWidget.routePath,
          builder: (context, params) => DetailCovoiturageWidget(
            description: params.getParam(
              'description',
              ParamType.String,
            ),
            image: params.getParam(
              'image',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SigninWidget.routeName,
          path: SigninWidget.routePath,
          builder: (context, params) => SigninWidget(),
        ),
        FFRoute(
          name: SignupWidget.routeName,
          path: SignupWidget.routePath,
          builder: (context, params) => SignupWidget(),
        ),
        FFRoute(
          name: ListeVehiculesWidget.routeName,
          path: ListeVehiculesWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Liste_vehicules')
              : NavBarPage(
                  initialPage: 'Liste_vehicules',
                  page: ListeVehiculesWidget(),
                ),
        ),
        FFRoute(
          name: ListeResVehiculeWidget.routeName,
          path: ListeResVehiculeWidget.routePath,
          asyncParams: {
            'vehicule': getDoc(['Vehicule'], VehiculeRecord.fromSnapshot),
          },
          builder: (context, params) => ListeResVehiculeWidget(
            vehicule: params.getParam(
              'vehicule',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AjouterAvisWidget.routeName,
          path: AjouterAvisWidget.routePath,
          builder: (context, params) => AjouterAvisWidget(
            idConducteur: params.getParam(
              'idConducteur',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
            ),
          ),
        ),
        FFRoute(
          name: AjouterArticleWidget.routeName,
          path: AjouterArticleWidget.routePath,
          asyncParams: {
            'cat': getDoc(['Categories'], CategoriesRecord.fromSnapshot),
          },
          builder: (context, params) => AjouterArticleWidget(
            cat: params.getParam(
              'cat',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AjouterCatgoriesWidget.routeName,
          path: AjouterCatgoriesWidget.routePath,
          builder: (context, params) => AjouterCatgoriesWidget(),
        ),
        FFRoute(
          name: ListeArticlesWidget.routeName,
          path: ListeArticlesWidget.routePath,
          builder: (context, params) => ListeArticlesWidget(),
        ),
        FFRoute(
          name: ListeCatgoriesWidget.routeName,
          path: ListeCatgoriesWidget.routePath,
          builder: (context, params) => ListeCatgoriesWidget(),
        ),
        FFRoute(
          name: EventWidget.routeName,
          path: EventWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'EVENT')
              : NavBarPage(
                  initialPage: 'EVENT',
                  page: EventWidget(),
                ),
        ),
        FFRoute(
          name: ListeCatgoriessWidget.routeName,
          path: ListeCatgoriessWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ListeCatgoriess')
              : ListeCatgoriessWidget(),
        ),
        FFRoute(
          name: ListeResEventWidget.routeName,
          path: ListeResEventWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'liste_res_event')
              : NavBarPage(
                  initialPage: 'liste_res_event',
                  page: ListeResEventWidget(),
                ),
        ),
        FFRoute(
          name: ResEventWidget.routeName,
          path: ResEventWidget.routePath,
          asyncParams: {
            'event': getDoc(['Event'], EventRecord.fromSnapshot),
          },
          builder: (context, params) => ResEventWidget(
            event: params.getParam(
              'event',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AjouterVehAdminWidget.routeName,
          path: AjouterVehAdminWidget.routePath,
          builder: (context, params) => AjouterVehAdminWidget(),
        ),
        FFRoute(
          name: AjoutEventWidget.routeName,
          path: AjoutEventWidget.routePath,
          builder: (context, params) => AjoutEventWidget(),
        ),
        FFRoute(
          name: ModifierarticleWidget.routeName,
          path: ModifierarticleWidget.routePath,
          asyncParams: {
            'idarticle': getDoc(['Article'], ArticleRecord.fromSnapshot),
          },
          builder: (context, params) => ModifierarticleWidget(
            idarticle: params.getParam(
              'idarticle',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ModifierCategorieWidget.routeName,
          path: ModifierCategorieWidget.routePath,
          asyncParams: {
            'ok': getDoc(['Categories'], CategoriesRecord.fromSnapshot),
          },
          builder: (context, params) => ModifierCategorieWidget(
            ok: params.getParam(
              'ok',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ListeArticlessCopyWidget.routeName,
          path: ListeArticlessCopyWidget.routePath,
          asyncParams: {
            'cat': getDoc(['Categories'], CategoriesRecord.fromSnapshot),
          },
          builder: (context, params) => ListeArticlessCopyWidget(
            cat: params.getParam(
              'cat',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AjouterOffreWidget.routeName,
          path: AjouterOffreWidget.routePath,
          builder: (context, params) => AjouterOffreWidget(),
        ),
        FFRoute(
          name: DrawerWidget.routeName,
          path: DrawerWidget.routePath,
          builder: (context, params) => DrawerWidget(),
        ),
        FFRoute(
          name: AbonnementWidget.routeName,
          path: AbonnementWidget.routePath,
          builder: (context, params) => AbonnementWidget(),
        ),
        FFRoute(
          name: ListAbnWidget.routeName,
          path: ListAbnWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'list_abn')
              : ListAbnWidget(),
        ),
        FFRoute(
          name: AjouterAbonnementWidget.routeName,
          path: AjouterAbonnementWidget.routePath,
          builder: (context, params) => AjouterAbonnementWidget(),
        ),
        FFRoute(
          name: PaimentWidget.routeName,
          path: PaimentWidget.routePath,
          builder: (context, params) => PaimentWidget(),
        ),
        FFRoute(
          name: PayerWidget.routeName,
          path: PayerWidget.routePath,
          asyncParams: {
            'abn': getDoc(
                ['ajouter_abonnement'], AjouterAbonnementRecord.fromSnapshot),
          },
          builder: (context, params) => PayerWidget(
            abn: params.getParam(
              'abn',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ConsulterAvisWidget.routeName,
          path: ConsulterAvisWidget.routePath,
          builder: (context, params) => ConsulterAvisWidget(
            userID: params.getParam(
              'userID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
            ),
          ),
        ),
        FFRoute(
          name: WelcomeWidget.routeName,
          path: WelcomeWidget.routePath,
          builder: (context, params) => WelcomeWidget(),
        ),
        FFRoute(
          name: Welcome0Widget.routeName,
          path: Welcome0Widget.routePath,
          builder: (context, params) => Welcome0Widget(),
        ),
        FFRoute(
          name: Welcome1Widget.routeName,
          path: Welcome1Widget.routePath,
          builder: (context, params) => Welcome1Widget(),
        ),
        FFRoute(
          name: Welcome2Widget.routeName,
          path: Welcome2Widget.routePath,
          builder: (context, params) => Welcome2Widget(),
        ),
        FFRoute(
          name: Welcome3Widget.routeName,
          path: Welcome3Widget.routePath,
          builder: (context, params) => Welcome3Widget(),
        ),
        FFRoute(
          name: ModofierEventWidget.routeName,
          path: ModofierEventWidget.routePath,
          asyncParams: {
            'event': getDoc(['Event'], EventRecord.fromSnapshot),
          },
          builder: (context, params) => ModofierEventWidget(
            event: params.getParam(
              'event',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: MapWidget.routeName,
          path: MapWidget.routePath,
          asyncParams: {
            'event': getDoc(['Event'], EventRecord.fromSnapshot),
          },
          builder: (context, params) => MapWidget(
            event: params.getParam(
              'event',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ModifierVehiculeWidget.routeName,
          path: ModifierVehiculeWidget.routePath,
          asyncParams: {
            'vehicule': getDoc(['Vehicule'], VehiculeRecord.fromSnapshot),
          },
          builder: (context, params) => ModifierVehiculeWidget(
            vehicule: params.getParam(
              'vehicule',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ResVehiculeListWidget.routeName,
          path: ResVehiculeListWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ResVehiculeList')
              : NavBarPage(
                  initialPage: 'ResVehiculeList',
                  page: ResVehiculeListWidget(),
                ),
        ),
        FFRoute(
          name: HomePageGestionWidget.routeName,
          path: HomePageGestionWidget.routePath,
          builder: (context, params) => HomePageGestionWidget(),
        ),
        FFRoute(
          name: ModifierOffreWidget.routeName,
          path: ModifierOffreWidget.routePath,
          builder: (context, params) => ModifierOffreWidget(
            offre: params.getParam(
              'offre',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['offreCovoiturage'],
            ),
          ),
        ),
        FFRoute(
          name: DetailCovoiturageGestionWidget.routeName,
          path: DetailCovoiturageGestionWidget.routePath,
          builder: (context, params) => DetailCovoiturageGestionWidget(
            description: params.getParam(
              'description',
              ParamType.String,
            ),
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            covoiturageImg: params.getParam(
              'covoiturageImg',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['offreCovoiturage'],
            ),
          ),
        ),
        FFRoute(
          name: WikiResultWidget.routeName,
          path: WikiResultWidget.routePath,
          builder: (context, params) => WikiResultWidget(
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            content: params.getParam(
              'content',
              ParamType.String,
            ),
            link: params.getParam(
              'link',
              ParamType.String,
            ),
            nom: params.getParam(
              'nom',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MesEvaluationsWidget.routeName,
          path: MesEvaluationsWidget.routePath,
          builder: (context, params) => MesEvaluationsWidget(),
        ),
        FFRoute(
          name: ListeRservationsCondWidget.routeName,
          path: ListeRservationsCondWidget.routePath,
          builder: (context, params) => ListeRservationsCondWidget(),
        ),
        FFRoute(
          name: MesEvaluationsPassagerWidget.routeName,
          path: MesEvaluationsPassagerWidget.routePath,
          builder: (context, params) => MesEvaluationsPassagerWidget(),
        ),
        FFRoute(
          name: UpdateAbnWidget.routeName,
          path: UpdateAbnWidget.routePath,
          asyncParams: {
            'abn': getDoc(
                ['ajouter_abonnement'], AjouterAbonnementRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateAbnWidget(
            abn: params.getParam(
              'abn',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ListCouponWidget.routeName,
          path: ListCouponWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'list_Coupon')
              : NavBarPage(
                  initialPage: 'list_Coupon',
                  page: ListCouponWidget(),
                ),
        ),
        FFRoute(
          name: AddCouponWidget.routeName,
          path: AddCouponWidget.routePath,
          builder: (context, params) => AddCouponWidget(),
        ),
        FFRoute(
          name: PasserpaymentWidget.routeName,
          path: PasserpaymentWidget.routePath,
          asyncParams: {
            'abn': getDoc(
                ['ajouter_abonnement'], AjouterAbonnementRecord.fromSnapshot),
          },
          builder: (context, params) => PasserpaymentWidget(
            abn: params.getParam(
              'abn',
              ParamType.Document,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/welcome0';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Image.asset(
                      'assets/images/covoi.jpg',
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
