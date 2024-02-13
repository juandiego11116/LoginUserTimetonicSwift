import Foundation

/// Presenter responsible for managing the presentation logic related to books.
class BooksPresenter {
    
    /// Weak reference to the view conforming to the `BooksViewControllable` protocol.
    weak var booksView: BooksViewControllable?
    
    /// The repository responsible for fetching books data.
    let booksRepository: BooksRepository
    
    /// Initializes the `BooksPresenter` with a `BooksRepository` and a view conforming to `BooksViewControllable`.
    /// - Parameters:
    ///   - booksRepository: The repository responsible for fetching books data.
    ///   - booksView: The view conforming to `BooksViewControllable`.
    init(booksRepository: BooksRepository, booksView: BooksViewControllable) {
        self.booksRepository = booksRepository
        self.booksView = booksView
    }
    
    /// Fetches the books data using the provided session key and o_u value.
    /// - Parameters:
    ///   - sessionKey: The session key used for authentication.
    ///   - o_u: The o_u value associated with the user.
    func getBooks(sessionKey: String, o_u: String) {
        booksRepository.getAllBooks(o_u: o_u, sessionKey: sessionKey) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let allBooksModel):
                // Filter out the contact books
                let filteredBooks = allBooksModel.allBooks.books.filter { ($0.contact_u_c == nil) }
                // New model with only non-contact books
                let filteredAllBooksModel = GetAllBooksModel(status: allBooksModel.status,
                                                             sstamp: allBooksModel.sstamp,
                                                             allBooks: AllBooks(nbBooks: filteredBooks.count,
                                                                                nbContacts: allBooksModel.allBooks.nbContacts,
                                                                                contacts: allBooksModel.allBooks.contacts,
                                                                                books: filteredBooks),
                                                             createdVNB: allBooksModel.createdVNB,
                                                             req: allBooksModel.req)
                self.booksView?.displayBooks(filteredAllBooksModel)
            case .failure(let error):
                print("Error fetching books: \(error.localizedDescription)")
            }
        }
    }
}

