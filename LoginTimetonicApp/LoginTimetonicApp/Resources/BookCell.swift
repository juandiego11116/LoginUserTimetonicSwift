import UIKit

/// A custom table view cell used to display information about a book.
class BookCell: UITableViewCell {
    
    /// The view displaying the book.
    @IBOutlet weak var BookView: UIView!
    
    /// The image view displaying the book image.
    @IBOutlet weak var imageBook: UIImageView!
    
    /// The label displaying the title of the book.
    @IBOutlet weak var titleBook: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /// Configures the cell with the given book data.
    ///
    /// - Parameter book: The book data to display.
    func configure(with book: Book) {
        titleBook.text = book.ownerPrefs.title
        
        // Load the book image from the URL
        if let imageUrl = URL(string: Constants.Api.BASE_URL_Image + book.ownerPrefs.oCoverImg) {
            URLSession.shared.dataTask(with: imageUrl) { [weak self] (data, response, error) in
                guard let data = data, error == nil else {
                    print("Error loading image:", error?.localizedDescription ?? "Unknown error")
                    return
                }
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.imageBook?.image = image
                    }
                }
            }.resume()
        }
    }
}
