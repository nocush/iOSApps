//
//  ViewController.swift
//  Lab7_1
//
//  Created by Mateusz Bartoszek on 27/03/2023.
//

import UIKit

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("row of table view")
    }
    
    func tableView(_ tableView: UITableView, tittleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Houses"
        }
        else if section == 1 {
            return "Flats"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView)-> Int{
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return houses.count
        }
        else if section == 1{
            return flats.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "houses", for: indexPath) as! HouseCell
            cell.houseName?.text = houses[indexPath.row].name
            cell.housePhoto?.image = UIImage(named: houses[indexPath.row].photoPath)
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "flats", for: indexPath) as! FlatCell
            cell.flatName?.text = flats[indexPath.row].name
            cell.flatPhoto?.image = UIImage(named: flats[indexPath.row].photoPath)
            return cell
        }
        return UITableViewCell()
    }
}

class HouseCell: UITableViewCell {
    @IBOutlet var houseName: UILabel!
    @IBOutlet var housePhoto: UIImageView!
}

class FlatCell: UITableViewCell {
    @IBOutlet var flatName: UILabel!
    @IBOutlet var flatPhoto: UIImageView!
}

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var houses = [
        House(name: "House 1", houseArea: 127.8, roomCount: 3, floorCount: 1, landArea: 170.4, photoPath: "house1"),
        House(name: "House 2", houseArea: 227.8, roomCount: 5, floorCount: 2, landArea: 270.4, photoPath: "house2"),
        House(name: "House 3", houseArea: 337.8, roomCount: 7, floorCount: 2, landArea: 370.4, photoPath: "house3")
    ]
    
    var flats = [
        Flat(name: "Flat 1", area: 92.37, roomCount: 4, isDuplex: true, photoPath: "flat1"),
        Flat(name: "Flat 2", area: 54.42, roomCount: 3, isDuplex: false, photoPath: "flat2"),
        Flat(name: "Flat 3", area: 25.4, roomCount: 1, isDuplex: false, photoPath: "flat1")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }


}

