//
//  Router.swift
//  UpdateNotifyingDemo
//
//  Created by mohamed hussein on 2/24/20.
//  Copyright © 2020 Mohamed Hussein. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

enum Router: URLRequestBuilder {
    
    case lookupForAppByBundelId(BundleId: String, country: String?)
    case lookupForAppByAppStoreId(AppStoreId: String, country: String?)
    
    var path: String{
        return ServerPaths.lookup.rawValue
    }
    
    var header: HTTPHeaders{
         return ["Content-Type":"application/json"]
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters? {
        var params = Parameters()
        params.updateValue("software", forKey: "entity")
        switch self {
        case .lookupForAppByBundelId(BundleId: let id, country: let countryCode):
            params.updateValue(id, forKey: "bundleId")
            params.updateValue(countryCode ?? "", forKey: "country")
        case .lookupForAppByAppStoreId(AppStoreId: let id, country: let countryCode):
            params.updateValue(id, forKey: "id")
            params.updateValue(countryCode ?? "", forKey: "country")
        }
        return params
    }
    
    func request<T: BaseModel>(_ model: T.Type) -> Observable<Any?> {
        let observalbe = Observable<Any?>.create { (observer) -> Disposable in
            AF.request(self).responseJSON { (response) in
                response.interceptResuest(self.requestURL.absoluteString, self.parameters)
                let resEnum = ResponseHandler.instance.handleResponse(response, model: model)
                observer.onNext(resEnum)
                observer.onCompleted()
            }
            return Disposables.create()
        }
        return observalbe
    }
}
