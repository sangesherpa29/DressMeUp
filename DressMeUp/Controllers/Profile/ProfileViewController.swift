import UIKit
import SnapKit
import RxSwift
import RxGesture
import RxRelay

class ProfileViewController: RootViewController {
    
    // MARK: Relating to User's profile image
    // Bind this relay to userProfileImage
    let userProfileImageRelay  = BehaviorRelay<UIImage?>(value:nil)
    let userProfileImageURL  = BehaviorRelay<String?>(value:nil)
    
    let placeholderImage = UIImageView(image: UIImage(named: "user-placeholder")).apply { it in
        it.contentMode = .scaleAspectFit
        it.layer.cornerRadius = 75
        it.clipsToBounds = true
    }

    var userProfileImage: UIImageView = {
        var imageContainer = UIImageView()
        imageContainer.contentMode = .scaleToFill
        imageContainer = UIImageView(image: nil)
        imageContainer.backgroundColor = .black
        imageContainer.clipsToBounds = true
        imageContainer.layer.cornerRadius = 75
        return imageContainer
    }()

    var nameLabel: UILabel = {
        var nameLabel = UILabel()
        nameLabel.text = "Full name"
        nameLabel.font = UIFont(name: "OpenSans-SemiBold", size: 15)
        nameLabel.textColor = UIColor.splashLabelColor
        return nameLabel
    }()

    lazy var topHalfView: UIView = {
        var topHalfView = UIView()
        topHalfView.backgroundColor = UIColor.mainThemeColor
        topHalfView.addSubview(userProfileImage)
        topHalfView.addSubview(placeholderImage)
        topHalfView.addSubview(nameLabel)
        return topHalfView
    }()

    var emailField = getFieldContainer(textLabel: "Email", textLabelValue: "email")
    var genderField = getFieldContainer(textLabel: "Gender", textLabelValue: "gender")

    var changePasswordField = getFieldContainer(textLabel: "Change Password")
    var changePasswordArrowButton: UIButton = {
        var btn = UIButton()
        let image = UIImage(systemName: "arrow.right")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        btn.setBackgroundImage(image, for: .normal)
        return btn
    }()

    lazy var fieldContainer: UIStackView = {
       var fieldContainer = UIStackView()
        fieldContainer.axis = .vertical
        
        fieldContainer.addArrangedSubview(emailField)
        fieldContainer.addArrangedSubview(genderField)
        fieldContainer.addArrangedSubview(changePasswordField)
        return fieldContainer
    }()

    var logoutButton = customButton(backgroundColor: UIColor.mainThemeColor, title: "Log Out", titleColor: UIColor.splashLabelColor)
    
    
    override func setupUI() {
        view.backgroundColor = UIColor.mainBackgroundColor

        view.addSubview(topHalfView)
        view.addSubview(fieldContainer)
        view.addSubview(changePasswordArrowButton)

        changePasswordArrowButton.addTarget(self, action: #selector(changePasswordTapped), for: .touchUpInside)

        topHalfView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.height.equalTo(330)
        }
        placeholderImage.snp.makeConstraints { make in
            make.width.height.equalTo(150)
            make.center.equalToSuperview()
        }
        userProfileImage.snp.makeConstraints { make in
            make.width.height.equalTo(150)
            make.center.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(userProfileImage.snp.bottom).offset(20)
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
        let changePasswordVC = ChangePasswordViewController()
        self.navigationController?.pushViewController(changePasswordVC, animated: true)
    }
}
