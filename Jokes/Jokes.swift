//
//  Jokes.swift
//  Jokes
//
//  Created by mani on 2021-02-09.
//

import Foundation

class Jokes: ObservableObject {
    @Published var items = [Joke]()
    @Published var showFavorites = false
    private static var savedFileURL: URL {
        return FileManager.default.documentsDirectory.appendingPathComponent("jokes.json")
    }

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

    func markAsFavorite(joke: Joke) {
        guard let selectedIndex = items.firstIndex(where: { $0.id == joke.id }) else { return }
        items[selectedIndex].isFavorite.toggle()
    }
}

extension Jokes {
    func load(completion: (() -> Void)?) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let savedJokes = try? JSONDataManager<Joke>().read(from: Self.savedFileURL) else {
                return
            }

            DispatchQueue.main.async {
                self?.items = savedJokes
                completion?()
            }
        }
    }

    func save() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let items = self?.items else { fatalError("Self out of scope") }

            do {
                try JSONDataManager().write(data: items, to: Self.savedFileURL)
            } catch {
                print("Failed to save jokes.")
            }
        }
    }
}
