//
//  RoomsCollectionViewCell.swift
//  StaffsDirectory
//
//  Created by Sandhya on 02/05/22.
//

import UIKit

class PeopleCollectionViewCell: UICollectionViewCell {
 
    private var stackView: UIStackView?
    
    private lazy var imageView: UIImageView =  {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private lazy var namelbl: UILabel =  {
        let namelbl = UILabel()
        namelbl.backgroundColor = .gray
        namelbl.translatesAutoresizingMaskIntoConstraints = false
        namelbl.text = "test"
        return namelbl
    }()
    
    private lazy var titlelbl: UILabel =  {
        let titlelbl = UILabel()
        titlelbl.backgroundColor = .gray
        titlelbl.translatesAutoresizingMaskIntoConstraints = false
        titlelbl.text = "test"
        return titlelbl
    }()
    
    private lazy var emaillbl: UILabel =  {
        let emaillbl = UILabel()
        emaillbl.backgroundColor = .gray
        emaillbl.translatesAutoresizingMaskIntoConstraints = false
        emaillbl.text = "test"
        return emaillbl
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addItemsToStackView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addItemsToStackView() {
        stackView = UIStackView(arrangedSubviews: [imageView, namelbl])
        stackView?.axis = .vertical
        stackView?.alignment = .fill
        stackView?.distribution = .fill
        stackView?.spacing = 2.0
        stackView?.translatesAutoresizingMaskIntoConstraints = false

        self.contentView.addSubview(stackView!)

    }
    private func setupConstraints() {
        stackView?.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0.0).isActive = true
        stackView?.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0.0).isActive = true
        stackView?.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0.0).isActive = true
        stackView?.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0.0).isActive = true
        
//        imageView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        
//        namelbl.setContentHuggingPriority(UILayoutPriority.init(rawValue: 253), for: .vertical)
//
//        titlelbl.setContentHuggingPriority(UILayoutPriority.init(rawValue: 252), for: .vertical)
    }
    
    func setData(staff: People) {
        namelbl.text = staff.firstName + staff.lastName
        setupURLImage(imageURL: staff.avatar)
    }
    
    func setupURLImage(imageURL:String) {
        ImageDownloader.shared.getImage(url: imageURL) { [weak self] data in
            DispatchQueue.main.async {
                self?.imageView.image = UIImage(data: data)
            }
        }
    }
}
