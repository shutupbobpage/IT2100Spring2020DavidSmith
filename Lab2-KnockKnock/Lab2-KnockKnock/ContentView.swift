//
//  ContentView.swift
//  Lab2-KnockKnock
//
//  Created by David Smith on 2/8/20.
//  Copyright © 2020 David Smith. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var answerIsVisible: Bool = false
    
    var body: some View {
        VStack {
            Text("Knock Knock Joke Application")
                .fontWeight(.semibold)
                .padding(.bottom, 34.0)
            Button(action: {
                print("Knock Knock button was pressed")
                self.alertIsVisible = true
                self.answerIsVisible = false
            }) {
                Text("Knock Knock!")
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
            }
            .alert(isPresented: $alertIsVisible) { () ->
                Alert in
                return Alert(title: Text("Who's there?"), message: Text("Orange."), dismissButton: Alert.Button.default(
                        Text("Orange who?"),
                        action: {
                            print("Answer button was pressed!")
                            self.answerIsVisible = true
                        })
                )
            }
            if self.answerIsVisible == true {
                Text("Orange you glad you're using Xcode?")
                    .foregroundColor(Color.orange)
                    .padding(.top, 40.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
