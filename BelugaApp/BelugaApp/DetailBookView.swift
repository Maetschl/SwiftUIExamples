//
//  DetailBookView.swift
//  BelugaApp
//
//  Created by Julian Arias Maetschl on 28-09-21.
//

import SwiftUI

struct DetailBookView: View {
    let book: String
    var body: some View {
        List {
            ForEach(Book.all, id: \.self) { book in
                HStack {
                    Image(systemName: book.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    VStack {
                        Text(book.name)
                            .font(.title)
                        Text(book.description)
                            .font(.subheadline)
                    }
                }
            }
        }
    }
}

struct DetailBookView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailBookView(book: "Some book!")
        }
    }
}

struct Book: Hashable {
    let name: String
    let image: String
    let description: String

    static var all: [Book] = [
        Book(name: "Harry potter 1",
             image: "paintbrush.pointed.fill",
             description: "SomeDescription Text1"),
        Book(name: "Harry potter 2",
             image: "bandage.fill",
             description: "SomeDescription Text2"),
        Book(name: "Harry potter 3",
             image: "eyedropper.halffull",
             description: "SomeDescription Text3"),
        Book(name: "Harry potter 4",
             image: "rotate.3d",
             description: "SomeDescription Text4")
    ]
}
