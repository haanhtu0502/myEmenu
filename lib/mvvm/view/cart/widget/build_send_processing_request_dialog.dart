import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/mvvm/data/model/request_history/request_history_model.dart';
import 'package:emenu/mvvm/viewmodel/cart/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildSendProcessingRequestDialog extends StatelessWidget {
  const BuildSendProcessingRequestDialog({
    super.key,
    required this.requestHistory,
  });

  final RequestHistoryModel requestHistory;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      width: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  S.of(context).priorityProcessing,
                  style: context.titleLargeS20.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                  softWrap: true,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.close,
                  size: 24,
                ),
                onPressed: () => Navigator.of(context).pop(),
                color: Theme.of(context).dividerColor,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  S.of(context).sorryForLate,
                  style: context.titleMedium.copyWith(),
                  softWrap: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  S.of(context).confirmPriorityProcessing(
                        requestHistory.product?.name ?? "",
                      ),
                  style: context.titleMedium.copyWith(),
                  softWrap: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.grey.shade300), // gạch chân mảnh
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue), // khi focus
              ),
              isDense: true, // làm cho gọn
              contentPadding: const EdgeInsets.symmetric(vertical: 8),

              hintText: S.of(context).inputFeedback,
              hintStyle: context.titleMedium.copyWith(
                color: Theme.of(context).hintColor,
              ),
            ),
            style: context.titleMedium,
            onChanged: (value) {},
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<CartProvider>().sendNotifyRemind(
                    kitchenOrderLineId: requestHistory.kitchenOrderLineId!,
                    note: "",
                    waitingTime: requestHistory.timeWaiting,
                    product: requestHistory.product!,
                    quantity: requestHistory.qty ?? 0,
                  );
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_box,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    S.of(context).priority,
                    style: context.titleMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
