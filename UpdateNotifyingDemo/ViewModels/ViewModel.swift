//
//  ViewModel.swift
//  UpdateNotifyingDemo
//
//  Created by mohamed hussein on 2/24/20.
//  Copyright © 2020 Mohamed Hussein. All rights reserved.
//

import Foundation
import RxSwift

class ViewModel: BaseViewModel, ViewModelType {
    
    struct Input{}
    
    struct Output{
        let needUpdate: Observable<Bool>
    }
    
    let input: ViewModel.Input
    let output: ViewModel.Output
    
    private let needUpdate = PublishSubject<Bool>()
    private let failuer = PublishSubject<[ErrorModel]>()
    
    override init() {
        input = Input()
        output = Output(needUpdate: needUpdate.asObservable())
    }
    
    func getAppData(appStoreId: String, country: String?){
        Router.lookupForAppByAppStoreId(AppStoreId: appStoreId, country: country).request(AppResult.self).subscribe { [unowned self] (event) in
            guard let resEnum = event.element, let response = resEnum as? ResponseEnum else { return }
            self.checkAppVersion(resEnum: response)
        }.disposed(by: bag)
    }
    
    func checkAppVersion(resEnum: ResponseEnum){
        switch resEnum {
        case .success(let value):
            guard let appResult = value as? AppResult,
                  let appData = appResult.results?.first,
                  let appProductionVersion = Double(appData.version ?? "0.0"),
                  let thisAppVersionStr = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
                  let thisAppVersion = Double(thisAppVersionStr) else { return }
            
            needUpdate.onNext( appProductionVersion > thisAppVersion )
        case .failure(_, let data):
            self.handelError(data: data, failuer: failuer)
        }
    }
    
    
}
