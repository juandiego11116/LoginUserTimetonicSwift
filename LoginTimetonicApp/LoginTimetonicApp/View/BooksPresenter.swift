//
//  BooksPresenter.swift
//  LoginTimetonicApp
//
//  Created by Leidy Luna on 7/02/24.
//

import Foundation

class BooksPresenter {
    weak var booksView: BooksViewControllable?
    let booksRepository: BooksRepository
    
    init(booksRepository: BooksRepository, booksView: BooksViewControllable) {
            self.booksRepository = booksRepository
            self.booksView = booksView
        }
    
    func getBooks(sessionKey: String, o_u: String) {
        booksRepository.getAllBooks(o_u: o_u, sessionKey: sessionKey) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let allBooksModel):
                self.booksView?.displayBooks(allBooksModel)
            case .failure(let error):
                print("Error fetching books: \(error.localizedDescription)")
            }
        }
    }
}
