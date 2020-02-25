//
//  ContentView.swift
//  Lab2-Bullseye
//
//  Created by David Smith on 2/8/20.
//  Copyright © 2020 David Smith. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    var body: some View {
        VStack {
            Spacer()
            //Target Row
            HStack {
                VStack {
                    Text("Put the Bullseye as close as you can to: ")
                }
                Text("\(target)")
            }
            Spacer()
            //Slider Row
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
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
                //let roundedValue = Int(sliderValue.rounded())
                return Alert(title: Text(alertTitle()), message: Text(
                    "The slider's value is \(sliderValueRounded()).\n" +
                    "You scored \(pointsForCurrentRound()) points this round."), dismissButton: .default(Text("Ok.")) {
                        self.score = self.score + self.pointsForCurrentRound()
                        self.target = Int.random(in: 1...100)
                        self.round = self.round + 1
                    })
            }
            Spacer()
            //Score Row
            HStack {
                Button(action: {
                    self.startNewGame()
                }) {
                    Text(/*@START_MENU_TOKEN@*/"Start Over"/*@END_MENU_TOKEN@*/)
                        .padding(.trailing, 0.0)
                }
                Spacer()
                Text("Score: ")
                Text("\(score)")
                Spacer()
                Text("Round: ")
                Text("\(round)")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text(/*@START_MENU_TOKEN@*/"Info"/*@END_MENU_TOKEN@*/)
                        .padding()
                }
            }
            .padding(.bottom, 20)
        }
    }
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let difference = amountOff()
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maximumScore - difference + bonus
    }
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    func alertTitle() -> String {
        let difference = amountOff()
        let title: String
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }    
    func startNewGame() {
        score = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
