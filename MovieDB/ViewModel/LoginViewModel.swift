//
//  LoginViewModel.swift
//  MovieDB
//
//  Created by Pedro Acevedo on 03/03/23.
//

import Foundation

public final class LoginViewModel: ObservableObject {
    @Published var loggedIn = false
    @Published var statusMessage = ""
    @Published var username = ""
    @Published var password = ""
    
    func login() async {
        let urlString = "https://api.themoviedb.org/3/authentication/token/new?api_key=a94ccb3836ae282e40420c45844214a8"
        let result = await fetchToken(for: URL(string: urlString)!)
        if let token = result {
            switch token.success {
            case true:
                await createSession(token: token.request_token ?? "")
            case false:
                statusMessage = token.status_message ?? "Error ocurred retrieveing access token"
            }
        }
    }
    
    func fetchToken(for url: URL) async -> Token? {
         do {
             let (data, _) = try await URLSession.shared.data(from: url)
             let decoder = JSONDecoder()
             decoder.keyDecodingStrategy = .convertFromSnakeCase
             let model = try decoder.decode(Token.self, from: data)
             return model
         } catch let err {
             statusMessage = err.localizedDescription
             return nil
         }
     }
    
    func createSession(token: String) async {
        let urlString = "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=a94ccb3836ae282e40420c45844214a8"
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let postString = "username=" + username + "&password=" + password + "&request_token=" + token
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place \(error.localizedDescription)")
                return
            }
            DispatchQueue.main.async {
                if let success = data {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    do {
                        let model = try decoder.decode(Token.self, from: success)
                        switch model.success {
                        case true:
                            self.loggedIn = true
                        case false:
                            self.loggedIn = false
                            self.statusMessage = "Invalid username and/or password. You did not provide a valid login"
                        }
                    } catch let err{
                        self.statusMessage = err.localizedDescription
                    }
                }
            }
        }
        task.resume()
    }
}
