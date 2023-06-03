import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "ItemsTableViewCell"
    
    // MARK: Color Variables
    var primaryLabelColor : UIColor = {
        return UIColor(red: 238/255, green: 245/255, blue: 219/255, alpha: 1)
    }()
    
    var primaryColor : UIColor = {
        return UIColor(red: 79/255, green: 99/255, blue: 103/255, alpha: 1)
    }()
    
    var backColor : UIColor = {
        return UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
    }()
    
    // mainContainer - main container inside the cell that holds the scrollViewContainer.
    lazy var mainContainer: UIView = {
        var mainContainer = UIView()
        mainContainer.backgroundColor = .white
        mainContainer.addSubview(scrollViewContainer)
        return mainContainer
    }()
    
    // holds the scrollViewContainer to enable scrolling
    lazy var scrollViewContainer: UIView = {
        var scrollViewContainer = UIView()
        scrollViewContainer.backgroundColor = .blue
        scrollViewContainer.addSubview(imageContainerScrollView)
        return scrollViewContainer
    }()

    // imageContainer - horizontal scrolling container inside the mainContainer that holds the imageItems.
    lazy var imageContainerScrollView: UIScrollView = {
        var imageContainer = UIScrollView()
        imageContainer.isScrollEnabled = true
        imageContainer.showsHorizontalScrollIndicator = true
//        imageContainer.backgroundColor = .green
        imageContainer.addSubview(img1)
        imageContainer.addSubview(img2)
        imageContainer.addSubview(img3)
        return imageContainer
    }()
    
    var img1: UIImageView = {
       var img1 = UIImageView()
        img1.contentMode = .scaleAspectFill
        img1.image = UIImage(named: "img1")
        img1.backgroundColor = .red
       return img1
    }()
    
    var img2: UIImageView = {
       var img2 = UIImageView()
        img2.contentMode = .scaleAspectFill
        img2.image = UIImage(named: "img2")
        img2.backgroundColor = .red
       return img2
    }()
    
    var img3: UIImageView = {
       var img3 = UIImageView()
        img3.contentMode = .scaleAspectFill
        img3.image = UIImage(named: "img3")
        img3.backgroundColor = .red
       return img3
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        addSubview(mainContainer)
        
        mainContainer.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        }
        scrollViewContainer.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(15)
            make.right.bottom.equalToSuperview().offset(-15)
        }
        imageContainerScrollView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
            make.height.equalTo(120)
        }
        img1.snp.makeConstraints { make in
            make.width.height.equalTo(imageContainerScrollView.snp.height)
        }
    }
    
}
