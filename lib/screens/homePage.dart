import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Model extends ChangeNotifier {
  var first = 0;
  var second = 0;

  void inc1(){
    first += 1;
    notifyListeners();
  }
  void inc2(){
    second += 1;
    notifyListeners();
  }

}
class ExampleWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (_) => Model(),
    child: const HomePage(),
  );
}


class HomePage extends StatelessWidget {
  const HomePage({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final state = context.read<Model>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                _First(),
                SizedBox(width: 150,),
                _Second()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: state.inc1, child: const Text('+')),
                const SizedBox(width: 100,),
                ElevatedButton(onPressed: state.inc2, child: const Text('+')),
              ],
            )
          ],
        ),
      ),
    );
  }
}


class _First extends StatelessWidget{
  const _First({Key? key,}) : super (key: key);

  @override
  Widget build(BuildContext context){
    final value = context.select((Model value) => value.first);
    return Text('$value', style: const TextStyle(fontSize: 30),);
  }
}

class _Second extends StatelessWidget{
  const _Second({Key? key,}) : super (key: key);

  @override
  Widget build(BuildContext context){
    final value = context.select((Model value) => value.second);
    return Text('$value', style: const TextStyle(fontSize: 30),);
  }
}









// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
//
// class Model extends ChangeNotifier {
//   final int first;
//   final int second;
//
//   void inc1(){
//     first += 1;
//     notifyListeners();
//   }
//   void inc2(){
//     second += 1;
//     notifyListeners();
//   }
// }
//
//
// class ExampleWidget extends StatelessWidget{
//   const ExampleWidget({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) => ChangeNotifierProvider(
//     create: (context) => Model(),
//     child: HomePage(),
//   );
// }
//
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key,}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     final model = context.read<Model>();
//
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 _First(),
//                 SizedBox(width: 150,),
//                 _Second()
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(onPressed: model.inc1, child: const Text('+')),
//                 const SizedBox(width: 100,),
//                 ElevatedButton(onPressed: model.inc2, child: const Text('+')),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// class _First extends StatelessWidget{
//   const _First({Key? key,}) : super (key: key);
//
//   @override
//   Widget build(BuildContext context){
//     final value = context.watch<Model>().first;
//     return Text('$value', style: const TextStyle(fontSize: 30),);
//   }
// }
//
// class _Second extends StatelessWidget{
//   const _Second({Key? key,}) : super (key: key);
//
//   @override
//   Widget build(BuildContext context){
//     final value = context.watch<Model>().second;
//     return Text('$value', style: const TextStyle(fontSize: 30),);
//   }
// }
//




// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
//
// class Model {
//   var first = 0;
//   var second = 0;
//
//   Model({
//     required this.first,
//     required this.second
//   });
//
//   Model copyWith({
//     int? first,
//     int? second,
//   }){
//     return Model(
//       first: first ?? this.first,
//       second: second ?? this.second
//     );
//   }
//
//   @override
//   String toString() => 'Model(first: $first, second: $second)';
//
//   @override
//   bool operator == (Object other){
//     if(identical(this, other)) return true;
//
//     return other is Model && other.first == first && other.second == second;
//   }
//
//   @override
//   int get hashCode => first.hashCode ^ second.hashCode;
//
// }
//
//
// class ExampleWidget extends StatefulWidget{
//   const ExampleWidget({Key? key}) : super(key: key);
//
//   @override
//   State<ExampleWidget> createState() => _ExampleWidgetState();
// }
//
// class _ExampleWidgetState extends State<ExampleWidget> {
//   var model = Model(first: 0, second: 0);
//
//   void inc1(){
//     model = model.copyWith(first: model.first+1);
//     setState((){});
//   }
//   void inc2(){
//     model = model.copyWith(second: model.second+1);
//     setState((){});
//   }
//
//   @override
//   Widget build(BuildContext context) => MultiProvider(providers: [
//       Provider.value(value: this,),
//       Provider.value(value: model)
//     ],
//     child: const HomePage(),
//   );
// }
//
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key,}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     final state = context.read<_ExampleWidgetState>();
//
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 _First(),
//                 SizedBox(width: 150,),
//                 _Second()
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(onPressed: state.inc1, child: const Text('+')),
//                 const SizedBox(width: 100,),
//                 ElevatedButton(onPressed: state.inc2, child: const Text('+')),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// class _First extends StatelessWidget{
//   const _First({Key? key,}) : super (key: key);
//
//   @override
//   Widget build(BuildContext context){
//     final value = context.select((Model value) => value.first);
//     return Text('$value', style: const TextStyle(fontSize: 30),);
//   }
// }
//
// class _Second extends StatelessWidget{
//   const _Second({Key? key,}) : super (key: key);
//
//   @override
//   Widget build(BuildContext context){
//     final value = context.select((Model value) => value.second);
//     return Text('$value', style: const TextStyle(fontSize: 30),);
//   }
// }
//
//
//
//
//
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// //
// //
// // class Model extends ChangeNotifier {
// //   var first = 0;
// //   var second = 0;
// //
// //   void inc1(){
// //     first += 1;
// //     notifyListeners();
// //   }
// //   void inc2(){
// //     second += 1;
// //     notifyListeners();
// //   }
// // }
// //
// //
// // class ExampleWidget extends StatelessWidget{
// //   const ExampleWidget({Key? key}) : super(key: key);
// //
// //
// //   @override
// //   Widget build(BuildContext context) => ChangeNotifierProvider(
// //     create: (context) => Model(),
// //     child: HomePage(),
// //   );
// // }
// //
// //
// // class HomePage extends StatelessWidget {
// //   const HomePage({Key? key,}) : super(key: key);
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final model = context.read<Model>();
// //
// //     return Scaffold(
// //       body: SafeArea(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: const [
// //                 _First(),
// //                 SizedBox(width: 150,),
// //                 _Second()
// //               ],
// //             ),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 ElevatedButton(onPressed: model.inc1, child: const Text('+')),
// //                 const SizedBox(width: 100,),
// //                 ElevatedButton(onPressed: model.inc2, child: const Text('+')),
// //               ],
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// //
// // class _First extends StatelessWidget{
// //   const _First({Key? key,}) : super (key: key);
// //
// //   @override
// //   Widget build(BuildContext context){
// //     final value = context.watch<Model>().first;
// //     return Text('$value', style: const TextStyle(fontSize: 30),);
// //   }
// // }
// //
// // class _Second extends StatelessWidget{
// //   const _Second({Key? key,}) : super (key: key);
// //
// //   @override
// //   Widget build(BuildContext context){
// //     final value = context.watch<Model>().second;
// //     return Text('$value', style: const TextStyle(fontSize: 30),);
// //   }
// // }
// //
