//
//  NetworkManager.swift
//  VIPER
//
//  Created by Георгий Евсеев on 3.05.24.
//

import UIKit

enum UrlStrings: String {
    case adress = "https://jsonplaceholder.typicode.com/users"
}

protocol INetworkManager {
    func sendRequest(adress: String, parser: (Data) -> Void)
    func parse(data: Data)
}

class NetworkManager: INetworkManager {
    
    var interactor: InteractorInput?
    
    func parse(data: Data) {
        if let json = try? JSONSerialization.jsonObject(with: data) as? [Any] {
        }
    }

    func sendRequest(adress: String, parser: (Data) -> Void) {
        guard let url = URL(string: adress) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil else { return }

            if let data = data {
                self.parse(data: data)
                self.interactor?.inputText(text: "\(data)")
            } else {
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}
