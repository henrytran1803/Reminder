//
//  api.swift
//  Reminder
//
//  Created by Tran Viet Anh on 01/03/2024.
//
import Foundation

func performLoginAPICall(username: String, password: String) async throws -> String {
    guard let url = URL(string: "http://localhost:8080/login/") else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"

    let loginString = "\(username):\(password)"
    guard let loginData = loginString.data(using: .utf8) else {
        throw NSError(domain: "Invalid login string", code: 0, userInfo: nil)
    }
    let base64LoginString = loginData.base64EncodedString()

    request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")

    let (data, _) = try await URLSession.shared.data(for: request)
    do {
           let token = try JSONDecoder().decode(UserToken.self, from: data)
           return token.value
       } catch {
           print("Error decoding JSON: \(error)")
           throw error
       }
   }
