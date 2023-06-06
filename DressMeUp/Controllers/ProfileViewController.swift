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
    
    var emailField = getFieldContainer(textLabel: "Email", textLabelValue: "sangesherpa1215@gmail.com")
    var genderField = getFieldContainer(textLabel: "Gender", textLabelValue: "Male")
    var phoneField = getFieldContainer(textLabel: "Phone", textLabelValue: "98233123231")
    
    var changePasswordField = getFieldContainer(textLabel: "Change Password", textLabelValue: "• • • • • • •")
    var changePasswordArrowButton: UIButton = {
        var btn = UIButton()
        let image = UIImage(systemName: "arrow.right")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        btn.setBackgroundImage(image, for: .normal)
        btn.addTarget(self, action: #selector(changePasswordTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var fieldContainer: UIStackView = {
       var fieldContainer = UIStackView()
        fieldContainer.axis = .vertical
        
        fieldContainer.addArrangedSubview(emailField)
        fieldContainer.addArrangedSubview(genderField)
        fieldContainer.addArrangedSubview(phoneField)
        fieldContainer.addArrangedSubview(changePasswordField)
        return fieldContainer
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
        view.addSubview(fieldContainer)
        view.addSubview(changePasswordArrowButton)
        
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


        fieldContainer.snp.makeConstraints { make in
            make.top.equalTo(topHalfView.snp.bottom)
            make.left.right.equalToSuperview()
        }
        changePasswordArrowButton.snp.makeConstraints { make in
            make.top.equalTo(changePasswordField.snp.top).offset(30)
            make.right.equalToSuperview().offset(-20)
            make.width.height.equalTo(20)
        }
    }
    
    
    @objc func changePasswordTapped() {
        present(TestViewController(), animated: true)
    }
}
