//
//  DataManager.swift
//  PokedexZoom
//
//  Created by Stefano Brandi on 15/07/21.
//

import Foundation
import Alamofire

class DataManager {
    
    static let shared = DataManager()
    
    private let url = "https://pokeapi.co/api/v2/pokemon/?offset=&limit=1118"
    
    var getResults : PreResults = PreResults()
    
    var getDetail : PokemonDetail = PokemonDetail()
    
    var lastNumber = ""
    
    
    // alert connessione e caricamento
    func alertLoading(message: String) -> UIAlertController{
        let loading = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()
         
        loading.view.addSubview(loadingIndicator)
        
        return loading
    }
    
    
    func callPokemon(view: UIViewController?, completion: @escaping (Bool) -> ()) {
         
        let loading = alertLoading(message: "Loading, please wait")
         
        AF.request(url, method: .get)
            .responseJSON { (response) in
                
                view?.present(loading, animated: true, completion: nil)
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try? jsonDecoder.decode(PreResults.self, from: response.data!)
                
                if responseModel != nil { 
                    self.getResults = responseModel!
                    
                    loading.dismiss(animated: true, completion: nil)
                    completion(true)
                     
                } else {
                    print("Errore")
                }
                 
            }
        
    }
    
    
    func getImages(indexPath: Int) {
        let numberSprite = self.getResults.results![indexPath].url
        
        let separatorNumber = numberSprite!.split(separator: "/")
        
        self.lastNumber = "\(separatorNumber[5])"
    }
    
    
   
    
    func pokemonDetail(numPok: Int, completion: @escaping (Bool) -> ()) {
        
        let urlDetail = "https://pokeapi.co/api/v2/pokemon/\(numPok+1)/"
        print(urlDetail)
        
        AF.request(urlDetail, method: .get)
            .responseJSON { (response) in
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try? jsonDecoder.decode(PokemonDetail.self, from: response.data!)
                
                if responseModel != nil {
                    self.getDetail = responseModel!
                     
                    print(self.getDetail.name!)
                    completion(true)
                    
                } else {
                    print("Errore")
                }
                 
            }
        
    }
    
    
    
    
}


