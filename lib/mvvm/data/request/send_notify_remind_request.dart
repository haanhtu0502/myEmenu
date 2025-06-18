class SendNotifyRemindRequest {
  int? kitchenOrderLineId;
  String? priorityLevel;
  String? note;
  int? cookingTime;

  SendNotifyRemindRequest({
    this.kitchenOrderLineId,
    this.priorityLevel,
    this.note,
    this.cookingTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'kitchenOrderLineId': kitchenOrderLineId,
      'priorityLevel': priorityLevel,
      'note': note,
      'cookingTime': cookingTime,
    };
  }
}
