import 'package:go_router/go_router.dart';
import 'package:note_pad/view/screens/add_edit_screen.dart';
import 'package:note_pad/view/screens/home_screen.dart';

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

