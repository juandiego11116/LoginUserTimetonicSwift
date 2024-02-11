//
//  BooksViewController.swift
//  LoginTimetonicApp
//
//  Created by Leidy Luna on 7/02/24.
//

import Foundation
import UIKit

protocol BooksViewControllable: AnyObject {
    func displayBooks(_ books: GetAllBooksModel)
}

class BooksViewController: UIViewController,  BooksViewControllable{
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: BooksPresenter!
    let apiClient = ApiClient()
    var sessKey: String?
    var o_u: String?
    var books = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.BookElements.BOOK_CELL_NIB, bundle: nil), forCellReuseIdentifier: Constants.BookElements.REUSABLE_BOOK_CELL)
        presenter = BooksPresenter(booksRepository: BooksRepository(booksDataSource: ApiService(apiClient: apiClient)), booksView: self)
        presenter.getBooks(sessionKey: self.sessKey ?? "nil", o_u: self.o_u ?? "nil")
     }
    
    func displayBooks(_ books: GetAllBooksModel) {
        self.books = books.allBooks.books
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension BooksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusebleBookCell", for: indexPath) as! BookCell
        let book = books[indexPath.row]
        cell.configure(with: book)
        
        return cell
    }
}


