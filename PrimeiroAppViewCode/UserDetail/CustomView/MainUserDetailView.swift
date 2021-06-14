//
//  UserDetailView.swift
//  PrimeiroAppViewCode
//
//  Created by Thiago Monteiro  on 19/04/21.
//

import UIKit

class MainUserDetailView: UIView {
    // MARK: - Elements
    lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "play.rectangle.fill")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    
    // MARK: - Super Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.userImageView)
        self.addSubview(self.nameLabel)
        self.configConstraintUserImageView()
        self.configConstraintNameLabel()
    
    }
    
    public func configNameLabel(name: String) {
        self.nameLabel.text = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configConstraintUserImageView() {
        self.userImageView.snp.makeConstraints { (make) in
            make.centerY.leading.equalToSuperview()
            make.height.width.equalTo(80)
        }
    }
    
    func configConstraintNameLabel() {
        self.nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.userImageView.snp.trailing).offset(20)
        }
    }
}
