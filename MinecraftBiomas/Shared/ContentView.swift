//
//  ContentView.swift
//  Shared
//
//  Created by Julian Arias Maetschl on 23-09-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ListView()
        }
    }
}

struct ListView: View {
    var body: some View {
        List {
            ForEach(Biomes.all.sorted(), id: \.self) { biome in
                NavigationLink(destination: DetailView(biome: biome)) {
                    CellView(biome: biome)
                }
            }
        }
        .navigationTitle("Notes")
    }
}

struct CellView: View {
    let biome: String
    var body: some View {
        HStack {
            Text(biome)
            Spacer()
            Image("plain")
                .resizable()
                .frame(width: 150, height: 100, alignment: .bottom)
                .aspectRatio(1.0, contentMode: .fit)
                .cornerRadius(4.0)
        }
    }
}

struct DetailView: View {
    let biome: String
    var body: some View {
        VStack {
            Text(biome)
                .font(.largeTitle)
                .fontWeight(.semibold)

            Spacer()
            Image("plain")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10.0)
            Spacer()
            Text(Biomes.genericDescription(for: biome))
                .multilineTextAlignment(.leading)
            Spacer()
        }
        .padding()
    }
}

struct Biomes {
    static let all: [String] = ["Mountains Biome", "Plains Biome", "Desert Biome", "Jungle Biome", "Swamp Biome", "Badlands Biome", "Dark Forest Biome", "Snowy Tundra Biome", "Savanna Biome", "Ocean Biome", "Bamboo Forest", "Ice Plains Spikes Biome", "Taiga Biome", "Snowy Taiga Biome", "Mushroom Fields"]

    static func genericDescription(for biome: String) -> String {
        switch biome {
        case "Plains Biome":
            return "The plains biome is one of the most common biomes in Minecraft, and it holds several useful resources for players. An abundance of Flowers can be found here (necessary for making Dyes), widespread patches of Grass (which can be chopped down to gather seeds) as well as the occasional, sporadic Tree. The relatively flat landscape allows players to easily find level ground on which to build structures. Cows, Pigs, and Chickens spawn here more often than many other biomes. This is also one of the few areas where Horses can spawn. Villages often generate within this type of biome."
        default: return "not written yet"
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //        DetailView(biome: "some")
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
