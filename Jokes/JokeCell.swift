//
//  JokeCell.swift
//  Jokes
//
//  Created by mani on 2021-02-14.
//

import SwiftUI

struct JokeCell: View {
    var text: String

    var body: some View {
        HStack {
            Image(systemName: "smiley")
                .resizable()
                .frame(width: 30.0, height: 30.0)
            Text("\(text)")
        }
        .padding([.top, .bottom])
    }
}

struct JokeCell_Previews: PreviewProvider {
    static var previews: some View {
        JokeCell(text: "Cat goes meow")
    }
}
