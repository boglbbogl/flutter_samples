abstract class PlatformComponent {
  void onTap();
  static platformComponentButton(int type) {
    return switch (type) {
      0 => IOSButton(),
      1 => AndroidButton(),
      2 => WebButton(),
      _ => IOSButton(),
    };
  }
}

class AndroidButton implements PlatformComponent {
  @override
  void onTap() => print("안드로이드 버튼");
}

class IOSButton implements PlatformComponent {
  @override
  void onTap() => print("iOS 버튼");
}

class WebButton implements PlatformComponent {
  @override
  void onTap() => print("웹 버튼");
}

void main() {
  // PlatformComponent button = PlatformComponent.button(0);
  // button.onTap();
}
