//
//  ContentView.swift
//  BridgeExample
//
//  Created by Julian Arias Maetschl on 16-04-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SquareCard(with: SimpleTextContent(text: "Some"))
        SquareCard(with: PersonContent(name: "Julián", lastName: "Arias"))
        SquareCard(with: OnlyColorContent(color: .yellow))
        CircleCard(with: SimpleTextContent(text: "Some"))
        CircleCard(with: PersonContent(name: "Julián", lastName: "Arias"))
        CircleCard(with: OnlyColorContent(color: .yellow))
        CircleBorderedCard(with: SimpleTextContent(text: "Some"))
        CircleBorderedCard(with: PersonContent(name: "Julián", lastName: "Arias"))
        CircleBorderedCard(with: OnlyColorContent(color: .yellow))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Bridge patters

// Abstractions for 2 dimensions

protocol CardContent {
    var title: String { get }
    var color: Color { get }
}

protocol Format {
    associatedtype View
    var body: View { get }
}

// 2 Concretions for Format

struct SquareCard: View, Format {

    var content: CardContent

    var body: some View {
        ZStack {
            content.color
            Text(content.title)
        }
        .frame(width: 100, height: 100, alignment: .center)
        .cornerRadius(3.0)
    }

    init(with content: CardContent) {
        self.content = content
    }

}

struct CircleCard: View, Format {

    var content: CardContent

    var body: some View {
        ZStack {
            content.color
            Text(content.title)
        }
        .frame(width: 100, height: 100, alignment: .center)
        .cornerRadius(50.0)
    }

    init(with content: CardContent) {
        self.content = content
    }

}

struct CircleBorderedCard: View, Format {

    var content: CardContent

    var body: some View {
        ZStack {
            Color.white
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(50.0)
            content.color
                .frame(width: 80, height: 80, alignment: .center)
                .cornerRadius(50.0)
            Text(content.title)
        }
        .frame(width: 100, height: 100, alignment: .center)
    }

    init(with content: CardContent) {
        self.content = content
    }

}



// 3 Concretions for CardContent

struct PersonContent: CardContent {
    var title: String = "Test title"
    var subtitle: String = "Test subtitle"
    var color: Color = .blue

    init(name: String, lastName: String) {
        self.title = "\(name) \(lastName)"
    }
}

struct SimpleTextContent: CardContent {
    var title: String
    var color: Color = .black

    init(text: String) {
        self.title = "\(text)"
    }
}

struct OnlyColorContent: CardContent {
    var title: String = ""
    var color: Color

    init(color: Color) {
        self.color = color
    }
}
