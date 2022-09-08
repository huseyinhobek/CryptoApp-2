//
//  Presenter.swift
//  CryptoViper
//
//  Created by Hüseyin HÖBEK on 7.09.2022.
//

import Foundation

// class, protocol
// talks to -> interactor, router, view

enum NetworkError : Error {
    case NetworkFailed
    case ParsingFailed
}

protocol AnyPresenter {
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    func interactorDidDownloadCrypto(result: Result<[Crypto],Error>)
    
}

class CryptoPresenter : AnyPresenter {
    
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            // view.update
            view?.update(with: cryptos)
        case .failure(_):
            //view.update error
            view?.update(with: "Try again later...")
        }
    }
    
    
    
}
