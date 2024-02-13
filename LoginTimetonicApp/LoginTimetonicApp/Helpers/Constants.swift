import Foundation

/// A struct containing constants used in the application.
struct Constants {
    
    /// A struct containing API-related constants.
    struct Api {
        static let BASE_URL = "https://timetonic.com/live/api.php"
        static let BASE_URL_Image = "https://timetonic.com"
    }
    
    /// A struct containing authentication parameter constants.
    struct AuthParameter {
        static let VERSION = "1.47"
        static let REQUEST_APPKEY = "createAppkey"
        static let REQUEST_OAUTHKEY = "createOauthkey"
        static let REQUEST_SESSKEY = "createSesskey"
        static let APP_NAME = "logintimetonicswift"
    }
        
    /// A struct containing authentication parameter name constants.
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
    
    /// A struct containing user defaults key constants.
    struct UserDefaults {
        static let SESSION_KEY = "sessKey"
    }
    
    /// A struct containing books parameter constants.
    struct BooksParameter {
        static let REQUEST_GET_BOOK = "getAllBooks"
        static let SESSION_KEY = "sesskey"
    }
    
    /// A struct containing book elements constants.
    struct BookElements {
        static let REUSABLE_BOOK_CELL = "ReusebleBookCell"
        static let BOOK_CELL_NIB = "BookCell"
        static let BOOKS_VIEW = "BooksView"
    }
    
    struct Errors {
        static let ERROR_MESSAGE = "Error: Delegate not set or empty email/password."
        static let DOMAIN = "LoginErrorDomain"
    }
}
