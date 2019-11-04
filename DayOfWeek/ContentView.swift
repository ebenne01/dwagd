//
//  ContentView.swift
//  DayOfWeek
//
//  Created by Edward Bennett on 9/16/19.
//  Copyright © 2019 Edward Bennett. All rights reserved.
//

import SwiftUI

struct ContentView : View {
  let calculator = DayOfWeekCalculator()
  @State var selectedDate = Date()
  
  var body: some View {
    VStack {
      Text("Day Of The Week")
        .font(.largeTitle)
      DatePicker("Date",
                 selection: $selectedDate,
                 displayedComponents: .date
      )
        .labelsHidden()
      Text("\(calculateDay(selectedDate).description)")
    }
  }
  
  func calculateDay(_ date: Date) -> Day {
    return calculator.calculateDayOfWeek(forDate: date)
  }
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif
