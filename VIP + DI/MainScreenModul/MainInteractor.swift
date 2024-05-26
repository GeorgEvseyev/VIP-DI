//
//  Interactor.swift
//  VIPER
//
//  Created by Георгий Евсеев on 3.05.24.
//

import UIKit

protocol IMainInteractor {
    func request()
}

protocol InteractorInput {
    func inputText(text: String)
}

class MainViewInteractor {
    private let networkManager: INetworkManager
    
    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }
}

extension MainViewInteractor: IMainInteractor {
    func request() {
        networkManager.sendRequest(adress: UrlString().baseUrlString, parser: networkManager.parse(data:))
    }
}

extension MainViewInteractor: InteractorInput {
    func inputText(text: String) {
        print(text)
    }
}
