//
//  CreateSessKey.swift
//  LoginTimetonicApp
//
//  Created by Leidy Luna on 24/01/24.
//

import Foundation

struct SessKeyModel : Codable{
    let status: String
    let sesskey: String?
    let id: String?
    let createdVNB: String?
    let req: String?
}
