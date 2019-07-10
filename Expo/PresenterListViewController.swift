//
//  PresenterListViewController.swift
//  Expo
//
//  Created by Chris Farley on 7/9/19.
//  Copyright © 2019 ADNAP. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
class PresenterListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    
    @IBOutlet weak var presenterTableView: UITableView!
    var presenterList = [presenter]()
    var chosenPresenter = presenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenterTableView.delegate = self
        self.presenterTableView.dataSource = self
        
        self.getPresenters()

        // Do any additional setup after loading the view.
    }
    
    func getPresenters(){
        
        let url = URL(string: "https://entrepreneur-expo.herokuapp.com/getPresenters")
        
        Alamofire.request(url!, method: .post, encoding: JSONEncoding.default).responseJSON { (response) in
            switch response.result{
            case.success:
                let data = JSON(response.data)
                print(data)
                for tempPresenter in data{
                    let newPresenter = presenter()
                    newPresenter.dictionaryToClass(dictionary: tempPresenter.1.dictionaryObject as! NSDictionary)
                    
                    self.presenterList.append(newPresenter)
                    
                }
                self.presenterTableView.reloadData()
                
                
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newPresenter = presenterList[indexPath.row]
        let cell = presenterTableView.dequeueReusableCell(withIdentifier: "presenter", for: indexPath) as! PresenterTableViewCell
        
        cell.presenterNameLabel.text = newPresenter.name
        cell.presenterImageView.sd_setImage(with: URL(string: newPresenter.profilePictureURL!), placeholderImage: UIImage(named: "logo"))
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPresenter = presenterList[indexPath.row]
        let selectedPresenterCell = presenterTableView.cellForRow(at: indexPath) as! PresenterTableViewCell
        
        
        let homeStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = homeStoryboard.instantiateViewController(withIdentifier: "presenterInfo") as! PresenterInfoViewController
        
        vc.chosenPresenter = selectedPresenter
        vc.presenterImage = selectedPresenterCell.presenterImageView.image!
        self.navigationController?.pushViewController(vc, animated: true)
        
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
