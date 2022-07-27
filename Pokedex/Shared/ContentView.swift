//
//  ContentView.swift
//  Shared
//
//  Created by Julian Arias Maetschl on 04-10-21.
//

import Combine
import SwiftUI

class PokemonApi: ObservableObject {
    @Published var pokemons = [Pokemon]()
    private var cancelable: AnyCancellable?
    private static let sessionProcessingQueue = DispatchQueue(label: "SessionProcessingQueue")
    func loadData() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151&offset=0")!
        cancelable = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: Self.sessionProcessingQueue)
            .map {
                $0.data
            }
            .decode(type: PokemonApiResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                print("Completed")
            }, receiveValue: {
                for pokemon in $0.results {
                    self.pokemons.append(Pokemon(name: pokemon.name.capitalized, url: pokemon.url))
                }
            })
    }
}

class OldPokemonApi: ObservableObject {
    @Published var pokemons = [Pokemon]()
    static let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151&offset=0")!
    func loadData() {
        URLSession.shared.dataTask(with: Self.url) { data, response, error in
            if error != nil { return }
            guard let data = data else { return }
            guard let decodedData = try?
                    JSONDecoder().decode(PokemonApiResponse.self, from: data) else { return }
            DispatchQueue.main.async {
                self.pokemons = decodedData
                    .results
                    .map { Pokemon(name: $0.name.capitalized, url: $0.url) }
            }
        }.resume()
    }
}

struct ContentView: View {

    @ObservedObject var api = PokemonApi()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                Spacer(minLength: 20.0)
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(api.pokemons, id: \.name) { pokemon in
                        PokemonCellView(pokemon: pokemon)
                    }
                }
                .padding(.horizontal)
            }
            .onAppear {
                api.loadData()
            }
            .navigationTitle("Pokedex")
        }
    }
}

struct Background: View {
    var pokemon: Pokemon
    @State var color = Color(.tertiaryLabel)
    init(for pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    var body: some View {
        color
            .onAppear {
                getColor()
            }
    }

    func getColor() {
        let url: URL = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemon.id)")!
        URLSession.autoCache.dataTask(with: url) { data, response, error in
            if error != nil { return }
            guard let data = data else { return }
            guard let apiPokemon = try? JSONDecoder().decode(PokemonFromApi.self, from: data) else { return }
            self.color = ColorByType.getColor(from: apiPokemon.types.first?.type.name)
        }.resume()
    }
}

struct ColorByType {
    static func getColor(from: String?) -> Color {
        switch from?.lowercased() {
        case "water":
            return Color(.sRGB, red: 105.0/255.0, green: 145.0/255.0, blue: 255.0/255.0, opacity: 1.0)
        case "fire":
            return Color(.sRGB, red: 222.0/255.0, green: 133.0/255.0, blue: 70.0/255.0, opacity: 1.0)
        case "bug":
            return Color(.sRGB, red: 170.0/255.0, green: 180.0/255.0, blue: 65.0/255.0, opacity: 1.0)
        case "poison":
            return Color(.sRGB, red: 150.0/255.0, green: 75.0/255.0, blue: 150.0/255.0, opacity: 1.0)
        case "grass":
            return Color(.sRGB, red: 140.0/255.0, green: 195.0/255.0, blue: 95.0/255.0, opacity: 1.0)
        case "electric":
            return Color(.sRGB, red: 240.0/255.0, green: 210.0/255.0, blue: 80.0/255.0, opacity: 1.0)
        case "normal":
            return Color(.sRGB, red: 170.0/255.0, green: 165.0/255.0, blue: 130.0/255.0, opacity: 1.0)
        case "fairy":
            return Color(.sRGB, red: 205.0/255.0, green: 130.0/255.0, blue: 170.0/255.0, opacity: 1.0)
        case "ground":
            return Color(.sRGB, red: 220.0/255.0, green: 190.0/255.0, blue: 110.0/255.0, opacity: 1.0)
        case "fighting":
            return Color(.sRGB, red: 180.0/255.0, green: 60.0/255.0, blue: 50.0/255.0, opacity: 1.0)
        case "psychic":
            return Color(.sRGB, red: 230.0/255.0, green: 100.0/255.0, blue: 135.0/255.0, opacity: 1.0)
        case "rock":
            return Color(.sRGB, red: 180.0/255.0, green: 160.0/255.0, blue: 75.0/255.0, opacity: 1.0)
        case "ghost":
            return Color(.sRGB, red: 110.0/255.0, green: 90.0/255.0, blue: 140.0/255.0, opacity: 1.0)
        case "ice":
            return Color(.sRGB, red: 165.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, opacity: 1.0)
        case "dragon":
            return Color(.sRGB, red: 105.0/255.0, green: 70.0/255.0, blue: 245.0/255.0, opacity: 1.0)
        default:
            print("Miss color for: \(from)")
            return .clear
        }
    }
}

struct PokemonCellView: View {
    var pokemon: Pokemon
    @State var image = UIImage()
    var body: some View {
        ZStack {
            ZStack {
                Background(for: pokemon)
                    .cornerRadius(10.0)
                HStack {
                    VStack(alignment: .leading) {
                        Text("#\(pokemon.id)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Spacer()
//                        Text("Type:")
//                            .font(.caption)
//                            .foregroundColor(.secondary)
                        Text(pokemon.name)
                            .font(.title3)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    Spacer()
                }
            }
            .frame(height: 100.0)

            HStack {
                Spacer()
                Image(uiImage: image)
                    .resizable()
                    .frame(minWidth: 50.0, maxWidth: 100.0, minHeight: 50.0, maxHeight: 100.0, alignment: .center)
                    .aspectRatio(1.0, contentMode: .fit)
                    .offset(x: 10.0, y: -40.0)
                    .padding()
            }
        }
        .onAppear {
            pokemon.getImage {
                self.image = $0
            }
        }
    }
}

extension URLSession {
    static var autoCache: URLSession = {
        URLCache.shared.memoryCapacity = 64 * 1024 * 1024
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        return URLSession(configuration: configuration)
    }()
}

//struct PokemonRepository {
//    @Binding var pokemons: [Pokemon]
//
//    func fetchPokemons
//}

struct PokemonApiResponse: Codable {
    let results: [Pokemon]
}

struct PokemonSlot: Codable {
    let slot: Int
    let type: PokemonType
}

struct PokemonFromApi: Codable {
    let types: [PokemonSlot]
}

struct PokemonType: Codable {
    let name: String
}

struct Pokemon: Codable {
    let name: String
    let url: String
//    let image: String
//    let type: String

    var color: Color {
        return Color.blue
    }

    var id: Int {
        Int(url.split(separator: "/").last!)!
    }

    func getImage(image: @escaping (UIImage)->Void) {
        let url: URL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png")!
        //        https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png
        URLSession.autoCache.dataTask(with: url) { data, response, error in
            if error != nil { return }
            guard let data = data else { return }
            image(UIImage(data: data)!)
        }.resume()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
