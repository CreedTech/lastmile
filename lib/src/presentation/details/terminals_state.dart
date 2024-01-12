// import 'dart:io';

class TerminalDetailsState {
  List<dynamic> terminalDetails;
  TerminalDetailsState({this.terminalDetails = const []});

  TerminalDetailsState copyWith({List<dynamic>? terminalDetails}) {
    return TerminalDetailsState(
      terminalDetails: terminalDetails ?? this.terminalDetails,
    );
  }
}
