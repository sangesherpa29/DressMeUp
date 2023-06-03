import UIKit
import SnapKit

class PhotoExpandedViewController: UIViewController {
    
    // MARK: Color Variables
    var primaryLabelColor : UIColor = {
        return UIColor(red: 238/255, green: 245/255, blue: 219/255, alpha: 1)
    }()
    
    var primaryColor : UIColor = {
        return UIColor(red: 79/255, green: 99/255, blue: 103/255, alpha: 1)
    }()
    
    var backgroundColor : UIColor = {
        return UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
    }()
    
    // MARK: This VC specific
    var photoImageView: UIImageView = {
       var photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.image = UIImage(systemName: "exclamationmark.circle.fill")
        photoImageView.backgroundColor = .gray
        return photoImageView
    }()
    
    
    // MARK: Labels
    lazy var inspirationsLabel : UILabel = {
        var inspirationsLabel = UILabel()
        inspirationsLabel.text = "Inspirations"
        inspirationsLabel.font = UIFont(name: "Lato-Black", size: 30)
        inspirationsLabel.textColor = primaryLabelColor
        return inspirationsLabel
    }()
    
    lazy var cameraButton: UIButton = {
        var cameraButton = UIButton()
        let image = UIImage(systemName: "camera.circle")?.withTintColor(primaryLabelColor, renderingMode: .alwaysOriginal)
        
        cameraButton.setBackgroundImage(image, for: .normal)
        return cameraButton
    }()
    
    lazy var topBarStack : UIStackView = {
        var topBarStack = UIStackView()
        topBarStack.axis = .horizontal
        topBarStack.alignment = .center
        topBarStack.distribution = .fill
        
        topBarStack.addArrangedSubview(inspirationsLabel)
        topBarStack.addArrangedSubview(cameraButton)
        return topBarStack
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
    
    // MARK: Container Views
    lazy var topBar : UIView = {
        var topBar = UIView()
        topBar.backgroundColor = primaryColor
        topBar.addSubview(topBarStack)
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
        view.backgroundColor = backgroundColor
        
        view.addSubview(topBar)
        view.addSubview(photoImageView)
        view.addSubview(labelStack)
                
        // MARK: Constraints
        topBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview()
            make.height.equalTo(100)
        }
        topBarStack.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.bottom.equalToSuperview().offset(-20)
        }
        cameraButton.snp.makeConstraints { make in
            make.width.height.equalTo(50)
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
}
