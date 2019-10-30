//
//  ContentView.swift
//  DayOfWeek
//
//  Created by Edward Bennett on 9/16/19.
//  Copyright © 2019 Edward Bennett. All rights reserved.
//

import SwiftUI

struct ContentView : View {
  @State var textValue = ""
  @State var textFieldValue = ""
  
  var body: some View {
    Form {
      Section(header: Text("Day of Week")) {
        TextField("Date (mm/dd/yyyy)", text: $textFieldValue) {
        }
        Text(textValue)
      }
      
      Section {
        HStack {
          Spacer()
          Button(action: calculateDay) {
            Text("Calculate Day")
          }
          Spacer()
        }
      }
    }
  }
  
  func calculateDay() {
    guard textFieldValue.count == 10 else { return }
    let calculator = DayOfWeekCalculator()
    let date = calculator.getDateFromString(textFieldValue)
    let day = DayOfWeekCalculator().calculateDayOfWeek(forDate: date!)
    textValue = day.description
  }
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif
