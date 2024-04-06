import Foundation
import Alamofire

final class MapViewControllerViewModel {
    
    func getLocations(completion: @escaping ([MapLocations]) -> Void) {
        let url = NetworkManager.baseURL + "/locations"
        
        AF.request(url, method: .get)
            .response { response in
                guard let data = response.data else { return }
                guard let result = try? JSONDecoder().decode(
                    [MapLocations].self,
                    from: data
                ) else {
                    return }
                completion(result)
            }
    }
    
}

struct MapLocations: Codable {
    let id: Int?
    let lat: Float?
    let lon: Float?
    let type: String?
    let name: String?
    let pictureUrl: String?
}
