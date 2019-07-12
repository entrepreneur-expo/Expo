//
//  TicketsViewController.swift
//  Expo
//
//  Created by Chris Farley on 6/26/19.
//  Copyright © 2019 ADNAP. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
class TicketsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var ticketTableView: UITableView!
    var ticketList = [ticket]()
    var chosenTicket = ticket()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.ticketTableView.delegate = self
        self.ticketTableView.dataSource = self
        
        getTickets()

        // Do any additional setup after loading the view.
    }
    
    
    
    func getTickets(){
        let headers: HTTPHeaders = ["Authorization": "Bearer QJVMD772JXZ42YVI2KLK"]
        
        let url = URL(string: "https://www.eventbriteapi.com/v3/events/64299130430/?expand=ticket_classes")
        
        Alamofire.request(url!, method: .get, encoding: JSONEncoding.default,headers: headers).responseJSON { (response) in
            switch response.result{
            case.success:
                let data = JSON(response.data)
                print(data["ticket_classes"])
                for ticketClass in data["ticket_classes"]{
                    let newTicketClass = ticket()
                    newTicketClass.dictionaryToClass(dictionary: ticketClass.1.dictionaryObject as! NSDictionary)
                    print(newTicketClass.cost)
                    self.ticketList.append(newTicketClass)
                }
                self.ticketTableView.reloadData()
                
                
                
                
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticketList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newTicket = ticketList[indexPath.row]
        let cell = ticketTableView.dequeueReusableCell(withIdentifier: "ticket", for: indexPath) as! TicketTableViewCell
        
        cell.ticketName.text = newTicket.name
        //cell.ticketImageView.sd_setImage(with: URL(string: newTicket.image!), placeholderImage: UIImage(named: "logo"))
       
        
        
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
