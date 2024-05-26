//
//  Presenter.swift
//  VIPER
//
//  Created by Георгий Евсеев on 3.05.24.
//

import UIKit


protocol IMainPresenter {
    func buttonPressed()
}

final class MainPresenter: IMainPresenter {
    
    private let interactor: IMainInteractor
    weak var view: IMainViewController?
    
    init(interactor: IMainInteractor, view: IMainViewController? = nil) {
        self.interactor = interactor
        self.view = view
    }
    
    func buttonPressed() {
        interactor.request()
    }

}

