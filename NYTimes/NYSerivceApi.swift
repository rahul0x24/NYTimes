//
//  NYSerivceApi.swift
//  NYTimes
//
//  Created by Rahul Katariya on 20/05/15.
//  Copyright (c) 2015 Rahul Katariya. All rights reserved.
//

import Alamofire

let baseURL = "http://api.nytimes.com/svc/search/v2/"
let articlesURL = "articlesearch.json"
let APIKey = "sample-key"

class NYSerivceApi: NSObject {
    
    class func articles() -> SignalProducer<AnyObject, NSError> {
        
        return SignalProducer { sink, disposable in
            let url = baseURL + articlesURL
            let params = [
                "api-key" : APIKey,
                "fl" : "web_url,lead_paragraph,multimedia,byline,type_of_material,_id,pub_date,headline"
            ]
            
            let request = Alamofire.request(.GET, url, parameters: params)
                .responseJSON() { (_, _, JSON, error) -> Void in
                    if let error = error {
                        sendError(sink, error)
                    } else {
                        let transformer = NSValueTransformer.mtl_JSONDictionaryTransformerWithModelClass(NYArticleResponse)
                        let response = transformer.transformedValue(JSON!) as? NYArticleResponse
                        if let res = response {
                            sendNext(sink, res.docs)
                            sendCompleted(sink)
                        }
                    }
                }
            
            disposable.addDisposable {
                request.task.cancel()
            }
            
        }
    }
    
}
