import Cocoa
import XCTest

enum Thing: String {
    case thing, divider
}

func firstPart(_ things: [Thing]) -> [Thing] {
    if things.firstIndex(of: .divider) == 0 {
        return []
    } else if
    return things
}

let things: [Thing] = [.thing, .thing, .divider, .thing]
let things2: [Thing] = [.thing, .thing, .thing, .divider]
let things3: [Thing] = [.divider, .thing, .thing, .thing]


print(firstPart(things).description)
