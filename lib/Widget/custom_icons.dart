
import 'package:money_manager/constFiles/strings.dart';


String tileIcon(String categoriessName) {
  if (categoriessName == cup) return svgPath(cupSvg);
  if (categoriessName == dollarsign) return svgPath(dollarsignSvg);
  if (categoriessName == fuelpump) return svgPath(fuelpumpSvg);
  if (categoriessName == phone) return svgPath(phoneSvg);

  if (categoriessName == cashWithdrawl) return svgPath(cashWithdrawlSvg);
  if (categoriessName == electronic) return svgPath(electronicSvg);
  if (categoriessName == extraIncome) return svgPath(extraIncomeSvg);
  if (categoriessName == food) return svgPath(foodSvg);
  if (categoriessName == file) return svgPath(fileSvg);
  return svgPath(othersSvg);
}
