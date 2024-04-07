//
//  TracksViewModel.swift
//  tourist
//
//  Created by user on 07.04.2024.
//

import Foundation
import Alamofire

final class TemplatesViewModel {
    
    func getTracks(completion: @escaping ([Tracks]) -> Void) {
        let url = NetworkManager.baseURL + "/paths"
        
        AF.request(url, method: .get)
            .response { response in
                guard let data = response.data else { return }
                guard let result = try? JSONDecoder().decode(
                    [Tracks].self,
                    from: data
                ) else {
                    return }
                completion(result)
            }
    }
}

struct Tracks: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let price: Int?
    let locations: [Locations]
}

struct Locations : Codable {
    let id: Int?
    let lat: Float?
    let lon: Float?
    let type: String?
    let name: String?
    let pictureUrl: String?
}
