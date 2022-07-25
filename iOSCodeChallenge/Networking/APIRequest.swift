//
//  APIRequest.swift
//  iOSCodeChallenge
//
//  Created by Kevin Siundu on 25/07/2022.
//

import RxSwift
import Foundation

class APIRequest {
    let session = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask? = nil
    
    func callAPI<T: Codable>() -> Observable<T> {
        return Observable<T>.create { [weak self] observer in
            let url = URL(string: "https://images-api.nasa.gov/search?q=%22%22")!
            self?.dataTask = self?.session.dataTask(with: url, completionHandler: {
                (data, response, error) in                
                do {
                    let model: NasaAPIModel = try JSONDecoder().decode(NasaAPIModel.self, from: data ?? Data())
                    observer.onNext(model as! T)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            })
            
            self?.dataTask?.resume()
            
            return Disposables.create {
                self?.dataTask?.cancel()
            }
            
        }
    }
}
