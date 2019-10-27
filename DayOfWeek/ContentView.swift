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
          Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            Text("Calculate Day")
          }
          Spacer()
        }
      }
    }
  }
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif
