import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../domain/entities/account.dart';

const notProfitBackgroundColor = Color(0xFFE4E2E6);
const lossBackgroundColor = Color(0x33B20000);
const profitBackgroundColor = Color(0x3300B200);

const notProfitTextColor = Color(0xFF767680);
const lossTextColor = Color(0xFFB20000);
const profitTextColor = Color(0xFF00B200);

class AccountStatus extends HookWidget {
  final Account account;
  const AccountStatus({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    final backgroundColorState = useState(notProfitBackgroundColor);
    final textColorState = useState(notProfitBackgroundColor);

    useEffect(() {
      if (account.profit == 0) {
        backgroundColorState.value = notProfitBackgroundColor;
      } else if (account.profit < 0) {
        backgroundColorState.value = lossBackgroundColor;
      } else if (account.profit < 0) {
        backgroundColorState.value = profitTextColor;
      }
    }, [account.profit]);

    useEffect(() {
      if (account.profit == 0) {
        textColorState.value = notProfitTextColor;
      } else if (account.profit < 0) {
        textColorState.value = lossTextColor;
      } else if (account.profit < 0) {
        textColorState.value = profitTextColor;
      }
    }, [account.profit]);

    final textStyle = Theme.of(context)
        .textTheme
        .bodySmall
        ?.copyWith(color: textColorState.value);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColorState.value,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 15,
        ),
        child: Text(
          '${account.profit} ₽ · ${account.profitPercent}%',
          style: textStyle,
        ),
      ),
    );
  }
}
