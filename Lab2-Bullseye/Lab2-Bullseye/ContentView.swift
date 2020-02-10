//
//  ContentView.swift
//  Lab2-Bullseye
//
//  Created by David Smith on 2/8/20.
//  Copyright © 2020 David Smith. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    
    var body: some View {
        VStack {
            Spacer()
            //Target Row
            HStack {
                VStack {
                    Text("Put the Bullseye as close as you can to: ")
                }
                Text(/*@START_MENU_TOKEN@*/"100"/*@END_MENU_TOKEN@*/)
            }
            Spacer()
            //Slider Row
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            //Button Row
            Button(action: {
                print("ButtonPressed!")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me Button"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) { () ->
                Alert in
                var roundedValue: Int = Int(self.sliderValue.rounded())
                return Alert(title: Text("ALERT!"), message: Text("THe slider's value is \(roundedValue)"), dismissButton: Alert.Button.default(Text("Ok.")))
            }
            Spacer()
            //Score Row
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text(/*@START_MENU_TOKEN@*/"Start Over"/*@END_MENU_TOKEN@*/)
                        .padding(.trailing, 0.0)
                }
                Spacer()
                Text("Score: ")
                Text("99999")
                Spacer()
                Text("Round: ")
                Text("999")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text(/*@START_MENU_TOKEN@*/"Info"/*@END_MENU_TOKEN@*/)
                        .padding()
                    
                }
            }
            .padding(.bottom, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
