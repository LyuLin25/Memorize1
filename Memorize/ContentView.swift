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
            Card(isFaceUp: true)
            Card()
            Card()
            Card(isFaceUp: true)
        }
        .padding()
        .foregroundStyle(.orange)
    }
}

struct Card: View {
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12) // LET makes a constant that will never change
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
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
