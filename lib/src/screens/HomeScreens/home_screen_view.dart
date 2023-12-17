import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test/src/screens/HomeScreens/widgets/auth_widget.dart';
import 'package:test/src/screens/HomeScreens/widgets/signin_widget.dart';
import 'package:test/src/widgets/message_widget.dart';
import 'package:test/src/widgets/title_text/title_text_widget.dart';
import 'home_screen_model.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenModel>.reactive(
      viewModelBuilder: () => HomeScreenModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 38, 63, 113),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const TitleTextWidget(),
                  Visibility(
                    visible: model.showAuthWidget,
                    child: Expanded(
                      child: AuthWidget(model: model),
                    ),
                  ),
                  Visibility(
                    visible: !model.showAuthWidget,
                    child: Expanded(
                      child: SignInWidget(model: model),
                    ),
                  ),
                ],
              ),
              Positioned.fill(
                child: Visibility(
                  visible: model.showMessage != '',
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                        child: MessageWidget(
                      message: model.showMessage,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
