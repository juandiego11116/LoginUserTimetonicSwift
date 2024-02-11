//
//  BookCell.swift
//  LoginTimetonicApp
//
//  Created by Leidy Luna on 10/02/24.
//

import UIKit

class BookCell: UITableViewCell {
    
    @IBOutlet weak var BookView: UIView!
    @IBOutlet weak var imageBook: UIImageView!
    @IBOutlet weak var titleBook: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with book: Book) {
        titleBook.text = book.ownerPrefs.title
        if let imageUrl = URL(string: Constants.Api.BASE_URL_Image + book.ownerPrefs.oCoverImg) {
            URLSession.shared.dataTask(with: imageUrl) { [weak self] (data, response, error) in
                guard let data = data, error == nil else {
                    print("Error cargando la imagen:", error?.localizedDescription ?? "Error desconocido")
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
