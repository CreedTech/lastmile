// import 'package:lastmile/src/data/models/terminal_model.dart';

// class TerminalsResultModel {
//   late final List<Terminal> terminals;

//   TerminalsResultModel({required this.terminals});

//   factory TerminalsResultModel.fromJson(Map<String, dynamic> json) {
//     var terminals = List<Terminal>.empty(growable: true);
//     if (json['data'] != null) {
//       json['data'].forEach((v) {
//         final terminalsModel = Terminal.fromJson(v);
//         terminals.add(terminalsModel);
//       });
//     }
//     return TerminalsResultModel(terminals: terminals);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['data'] = this.terminals.map((v) => v.toJson()).toList();
//     return data;
//   }
// }
