//
//  FooterView.swift
//  Jokes
//
//  Created by mani on 2021-02-13.
//

import SwiftUI

struct FooterView: View {
    var jokes: Jokes

    var body: some View {
        VStack(spacing: 5) {
            Text("Jokes: \(jokes.items.count)")
                .font(.footnote)
            Button(action: {
                self.jokes.getJokes()
            }, label: {
                Text("Get Another Joke")
                    .foregroundColor(.blue)
                    .font(.caption)
            })
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var jokes = Jokes()

    static var previews: some View {
        FooterView(jokes: jokes)
    }
}
