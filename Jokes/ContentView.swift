//
//  ContentView.swift
//  Jokes
//
//  Created by mani on 2021-02-09.
//

import SwiftUI

struct ContentView: View {
    @StateObject var jokes = Jokes()

    var body: some View {
        NavigationView {
            VStack {
                List {
                    Toggle(isOn: $jokes.showFavorites) {
                        Text("Show Favorites")
                    }
                    
                    ForEach(jokes.items) { joke in
                        if !jokes.showFavorites || joke.isFavorite {
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
            }.onAppear {
                self.jokes.getJokes()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
