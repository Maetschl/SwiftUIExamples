//
//  ContentView.swift
//  EnumPicker
//
//  Created by Julian Arias Maetschl on 14-09-21.
//

import SwiftUI

enum SomeEnum: String, Equatable, CaseIterable {
    case some1 = "Some 1"
    case some2 = "Some 2"
    case some3 = "Some 3"
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

struct ContentView: View {
    @State var selection: SomeEnum = .some1
    var body: some View {
        NavigationView {
            Form {
                Picker("Some Title", selection: $selection, content: {
                    ForEach(SomeEnum.allCases, id: \.self) { value in
                        Text(value.localizedName)
                            .tag(value)
                    }
                })
            }
        }
    }
    func solution(_ num: Int) -> Int {
        if num < 0 { return 0 }
        return (0 ..< num).filter({ $0 % 3 == 0 || $0 % 5 == 0 }).reduce(0, +)
//        for i in 0 ..< num {
//            if i % 3 == 0 || i % 5 == 0 {
//                total += i
//            }
//        }
//        return total
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
