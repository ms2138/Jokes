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
                    ForEach(jokes.items) { joke in
                        JokeCell(text: joke.text)
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
