//
//  ContentView.swift
//  Jokes
//
//  Created by mani on 2021-02-09.
//

import SwiftUI

enum Settings {
    static let showFavorites = "showFavorites"
}

struct ContentView: View {
    @StateObject var jokes = Jokes()
    @Environment(\.scenePhase) private var scenePhase
    @AppStorage(Settings.showFavorites) private var showFavorites: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                    Toggle(isOn: $showFavorites) {
                        Text("Show Favorites")
                    }

                    ForEach(jokes.items) { joke in
                        if !showFavorites || joke.isFavorite {
                            JokeCell(joke: joke)
                                .onTapGesture {
                                    jokes.markAsFavorite(joke: joke)
                                }
                        }
                    }
                    .onDelete { indexSet in
                        jokes.items.remove(atOffsets: indexSet)
                    }
                }
                .animation(.default)
                .listStyle(PlainListStyle())
                .navigationBarTitle("Jokes")

                FooterView(jokes: jokes)
            }
            .onAppear {
                jokes.load {
                    if self.jokes.items.count == 0 {
                        self.jokes.getJokes()
                    }
                }
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { jokes.save() }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
