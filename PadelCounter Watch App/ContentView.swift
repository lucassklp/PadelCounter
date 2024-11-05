//
//  ContentView.swift
//  PadelCounter Watch App
//
//  Created by Lucas Simas on 28/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State
    var score = Score()
    
    @State
    var imWinner = false;
    
    @State
    var theyAreWinner = false;
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Padel Counter!")
                }
                HStack {
                    VStack {
                        Text(score.getMyScore())
                            .font(.system(size: 50))
                        Text("me")
                    }

                    Divider()
                        .padding(10)
                        .frame(minWidth: 5, maxWidth: 20)
                    
                    VStack{
                        Text(score.getTheirScore())
                            .font(.system(size: 50))
                        Text("they")
                    }
                }
                HStack {
                    Button("+"){
                        score.incrementMyScore()
                        imWinner = score.imWinner()
                        if(imWinner){
                            score.reset()
                        }
                    }.alert(isPresented: $imWinner) {
                        Alert(title: Text("Game Over"),
                              message: Text("You are winner!"))
                    }
                    
                    Button("-", action: score.decrementMyScore)
                    
                    Button("+"){
                        score.incrementTheirScore()
                        theyAreWinner = score.theyAreWinner()
                        if(theyAreWinner){
                            score.reset()
                        }
                    }.alert(isPresented: $theyAreWinner) {
                        Alert(title: Text("Game over"),
                              message: Text("They are winner!"))
                    }
                    
                    Button("-", action: score.decrementTheirScore)
                }
                Button("Reset", action: score.reset)
            }
        }
    }
}

#Preview {
    ContentView()
}
