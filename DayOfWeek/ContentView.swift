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
    NavigationView {
      Form {
        DatePicker(selection: $selectedDate, displayedComponents: .date) {
          Text("Date")
        }
        HStack {
          Spacer()
          Text("\(calculateDay(selectedDate).description)")
        }
      }
      .navigationBarTitle("Day Of The Week")
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
