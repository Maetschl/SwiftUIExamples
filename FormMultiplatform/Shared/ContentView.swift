//
//  ContentView.swift
//  Shared
//
//  Created by Julian Arias Maetschl on 23-09-21.
//

import SwiftUI

struct ContentView: View {

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthdate = Date()
    @State private var shouldSendNewsletter = false
    @State private var numberOfLikes = 1

    private var tintColor: Color = .orange

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("First Name", text: $firstName)
                    TextField("First Name", text: $lastName)
                    DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                }

                Section(header: Text("Actions")) {
                    Toggle("Send newsletter", isOn: $shouldSendNewsletter)
                        .toggleStyle(SwitchToggleStyle(tint: tintColor))
                    Stepper("Number of likes", value: $numberOfLikes, in: 1...10)
                    Text("Number of likes: \(numberOfLikes)")
                    Link("Term of Services", destination: URL(string: "https://www.maetschl.com")!)
                }
            }
            .accentColor(tintColor)
            .navigationTitle("Account")
            .onTapGesture {
                hideKeyboard()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
