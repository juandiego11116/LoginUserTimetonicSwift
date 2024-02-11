import Foundation
import UIKit

/// Protocol defining methods for controlling the display of books.
protocol BooksViewControllable: AnyObject {
    func displayBooks(_ books: GetAllBooksModel)
}

/// View controller responsible for displaying books.
class BooksViewController: UIViewController,  BooksViewControllable{
    
    /// Outlet for the table view displaying the books.
    @IBOutlet weak var tableView: UITableView!
    
    /// The presenter responsible for managing the presentation logic related to books.
    var presenter: BooksPresenter!
    
    /// Instance of the API client for making network requests.
    let apiClient = ApiClient()
    
    /// Session key for authentication.
    var sessKey: String?
    
    /// o_u value associated with the user.
    var o_u: String?
    
    /// Array containing the books to be displayed.
    var books = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set table view data source
        tableView.dataSource = self
        
        // Register custom cell
        tableView.register(UINib(nibName: Constants.BookElements.BOOK_CELL_NIB, bundle: nil), forCellReuseIdentifier: Constants.BookElements.REUSABLE_BOOK_CELL)
        
        // Initialize and configure presenter
        presenter = BooksPresenter(booksRepository: BooksRepository(booksDataSource: ApiService(apiClient: apiClient)), booksView: self)
        
        // Fetch books data
        presenter.getBooks(sessionKey: self.sessKey ?? "nil", o_u: self.o_u ?? "nil")
    }
    
    /// Displays the fetched books on the table view.
    /// - Parameter books: The model containing the books data.
    func displayBooks(_ books: GetAllBooksModel) {
        self.books = books.allBooks.books
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource

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
