import Foundation

/// A repository class responsible for handling book-related data operations.
class BooksRepository {
    
    private let bookDataSource: DataSourceProtocols
    
    /// Initializes the BooksRepository with a data source conforming to the DataSourceProtocols protocol.
    /// - Parameter booksDataSource: An object conforming to the DataSourceProtocols protocol.
    init(booksDataSource: DataSourceProtocols) {
        self.bookDataSource = booksDataSource
    }
    
    /// Retrieves all books associated with a user.
    /// - Parameters:
    ///   - o_u: The user identifier.
    ///   - sessionKey: The session key for authentication.
    ///   - completion: A closure to be executed when the operation completes, containing a result of type `Result<GetAllBooksModel, Error>`.
    func getAllBooks(o_u: String, sessionKey: String, completion: @escaping (Result<GetAllBooksModel, Error>) -> Void) {
        bookDataSource.getAllBooks(o_u: o_u, sessionKey: sessionKey) { result in
            completion(result)
        }
    }
}
