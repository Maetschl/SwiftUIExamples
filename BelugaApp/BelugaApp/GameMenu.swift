//
//  GameMenu.swift
//  BelugaApp
//
//  Created by Julian Arias Maetschl on 11-10-21.
//

import SwiftUI

struct Level: Hashable {

    let id: UUID = .init()
    let isLastUnlocked: Bool
    let isLocked: Bool


    internal init(isLocked: Bool = true, isLastUnlocked: Bool = false) {
        self.isLastUnlocked = isLastUnlocked
        self.isLocked = isLocked
    }


}

struct GameMenu: View {
    var body: some View {
        ZStack {
            Color.init(UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.14, alpha: 1.0))
            ScrollView(.horizontal) {
                HStack(spacing: 0.0) {
                    Rectangle()
                        .frame(width: 20, height: 20, alignment: .center)
                        .foregroundColor(unlockColor)
                        .cornerRadius(5.0)
                        .offset(x: 5.0)
                    ForEach(Levels.all, id: \.self) { level in
                        LevelCell(level: level)
                    }
                    Rectangle()
                        .frame(width: 20, height: 20, alignment: .center)
                        .foregroundColor(lockColor)
                        .cornerRadius(5.0)
                        .offset(x: -5.0)
                }
            }
//            .shadow(color: .gray, radius: 3.0, x: 0, y: 5)
            .padding()
        }
    }

    let unlockColor = Color.init(UIColor(displayP3Red: 0.3, green: 0.7, blue: 0.3, alpha: 1.0))
    let lockColor = Color.init(UIColor(displayP3Red: 0.2, green: 0.2, blue: 0.28, alpha: 1.0))
}

struct LevelCell: View {
    let level: Level
    var body: some View {
        ZStack {
            HStack {
                Rectangle()
                    .foregroundColor(firstPartColor)
                    .frame(width: 60, height: 20, alignment: .center)
                Rectangle()
                    .foregroundColor(finalPartColor)
                    .frame(width: 60, height: 20, alignment: .center)
            }
            Circle()
                .foregroundColor(firstPartColor)
                .frame(width: 100, height: 100, alignment: .center)
//            Circle()
//                .foregroundColor(.white)
//                .frame(width: 80, height: 80, alignment: .center)
            content
                .frame(width: 80, height: 80, alignment: .center)
                .cornerRadius(40.0)
        }


    }

    var content: some View {
        ZStack {
            Color.green
            if level.isLocked {
                Color.gray
                Image(systemName: "lock.fill")
            } else {
                VStack {
                    Image(systemName: "flag.fill")
                        .foregroundColor(.white)
                }
            }
        }
    }

    let lockColor = Color.init(UIColor(displayP3Red: 0.2, green: 0.2, blue: 0.28, alpha: 1.0))
    let unlockColor = Color.init(UIColor(displayP3Red: 0.3, green: 0.7, blue: 0.3, alpha: 1.0))

    var firstPartColor: Color {
        level.isLocked ? lockColor: unlockColor
    }

    var finalPartColor: Color {
        if level.isLastUnlocked || level.isLocked {
            return lockColor
        }
        return unlockColor
    }
}

struct GameMenu_Previews: PreviewProvider {
    static var previews: some View {
        GameMenu()
            .landscape()
    }
}

struct LandscapeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .previewLayout(.fixed(width: 812, height: 375))
            .environment(\.horizontalSizeClass, .compact)
            .environment(\.verticalSizeClass, .compact)
    }
}

extension View {
    func landscape() -> some View {
        self.modifier(LandscapeModifier())
    }
}

struct Levels {
    static let all: [Level] = [
        Level(isLocked: false),
        Level(isLocked: false),
        Level(isLocked: false, isLastUnlocked: true),
        Level(isLocked: true),
        Level(isLocked: true)
    ]
}
