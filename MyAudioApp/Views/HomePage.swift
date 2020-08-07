//
//  HomePage.swift
//  MyAudioApp
//
//  Created by Francisco Higuera Zamarripa on 28/06/20.
//  Copyright © 2020 Francisco Higuera Zamarripa. All rights reserved.
//

import UIKit

class HomePage: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var menuList = [MenuEntity]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageCell", for: indexPath) as! HomePageCell
               

        cell.tittleCell.text = menuList[indexPath.row].tittle
        cell.imgCell.image = menuList[indexPath.row].image

        return cell
    }
    

    @IBOutlet weak var headerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareView()
        initializeMenu()
        // Do any additional setup after loading the view.
    }
    
    
    func prepareView(){
        headerView.layer.shadowColor = UIColor(red:0/255.0, green: 0/255.0 ,blue: 0/255.0,alpha: 1.0).cgColor
        headerView.layer.borderColor = UIColor(red:255/255.0, green: 255/255.0 ,blue: 255/255.0,alpha:1.0).cgColor
        headerView.layer.shadowOffset = CGSize(width:0, height:1.75)
        headerView.layer.shadowRadius = 1.75
        headerView.layer.shadowOpacity = 0.9
        headerView.layer.cornerRadius = 30
    }
    
    func initializeMenu(){
        menuList.append(MenuEntity(image: UIImage(named: "elizabeth")!, tittle: "Anime"))
        menuList.append(MenuEntity(image: UIImage(named: "elizabeth")!, tittle: "Pop"))
        menuList.append(MenuEntity(image: UIImage(named: "elizabeth")!, tittle: "Rock"))
        menuList.append(MenuEntity(image: UIImage(named: "elizabeth")!, tittle: "Metal"))
        menuList.append(MenuEntity(image: UIImage(named: "elizabeth")!, tittle: "Regaeton"))
        menuList.append(MenuEntity(image: UIImage(named: "elizabeth")!, tittle: "Pa LLorar"))
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
