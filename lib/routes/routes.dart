import 'package:go_router/go_router.dart';
import 'package:note_pad/view/screens/add_edit/add_edit.dart';
import 'package:note_pad/view/screens/home.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: '/addscreen',
    builder: (context, state) => AddOrEditScreen(),
  )
]);
