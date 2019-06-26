//
//  PresenterInfoViewController.swift
//  Expo
//
//  Created by Chris Farley on 6/24/19.
//  Copyright © 2019 ADNAP. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PresenterInfoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var productList = [product]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func getPresenterInfo(name: String){
        let url = URL(string: "https://entrepreneur-expo.herokuapp.com/getPresenterInfo")
        let params: [String: Any] = ["name":name]
        Alamofire.request(url!, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { (response) in
            switch response.result{
            case.success:
                let data = JSON(response.data)
                let newPresenter = presenter()
                newPresenter.dictionaryToClass(dictionary: data.dictionaryObject! as NSDictionary)
                
                
               
                
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    func getPresenterProducts(name: String){
        let url = URL(string: "https://entrepreneur-expo.herokuapp.com/getPresenterProducts")
        let params: [String: Any] = ["name":name]
        Alamofire.request(url!, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { (response) in
            switch response.result{
            case.success:
                let data = JSON(response.data)
                let newProduct = product()
                newProduct.dictionaryToClass(dictionary: data.dictionaryObject! as NSDictionary)
                
                
                
                
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "product", for: indexPath) as! ProductCollectionViewCell
        let cellproduct = self.productList[indexPath.row]
    
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
