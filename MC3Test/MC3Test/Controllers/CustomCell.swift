//
//  CustomCell.swift
//  MC3Test
//
//  Created by ParkJunHyuk on 2022/07/17.
//

import UIKit

class CustomCell : UITableViewCell {
    
    static let cellId = "CellId"
    
    lazy var HangleName : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25) // 기본 size 가 16
        return label
    }()
    
    lazy var EnglishName : UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        return label
    }()
    
    lazy var favoriteButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
//        button.tintColor = .secondaryLabel
        return button
    }()
    
    lazy var favorites : UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        image.image = UIImage(systemName: "star.fill")
//        image.setContentHuggingPriority(.required, for: .horizontal)
        
        return image
    }()
    
    lazy var RectangleView : UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 130)
        view.backgroundColor = UIColor.white
        
        view.layer.cornerRadius = 10
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 5
        return view
    }()
    
    
//    let HangleName = UILabel()
//    let EnglishName = UILabel()
    
    // 스토리보드로 셀을 작성하게 될 경우 초기화를 해주기 때문에 안해줘도 되지만 코드로 작성하게될 경우 작성해주어야 한다
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemneted")
    }
    
    func layout(){
        
        
        self.addSubview(RectangleView)
        
        RectangleView.translatesAutoresizingMaskIntoConstraints = false
        RectangleView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        RectangleView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        RectangleView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        RectangleView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        
        self.addSubview(HangleName)
        
        HangleName.translatesAutoresizingMaskIntoConstraints = false
        HangleName.leadingAnchor.constraint(equalTo: RectangleView.leadingAnchor, constant: 20).isActive = true
        HangleName.topAnchor.constraint(equalTo: RectangleView.topAnchor, constant: 20).isActive = true
        
        
        self.addSubview(EnglishName)
        
        EnglishName.translatesAutoresizingMaskIntoConstraints = false
        EnglishName.leadingAnchor.constraint(equalTo: RectangleView.leadingAnchor, constant: 20).isActive = true
        EnglishName.bottomAnchor.constraint(equalTo: RectangleView.bottomAnchor, constant: -20).isActive = true
        EnglishName.topAnchor.constraint(equalTo: HangleName.topAnchor, constant: 40).isActive = true
        
        
        self.addSubview(favoriteButton)
        
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.centerYAnchor.constraint(equalTo: RectangleView.centerYAnchor).isActive = true
        favoriteButton.rightAnchor.constraint(equalTo: RectangleView.rightAnchor, constant: -20).isActive = true
 
        
    }
}

