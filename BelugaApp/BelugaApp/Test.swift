//
//  Test.swift
//  BelugaApp
//
//  Created by Julian Arias Maetschl on 04-10-21.
//

import Foundation

struct Pokemon {
    let name: String
}

class SomeRepository {


    func getData(onFinish: @escaping ([Pokemon])->(Void)) {

        URLSession.shared.dataTask(with: URL(string: "")!) { data, response, error in
            // validation
            let array: [Pokemon] = [Pokemon(name: "Some Pokemon"), Pokemon(name: "Some Pokemon2")]
            array
                .map { p in p }
                .sorted { $0.name > $1.name }
            onFinish(array)
        }.resume()
    }
}
