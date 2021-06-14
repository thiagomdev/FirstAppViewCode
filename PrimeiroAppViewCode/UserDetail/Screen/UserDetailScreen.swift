//
//  UserDetailScreen.swift
//  PrimeiroAppViewCode
//
//  Created by Thiago Monteiro  on 19/04/21.
//

import UIKit

class UserDetailScreen: UIView {
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(UserDetailTableViewCell.self, forCellReuseIdentifier: UserDetailTableViewCell.identifier)
        table.backgroundColor = .white
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addComponents()
        self.configBackGround()
        self.configConstraintTableView()
        
    }
    
    private func configBackGround() {
        self.backgroundColor = .white
    }
    public func configTableViewDelegate(delegate: UITableViewDelegate, dataSouce: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSouce
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        self.addSubview(tableView)
    }
    
    func configConstraintTableView() {
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
