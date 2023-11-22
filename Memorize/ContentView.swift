//
//  ContentView.swift
//  Memorize
//
//  Created by Lyu Lin on 2023/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            let emojis: Array<String> = ["👻", "👍🏿", "🐻", "🏀"]
            ForEach(emojis.indices, id: \.self) { index in
                Card(content: emojis[index])
            }
        }
        .padding()
        .foregroundStyle(.orange)
    }
}

struct Card: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12) // LET makes a constant that will never change
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
