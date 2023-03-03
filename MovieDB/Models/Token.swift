//
//  Token.swift
//  MovieDB
//
//  Created by Pedro Acevedo on 03/03/23.
//

import Foundation

public struct Token: Codable {
    let status_message: String?
    let success: Bool
    let expires_at: String?
    let request_token: String?
}

