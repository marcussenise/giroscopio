class GameScreenController {
  bool isFirstTopPosition = true;
  bool isFirstLeftPosition = true;
  double lastTopPosition = 0.0;
  double lastLeftPosition = 0.0;

  double? getTopPosition(double gyroX, double heightScreen){
      isFirstTopPosition ? lastTopPosition = heightScreen/2 : lastTopPosition;
      isFirstTopPosition = false;

    if(gyroX < 0.08 && gyroX > -0.08){
      return lastTopPosition;
    } else {
      lastTopPosition = (gyroX + 1) / 2 * heightScreen;
      if(lastTopPosition > heightScreen){
        lastTopPosition = heightScreen-30;
      } else if(lastTopPosition < 0){
        lastTopPosition = 0;
      }
      return lastTopPosition;
    }
  }

  double getLeftPosition(double giroY, double widthScreen){
    isFirstLeftPosition ? lastLeftPosition = widthScreen/2 : lastTopPosition;
    isFirstLeftPosition = false;

    if(giroY < 0.08 && giroY > -0.08){
      return lastLeftPosition;
    } else {
      lastLeftPosition = (giroY + 1) / 2 * widthScreen;
      if(lastLeftPosition < 0){
        lastLeftPosition = 0;
      } else if(lastLeftPosition > widthScreen){
        lastLeftPosition = widthScreen - 30;
      }
      return lastLeftPosition;
    }
  }
}