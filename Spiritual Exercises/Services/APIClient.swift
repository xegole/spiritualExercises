import Alamofire

class APIClient{
    
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T>)->Void) -> DataRequest {
        return Alamofire.request(route).responseJSONDecodable(decoder: decoder){ (response: DataResponse<T>) in
                completion(response.result)
        }
    }
    
    static func login(email: String, password: String, completion:@escaping (Result<User>)->Void) {
        performRequest(route: APIRouter.login(email: email, password: password), completion: completion)
    }
    
    static func getExercises(completion:@escaping (Result<GetExercisesResponse>)->Void) {
        performRequest(route: APIRouter.excercises, completion: completion)
    }
}
