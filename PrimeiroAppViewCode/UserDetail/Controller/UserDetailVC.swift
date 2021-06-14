//
//  UserDetailVC.swift
//  PrimeiroAppViewCode
//
//  Created by Thiago Monteiro  on 19/04/21.
//

import UIKit

class UserDetailVC: UIViewController {
    
    
    var userDetailScreen: UserDetailScreen?
    
    override func loadView() {
        self.userDetailScreen = UserDetailScreen()
        self.userDetailScreen?.configTableViewDelegate(delegate: self, dataSouce: self)
        self.view = self.userDetailScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
}

extension UserDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
        cell?.setUpCell(name: "Play Music")
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
