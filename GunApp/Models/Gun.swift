//
//  Gun.swift
//  GunApp
//
//  Created by Keanu Interone on 3/11/19.
//  Copyright © 2019 Keanu Interone. All rights reserved.
//

import Foundation

class Gun {
    
    let name:String
    let caliber:String
    let imageURL:String
    
    init(json: [String : Any]) {
        name = json["name"] as? String ?? ""
        caliber = json["caliber"] as? String ?? ""
        imageURL = json["image_url"] as? String ?? ""
    }
    
    static func getAllGuns(completion: @escaping ([Gun]?, Bool) -> ()) {
        
        // create the url
        guard let url = URL(string: "https://gun-app.herokuapp.com/api/guns") else {completion(nil, false);return}
        
        // make the request
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // grab the data
            guard let dataResponse = data, error == nil else {completion(nil, false);return}
            
            // parse the json
            let jsonResponse:Any
            do {
                jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
            } catch {completion(nil, false);return}
            
            guard let gunsJson = jsonResponse as? [[String : Any]] else {completion(nil, false);return}
            
            // parse gun objects into array
            var guns = [Gun]()
            for gunJson in gunsJson {
                let gun = Gun(json: gunJson)
                guns.append(gun)
            }
            
            // return the guns
            completion(guns, true)
            
        }.resume()
        
    }
    
}
