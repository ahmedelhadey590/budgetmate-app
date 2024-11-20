class StatisticsModel {
  StatisticsModel({
    this.daily,
    this.weekly,
    this.monthly,
    this.yearly,
  });
  TimePeriodStats? daily;
  TimePeriodStats? weekly;
  TimePeriodStats? monthly;
  TimePeriodStats? yearly;

  StatisticsModel.fromJson(Map<String, dynamic> json) {
    daily = TimePeriodStats.fromJson(json['Daily']);
    weekly = TimePeriodStats.fromJson(json['Weekly']);
    monthly = TimePeriodStats.fromJson(json['Monthly']);
    yearly = TimePeriodStats.fromJson(json['Yearly']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Daily'] = daily!.toJson();
    data['Weekly'] = weekly!.toJson();
    data['Monthly'] = monthly!.toJson();
    data['Yearly'] = yearly!.toJson();
    return data;
  }
}

class CategoryWiseStats {
  CategoryWiseStats({
    required this.category,
    required this.totalSpent,
  });
  int? category;
  int? totalSpent;

  CategoryWiseStats.fromJson(Map<String, dynamic> json) {
    category = json['Category'];
    totalSpent = json['TotalSpent'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Category'] = category;
    data['TotalSpent'] = totalSpent;
    return data;
  }
}

class TimePeriodStats {
  TimePeriodStats({
    this.totalIncome,
    this.totalExpenses,
    this.categoryWiseSpending,
  });
  num? totalIncome;
  num? totalExpenses;
  List<CategoryWiseStats>? categoryWiseSpending;
  List<CategoryWiseStats>? categoryWiseIncome;

  TimePeriodStats.fromJson(Map<String, dynamic> json) {
    totalIncome = json['TotalIncome'];
    totalExpenses = json['TotalExpenses'];
    categoryWiseSpending = List.from(json['CategoryWiseSpending'])
        .map((e) => CategoryWiseStats.fromJson(e))
        .toList();
    categoryWiseIncome = List.from(json['CategoryWiseIncome'])
        .map((e) => CategoryWiseStats.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['TotalIncome'] = totalIncome;
    data['TotalExpenses'] = totalExpenses;
    data['CategoryWiseSpending'] = categoryWiseSpending;
    data['CategoryWiseIncome'] = categoryWiseSpending;
    return data;
  }
}

// class WeeklyStats {
//   WeeklyStats({
//     required this.totalIncome,
//     required this.totalExpenses,
//     required this.categoryWiseSpending,
//   });
//   late final int totalIncome;
//   late final int totalExpenses;
//   late final List<CategoryWiseSpendingStats> categoryWiseSpending;
  
//   WeeklyStats.fromJson(Map<String, dynamic> json){
//     totalIncome = json['TotalIncome'];
//     totalExpenses = json['TotalExpenses'];
//     categoryWiseSpending = List.from(json['CategoryWiseSpending']).map((e)=>CategoryWiseSpendingStats.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['TotalIncome'] = totalIncome;
//     data['TotalExpenses'] = totalExpenses;
//     data['CategoryWiseSpending'] = categoryWiseSpending.map((e)=>e.toJson()).toList();
//     return data;
//   }
// }

// class MonthlyStats {
//   MonthlyStats({
//     required this.totalIncome,
//     required this.totalExpenses,
//     required this.categoryWiseSpending,
//   });
//   late final int totalIncome;
//   late final int totalExpenses;
//   late final List<CategoryWiseSpendingStats> categoryWiseSpending;
  
//   MonthlyStats.fromJson(Map<String, dynamic> json){
//     totalIncome = json['TotalIncome'];
//     totalExpenses = json['TotalExpenses'];
//     categoryWiseSpending = List.from(json['CategoryWiseSpending']).map((e)=>CategoryWiseSpendingStats.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['TotalIncome'] = totalIncome;
//     data['TotalExpenses'] = totalExpenses;
//     data['CategoryWiseSpending'] = categoryWiseSpending.map((e)=>e.toJson()).toList();
//     return data;
//   }
// }

// class YearlyStats {
//   YearlyStats({
//     required this.totalIncome,
//     required this.totalExpenses,
//     required this.categoryWiseSpending,
//   });
//   late final int totalIncome;
//   late final int totalExpenses;
//   late final List<CategoryWiseSpendingStats> categoryWiseSpending;
  
//   YearlyStats.fromJson(Map<String, dynamic> json){
//     totalIncome = json['TotalIncome'];
//     totalExpenses = json['TotalExpenses'];
//     categoryWiseSpending = List.from(json['CategoryWiseSpending']).map((e)=>CategoryWiseSpendingStats.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['TotalIncome'] = totalIncome;
//     data['TotalExpenses'] = totalExpenses;
//     data['CategoryWiseSpending'] = categoryWiseSpending.map((e)=>e.toJson()).toList();
//     return data;
//   }
// }
