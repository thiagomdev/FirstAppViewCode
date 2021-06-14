//
//  UserDetailTableViewCell.swift
//  PrimeiroAppViewCode
//
//  Created by Thiago Monteiro  on 19/04/21.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier: String = "UserDetailTableViewCell"
    
    // MARK: - Elements
    lazy var descriptionCell: MainUserDetailView = {
       let customView = MainUserDetailView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        return customView
    }()
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.descriptionCell)
        self.configConstraintDescriptionCell()
        //self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setUpCell(name: String) {
        self.descriptionCell.configNameLabel(name: name)
    }
    
    func configConstraintDescriptionCell() {
        self.descriptionCell.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
