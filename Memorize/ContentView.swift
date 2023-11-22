//
//  ContentView.swift
//  Memorize
//
//  Created by Lyu Lin on 2023/11/21.
//

import SwiftUI

struct ContentView: View {
    let vehicles: Array<String> = ["🚗", "🚜", "🛵", "🚲"]
    let halloween: Array<String> = ["👻", "🕷️", "🕸️", "🎃", "💀", "🦴"]
    let animals: Array<String> = ["🐶", "🐱", "🐭", "🐷", "🦊", "🐵", "🐔", "🐺", "🐝", "🐴", "🐢", "🐸"]
    let themeNames: Array<String> = ["Vehicles", "Halloween", "Animals"]
    let themeColor: Array<Color> = [Color.blue, Color.orange, Color.green]
    
    var themes: Array<Array<String>> {
        get {
            return [vehicles, halloween, animals]}
    }
    
    @State var themeIndex: Int = 0
    
    var body: some View {
        VStack{
            Text("Memorize!").font(.title)
            cards
            Spacer()
            themeChooser
        }
        .padding()
    }
    
    var cards: some View {
        let cardCount: Int = Int.random(in: 4...themes[themeIndex].count)
        let shuffledTheme: Array<String> = (themes[themeIndex][..<cardCount] + themes[themeIndex][..<cardCount]).shuffled()
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 65, maximum: (UIScreen.main.bounds.width - 18)/4))]){
            ForEach(0..<2 * cardCount, id: \.self) { index in
                Card(content: shuffledTheme[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundStyle(themeColor[themeIndex])
    }
    
    var themeChooser: some View {
        HStack {
            themeButton(number: 1)
            themeButton(number: 2)
            themeButton(number: 3)
        }.padding()
    }
    
    func themeButton(number: Int) -> some View {
        let imageArray: Array<String> = ["car.circle.fill", "h.circle.fill", "pawprint.circle.fill"]
        return Button (action: {
            themeIndex = number - 1
        }, label: {
            ZStack {
                VStack {
                    Image(systemName: imageArray[number - 1])
                        .imageScale(.large)
                    Text(themeNames[number - 1])
                        .font(.caption)
                }
                .opacity(themeIndex == number - 1 ? 1 : 0)
                VStack {
                    Image(systemName: String(number)+".circle")
                        .imageScale(.large)
                    Text("Theme "+String(number))
                        .font(.caption)
                }
                .opacity(themeIndex == number - 1 ? 0 : 1)
            }
        }
        )
    }
//    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
//        Button(action: {
//            cardCount += offset
//        }, label: {
//            Image(systemName: symbol)
//        })
//        .disabled(cardCount + offset < 1 || cardCount + offset > theme.count)
//    }
//    
//    var cardRemover: some View {
//        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
//    }
//    
//    var cardAdder: some View {
//        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
//    }
//    
//    var cardCountAdjusters: some View {
//        HStack {
//            cardAdder
//            Spacer()
//            cardRemover
//        }
//        .imageScale(.large)
//    }
}

struct Card: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12) // LET makes a constant that will never change
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
