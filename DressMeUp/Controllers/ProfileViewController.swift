import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    var imageContainer: UIImageView = {
        var imageContainer = UIImageView()
        imageContainer.contentMode = .scaleToFill
        imageContainer.image = UIImage(named: "user-placeholder")
        imageContainer.backgroundColor = .black
        imageContainer.clipsToBounds = true
        imageContainer.layer.cornerRadius = 75
        return imageContainer
    }()
    
    var nameLabel: UILabel = {
        var nameLabel = UILabel()
        nameLabel.text = "Lakpa Sange Sherpa"
        nameLabel.font = UIFont(name: "OpenSans-SemiBold", size: 15)
        nameLabel.textColor = UIColor.splashLabelColor
        return nameLabel
    }()
    
    lazy var topHalfView: UIView = {
        var topHalfView = UIView()
        topHalfView.backgroundColor = UIColor.mainThemeColor
        
        topHalfView.addSubview(imageContainer)
        topHalfView.addSubview(nameLabel)
        return topHalfView
    }()
    
    
    lazy var tableView: UITableView = {
       var tableView = UITableView()
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var logoutButton = customButton(backgroundColor: UIColor.mainThemeColor, title: "Log Out", titleColor: UIColor.splashLabelColor)
    
    // MARK: Main Calling Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.mainBackgroundColor
        
        view.addSubview(topHalfView)
        view.addSubview(tableView)
        view.addSubview(logoutButton)
        
        topHalfView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.height.equalTo(330)
        }
        imageContainer.snp.makeConstraints { make in
            make.width.height.equalTo(150)
            make.center.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageContainer.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(topHalfView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(400)
        }
        
        logoutButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(tableView.snp.bottom).offset(20)
        }

    }
}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as! ProfileTableViewCell
        
        // Configure the cell
        cell.label.text = "Email"
        cell.labelValue.text = "sangesherpa1215@gmail.com"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
