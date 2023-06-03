import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "i.circle")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTapGesture()
        
        backgroundColor = .none
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        contentView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func cellTapped(_ gestureRecognizer: UITapGestureRecognizer) {
        HomeViewController().navigationController?.pushViewController(PhotoExpandedViewController(), animated: true)
    }
}
