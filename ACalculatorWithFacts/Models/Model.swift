//
//  Model.swift
//  ACalculatorWithFacts
//
//  Created by elliott kung on 2020-08-28.
//  Copyright © 2020 elliott kung. All rights reserved.
//

import Foundation



class Model{
    
    func getNumberFact(number: String, completion: @escaping (NumberFact) -> Void){
        // create URL object
        guard let url = URL(string: "\(Constants.NUMBERS_URL)\(number)?json") else { return }
        
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error{
                    print(error)
                    return
                }
                
                guard let data = data else { return }
                
                do{
                    let decoder = JSONDecoder()
                    let numObj = try decoder.decode(NumberFact.self, from: data)
                    completion(numObj)
                }catch let jsonErr{
                    print(jsonErr)
                }
                
            }
        }
        task.resume()
        
    }
    
    
    
    
    
    
    
} // end of Model class


