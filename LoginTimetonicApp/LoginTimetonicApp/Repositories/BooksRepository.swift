//
//  BooksRepository.swift
//  LoginTimetonicApp
//
//  Created by Leidy Luna on 7/02/24.
//

import Foundation

class BooksRepository {
    
    private let bookDataSource: DataSourceProtocols
    
    init(booksDataSource: DataSourceProtocols) {
        self.bookDataSource = booksDataSource
    }
    
    func getAllBooks(o_u: String, sessionKey: String, completion: @escaping (Result<GetAllBooksModel, Error>) -> Void) {
        bookDataSource.getAllBooks(o_u: o_u, sessionKey: sessionKey) { result in
            completion(result)
        }
    }
}
