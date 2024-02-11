//
//  Constants.swift
//  LoginTimetonicApp
//
//  Created by Leidy Luna on 28/01/24.
//

import Foundation

struct Constants {
    struct Api {
        static let BASE_URL = "https://timetonic.com/live/api.php"
        static let BASE_URL_Image = "https://timetonic.com"
    }
    
    struct AuthParameter {
        static let VERSION = "1.47"
        static let REQUEST_APPKEY = "createAppkey"
        static let REQUEST_OAUTHKEY = "createOauthkey"
        static let REQUEST_SESSKEY = "createSesskey"
        static let APP_NAME = "logintimetonicswift"
    }
        
    struct AuthParameterName {
        static let VERSION = "version"
        static let REQUEST = "req"
        static let APP_NAME = "appname"
        
        static let LOGIN = "login"
        static let PASSWORD = "pwd"
        static let APP_KEY = "appkey"
        
        static let O_U = "o_u"
        static let U_C = "u_c"
        static let OAUTH_KEY = "oauthkey"
        
    }
    
    struct userDefaulds {
        static let SESSION_KEY = "sessKey"
    }
    
    struct BooksParameter {
        
        static let REQUEST_GET_BOOK = "getAllBooks"
        static let SESSION_KEY = "sesskey"
        
    }
    
    struct BookElements {
        static let REUSABLE_BOOK_CELL = "ReusebleBookCell"
        static let BOOK_CELL_NIB = "BookCell"
        static let BOOKS_VIEW = "BooksView"
    }
}
