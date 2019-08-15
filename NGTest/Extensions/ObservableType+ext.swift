//
//  ObservableType+ext.swift
//  NGTest
//
//  Created by Alban Pellegrini on 14/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import Alamofire
import Foundation
import RxSwift

enum MappingError: Error {
    case unmappable
}

extension ObservableType {
    
    public func mapObject<T: Codable>(type: T.Type) -> Observable<T> {
        return flatMap { data -> Observable<T> in
            print("D: \(data)")
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                let model = try JSONDecoder().decode(T.self, from: jsonData)
                return Observable.just(model)

            } catch {
                throw MappingError.unmappable
            }
        }
    }
    
    public func mapObject(type: Void.Type) -> Observable<Void> {
        return map { _ -> Void in return }
    }
}
