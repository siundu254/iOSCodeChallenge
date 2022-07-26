//
//  HomeViewModel.swift
//  iOSCodeChallenge
//
//  Created by Kevin Siundu on 25/07/2022.
//

import Foundation
import RxSwift
import RxRelay

class HomeViewmodel {
    
    let request = APIRequest()
    var nasaData: Observable<NasaAPIModel>?
    private let nasaDataViewModel = BehaviorRelay<[NasaDataModel]>(value: [])
    
    var nasaDataViewModelObserver: Observable<[NasaDataModel]> {
        return nasaDataViewModel.asObservable()
    }
    
    private let disposeBag = DisposeBag()
    
    func fetchNasaDataCollection() {
        nasaData = request.callAPI()
        
        nasaData?.subscribe(
            onNext: { [weak self] collection in
                var nasaDataArray = [NasaDataModel]()
                for i in 0..<collection.collection.items.count {
                    let image = collection.collection.items[i].links[0].href
                    let name = collection.collection.items[i].data[0].title
                    let desc = collection.collection.items[i].data[0].description
                    let date = collection.collection.items[i].data[0].date_created
                    let photographer = collection.collection.items[i].data[0].photographer
                    
                    let data = NasaDataModel(
                        title: name,
                        date: date,
                        image: image,
                        description: desc,
                        photographer: photographer ?? "N/A"
                    )
                    
                    nasaDataArray.append(data)
                }
                
                self?.nasaDataViewModel.accept(nasaDataArray)
                
            },
            onError: { [weak self] error in
                _ = self?.nasaDataViewModel.catch { _ in
                    Observable.empty()
                }
            }
        ).disposed(by: disposeBag)
    }
}
