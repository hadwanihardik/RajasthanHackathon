//
//  TravellsViewController.swift
//  RoyalRajasthan
//
//  Created by Hardik on 12/2/17.
//  Copyright © 2017 Hardik. All rights reserved.
//

import UIKit

class TravelsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tblTravels: UITableView!

    var arrayForTravels = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        tblTravels.register(UINib(nibName: "TravelsTableViewCell", bundle: nil), forCellReuseIdentifier: "TravelsTableViewCell")

        arrayForTravels = DBHandler.selectData(fromTable: "travels")
        tblTravels.reloadData()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayForTravels.count//arrayPlaces.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "TravelsTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! TravelsTableViewCell
        
        var data = travels()
        
        data = Utils.getTravelsWithValues(dictLead:(arrayForTravels.object(at: indexPath.row) as! NSMutableDictionary))
        
//        cell.imvPlace.image = UIImage(named: data.name.uppercased)
        cell.btnEmail.setTitle(" : \(data.email as String)", for: .normal)
        cell.btnPhone.setTitle(" : \(data.phone as String)", for: .normal)
        cell.imvIcon.image = UIImage(named: data.logoimage as String)
        cell.lblTravelName.text = data.name as String
        
        
        return cell;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
