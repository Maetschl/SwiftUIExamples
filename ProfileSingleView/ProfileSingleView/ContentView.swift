//
//  ContentView.swift
//  ProfileSingleView
//
//  Created by Julian Arias Maetschl on 19-04-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        ZStack {
            GradientBackground()
            HStack {
                Spacer()
                ZStack {
                    ForEach((0...10).reversed(), id: \.self) { item in
                        ProfilePhoto()
                            .offset(CGSize(width: 40 * item, height: -(40 * item)))
                    }
                }
                Spacer()
            }
        }
    }

}

struct ProfilePhoto: View {

    let lineColor = Color.black

    let blackGradient = LinearGradient(
        gradient: Gradient(colors: [.clear, Color(UIColor.black.withAlphaComponent(0.5))]),
        startPoint: .top,
        endPoint: .bottom
    )

    var body: some View {
        Circle()
            .stroke(lineColor, lineWidth: 20)
            .frame(
                width: 200,
                height: 200,
                alignment: .center
        ).overlay(
            Circle()
                .fill(Color.white)
                .overlay(
                    Circle()
                        .fill(blackGradient)
            )

        )
    }

}

struct GradientBackground: View {

    let lineColor = Color.black

    static let colors: [Color] = [.black, Color(.magenta)]


    let linearGradient = LinearGradient(
        gradient: Gradient(colors: colors),
        startPoint: .topTrailing,
        endPoint: .bottomLeading
    )

    let linearGradient2 = LinearGradient(
        gradient: Gradient(colors: colors),
        startPoint: .bottomLeading,
        endPoint: .topTrailing
    )
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Rectangle().fill(linearGradient)
            lineColor.frame(width: 1000, height: 10, alignment: .center)
            Rectangle().fill(linearGradient2)
        }
        .lineSpacing(0)
        .rotationEffect(Angle(radians: -.pi/4))
        .edgesIgnoringSafeArea(.all)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
