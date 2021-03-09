//
//  JokeCell.swift
//  Jokes
//
//  Created by mani on 2021-02-14.
//

import SwiftUI

struct JokeCell: View {
    var joke: Joke

    var body: some View {
        HStack {
            if joke.isFavorite {
                Image(systemName: "face.smiling.fill")
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: 30.0, height: 30.0)
            } else {
                Image(systemName: "face.smiling")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
            }
            Text("\(joke.text)")
        }
        .padding([.top, .bottom])
    }
}

struct JokeCell_Previews: PreviewProvider {
    static let joke = Joke(id: "49484", text: "Hello", status: 43, isFavorite: CodableBool.init(wrappedValue: true))

    static var previews: some View {
        JokeCell(joke: joke)
    }
}
