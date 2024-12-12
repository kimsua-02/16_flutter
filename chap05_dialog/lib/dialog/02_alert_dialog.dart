

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// class DialogTest2 extends StatelessWidget {
//   const DialogTest2({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: TextButton(onPressed: (){
//       showDialog(context: context,
//           builder: context){
//         return AlertDialog(
//           title: Text("Alert Dialog"),
//           content: Text("정말로 이 작업을 수행하겠는가?"),
//           actions: [
//             TextButton(onPressed: (){
//               Navigator.of(context).pop();
//             }, child: Text("취소")),
//             TextButton(onPressed: (){
//               Navigator.of(context).pop();
//             }, child: Text("확인")),
//           ],
//         });
//       }
//       }
//     }, child: Text("버튼",style: TextStyle(fontSize: 30),
//     )),);
//   }
// }



// cupertino 스타일 dialog
class DialogTest3 extends StatelessWidget {
  const DialogTest3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(child: Text("버튼",
      style: TextStyle(fontSize: 30),
        ),
        onPressed: (){
        showDialog(context: context, builder: (context){
          return CupertinoAlertDialog(
          title: Text("알림창"),content: Text("이 작업을 진행하겠는가"),
          actions: [
            CupertinoDialogAction(child: Text("취소"),
              onPressed: (){
              Navigator.pop(context);
              },),
            CupertinoDialogAction(child: Text("확인"),
            onPressed: (){
              Navigator.pop(context);
},)],
          );
});
},),
    );
  }
}

