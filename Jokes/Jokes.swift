//
//  Jokes.swift
//  Jokes
//
//  Created by mani on 2021-02-09.
//

import Foundation

class Jokes: ObservableObject {
    @Published var items = [Joke]()

    func getJokes() {
        let url = URL(string: "https://icanhazdadjoke.com/")!
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let data = data {
                if let joke = try? JSONDecoder().decode(Joke.self,
                                                        from: data) {
                    DispatchQueue.main.async {
                        self.items.insert(joke, at: 0)
                    }
                    return
                }
            }
        }
        task.resume()
    }
}
