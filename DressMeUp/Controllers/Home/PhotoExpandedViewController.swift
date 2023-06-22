import UIKit
import SnapKit

class PhotoExpandedViewController: UIViewController {
    
    // MARK: This VC specific
    var photoImageView: UIImageView = {
       var photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        photoImageView.layer.cornerRadius = 3
        photoImageView.image = UIImage(systemName: "exclamationmark.circle.fill")
        return photoImageView
    }()
    
    
    // MARK: Labels
    lazy var inspirationsLabel : UILabel = {
        var inspirationsLabel = UILabel()
        inspirationsLabel.text = "Inspirations"
        inspirationsLabel.font = UIFont(name: "Lato-Black", size: 30)
        inspirationsLabel.textColor = UIColor.primaryLabelColor
        return inspirationsLabel
    }()
    
    var photoItemName: UILabel = {
        var photoItemName = UILabel()
        photoItemName.text = "Black Trousers"
        photoItemName.font = UIFont(name: "Lato-Regular", size: 16)
        return photoItemName
    }()
    
    var heartImageButton: UIButton = {
        var heartImageButton = UIButton()
        let heartImage = UIImage(systemName: "heart")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        heartImageButton.setBackgroundImage(heartImage, for: .normal)
        return heartImageButton
    }()
    
    var imageLiked = false
    
    // MARK: Container Views
    lazy var topBar : UIView = {
        var topBar = UIView()
        topBar.backgroundColor = UIColor.mainThemeColor
        topBar.addSubview(inspirationsLabel)
        return topBar
    }()
    
    lazy var labelStack: UIStackView = {
        var labelStack = UIStackView()
        labelStack.axis = .horizontal
        labelStack.distribution = .fill
        labelStack.alignment = .center
        labelStack.addArrangedSubview(photoItemName)
        labelStack.addArrangedSubview(heartImageButton)
        return labelStack
    }()
    

    // MARK: Main Calling Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor.mainBackgroundColor
        
        view.addSubview(topBar)
        view.addSubview(photoImageView)
        view.addSubview(labelStack)
        
//        heartImageButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
                
        // MARK: Constraints
        topBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview()
            make.height.equalTo(90)
        }
        inspirationsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(topBar)
            make.left.equalTo(topBar).offset(20)
        }
        
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(topBar.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(400)
        }
        
        labelStack.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        heartImageButton.snp.makeConstraints { make in
            make.height.width.equalTo(25)
        }
        
        
    }
    
//    @objc func likeButtonTapped() {
//        imageLiked = true
//        let heartImage = UIImage(systemName: "heart.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
//        heartImageButton.setBackgroundImage(heartImage, for: .normal)
//    }
    
}
