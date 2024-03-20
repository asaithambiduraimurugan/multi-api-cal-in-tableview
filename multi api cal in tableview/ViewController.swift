//
//  ViewController.swift
//  multi api cal in tableview
//
//  Created by JAISHIVA SN on 29/02/24.
//

import UIKit

struct mani: Codable {
    var id: Int?
    
}
struct money: Codable {
    var login: String?
}


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hade.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "mask") as! starcTableViewCell
       // let bata = hade[indexPath.row]
        if let mydata = hade[indexPath.row] as? mani {  //  if let model = bata as? mani {
            if let idd = mydata.id {
            cell.click.text = String(idd)

        }
        }
        else if let modata = hade[indexPath.row] as? money {
            if let logan = modata.login {
                cell.check.text = logan
        }
        }
             
                //     // Configure cell for data from API 1
                // } else if let dataModel2 = data as? DataModel2 {
                //     // Configure cell for data from API 2
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    var a: [mani]?
    var b: [money]?
    var hade: [Any] = []
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
        gotdata()
       // tableview.reloadData()
        // Do any additional setup after loading the view.
    }

    func getdata() {
        let url = URL(string: "https://api.github.com/users/hadley/repos")
        let task = URLSession.shared.dataTask(with: url!) {
            (data,response,error) in
            do {
                let contest = try? JSONDecoder().decode([mani].self, from: data!)
                self.a = contest
                self.hade.append(contentsOf: self.a!)

               // self.ha
            
            DispatchQueue.main.async {
                self.tableview.reloadData()
                
            }
            } catch {
                print(error)
                
            }

        }
        task.resume()
        
    }
    func gotdata() {
        let url = URL(string: "https://api.github.com/users/hadley/orgs")
        let task = URLSession.shared.dataTask(with: url!) {
            (data,response,error) in
            do {
                let contest = try? JSONDecoder().decode([money].self, from: data!)
                self.b = contest
                self.hade.append(contentsOf: self.b!)
               // print(self.hade)

            
            DispatchQueue.main.async {
            self.tableview.reloadData()
                
            }
            } catch {
                print(error)
                
            }

        }
        task.resume()
}
    

}
