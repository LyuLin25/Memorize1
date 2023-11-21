//
//  ContentView.swift
//  Memorize
//
//  Created by Lyu Lin on 2023/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Card(isFaceUp: true)
            Card()
            Card()
            Card(isFaceUp: true)
            Text("First Swift Test")
                .foregroundColor(Color.blue)
        }
        .padding()
        .foregroundStyle(.orange)
    }
}

struct Card: View {
    var isFaceUp: Bool = false
    var body: some View {
        if isFaceUp {
            ZStack {
                Rectangle().foregroundColor(.white)
                Rectangle().strokeBorder(style: /*@START_MENU_TOKEN@*/StrokeStyle()/*@END_MENU_TOKEN@*/)
                Text("Face UP!")
            }
        } else {
            ZStack {
                Rectangle().foregroundColor(.orange)
            }
        }
    }
}

#Preview {
    ContentView()
}
