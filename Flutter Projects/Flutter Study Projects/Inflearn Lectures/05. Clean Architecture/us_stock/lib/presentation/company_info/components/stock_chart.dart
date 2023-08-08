import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:us_stock/domain/model/intraday_info.dart';

class StockChart extends StatelessWidget {
  final List<IntradayInfo> info;
  final Color graphColor;
  final Color textColor;

  const StockChart({
    super.key,
    this.info = const [],
    required this.graphColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: CustomPaint(
        painter: ChartPainter(info, graphColor, textColor),
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  final List<IntradayInfo> info;
  final Color graphColor;
  final Color textColor;

  /// 그래프를 그리기 위해 y축의 최대치와 최소치의 값을 찾기
  late int upperValue = info
      .map((e) => e.close)
      // .fold(0.0, (previousValue, element) => max(previousValue, element))
      .fold<double>(0.0, max) // 위와 같은 구조를 축약
      .ceil(); // ceil == 올림, 아래와 같이 reduce함수를 사용해도 된다

  late int lowerValue = info
      .map((e) => e.close)
      // .reduce((value, element) => min(value, element))
      .reduce(min)
      .toInt();

  final double spacing = 50.0; // 그래프 라벨 보정값

  late Paint strokePaint;

  ChartPainter(this.info, this.graphColor, this.textColor) {
    strokePaint = Paint()
      ..color = graphColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    /// canvas에 그리는 코드 작성
    // y축의 라벨의 간격 계산
    final priceGap = (upperValue - lowerValue) / 5.0;
    for (var i = 0; i < 5; i++) {
      // y축(금액) 라벨 그리기 (글씨도 그리는 것)
      final textPainter = TextPainter(
        text: TextSpan(
          text: '${(lowerValue + priceGap * i).round()}',
          style: TextStyle(fontSize: 12, color: textColor),
        ),
        // 아랍권에서는 오른쪽에서 왼쪽으로 글씨를 쓰기 때문에 textAlign, textDirection 옵션이 존재
        textAlign: TextAlign.start,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
          canvas, Offset(10, size.height - spacing - i * (size.height / 5.0)));
    }

    // x축(시간)의 라벨 그리기
    final timeGap = (size.width - spacing) / info.length;
    for (var i = 0; i < info.length; i += 12) {
      // x축(시간) 라벨 그리기
      final hour = info[i].date.hour;
      final textPainter = TextPainter(
        text: TextSpan(
          text: '$hour',
          style: TextStyle(fontSize: 12, color: textColor),
        ),
        textAlign: TextAlign.start,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
          canvas, Offset(i * timeGap + spacing, size.height + 10));
    }

    // 그래프 선 그리기
    var lastX = 0.0;
    var lastY = 0.0;
    final strokePath = Path();
    for (var i = 0; i < info.length; i++) {
      final price = info[i];
      var nextIndex = i + 1;
      // 마지막 인덱스를 넘어가지 않게 확인하 할당
      if (i + 1 > info.length - 1) nextIndex = info.length - 1;
      final nextInfo = info[nextIndex];
      final leftRatio = (price.close - lowerValue) / (upperValue - lowerValue);
      final rightRatio =
          (nextInfo.close - lowerValue) / (upperValue - lowerValue);
      // 이전 좌표
      final x1 = spacing + i * timeGap;
      final y1 = size.height - (leftRatio * size.height);
      // 연결할 좌표
      final x2 = spacing + (i + 1) * timeGap;
      final y2 = size.height - (rightRatio * size.height);

      if (i == 0) {
        strokePath.moveTo(x1, y1);
      }
      lastX = (x1 + x2) / 2.0;
      lastY = (y1 + y2) / 2.0;
      strokePath.quadraticBezierTo(x1, y1, lastX, lastY);
    }

    final fillPath = Path.from(strokePath)
      ..lineTo(lastX, size.height - spacing)
      ..lineTo(spacing, size.height - spacing)
      ..close();

    final fillPaint = Paint()
      ..color = graphColor
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset.zero,
        Offset(0, size.height - spacing),
        [
          graphColor.withOpacity(0.5),
          Colors.transparent,
        ],
      );

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(strokePath, strokePaint);
  }

  @override
  bool shouldRepaint(ChartPainter oldDelegate) {
    /// 언제 갱신되는지에 대한 규칙 코드 작성
    return oldDelegate.info != info;
    // return true;
  }
}
