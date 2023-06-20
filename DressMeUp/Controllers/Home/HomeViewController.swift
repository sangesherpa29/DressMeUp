import UIKit
import SnapKit

class HomeViewController: UIViewController {

    var imageArray = ["img1", "img2", "img3", "img4"]

    var flowlayout: UICollectionViewFlowLayout = {
        var flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        flowlayout.minimumInteritemSpacing = 10
        flowlayout.minimumLineSpacing = 10
        return flowlayout
    }()

    lazy var collectionView : UICollectionView = {
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.backgroundColor = UIColor.mainBackgroundColor
        return collectionView
    }()

    
    // MARK: Labels
    lazy var inspirationsLabel : UILabel = {
        var inspirationsLabel = UILabel()
        inspirationsLabel.text = "Inspirations"
        inspirationsLabel.font = UIFont(name: "OpenSans-Bold", size: 28)
        inspirationsLabel.textColor = UIColor.primaryLabelColor
        return inspirationsLabel
    }()
    
    lazy var cameraButton: UIButton = {
        var cameraButton = UIButton()
        let image = UIImage(systemName: "camera.circle")?.withTintColor(UIColor.primaryLabelColor, renderingMode: .alwaysOriginal)
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


    // MARK: Container Views
    lazy var topBar : UIView = {
        var topBar = UIView()
        topBar.backgroundColor = UIColor.mainThemeColor
        topBar.addSubview(topBarStack)
        return topBar
    }()


    // MARK: Main Calling method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


    private func setupUI() {
        view.backgroundColor = UIColor.mainBackgroundColor

        collectionView.dataSource = self
        collectionView.delegate = self

        view.addSubview(topBar)
        view.addSubview(collectionView)

        cameraButton.addTarget(self, action: #selector(cameraTappedAction), for: .touchUpInside)
        
        // MARK: Constraints
        topBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview()
            make.height.equalTo(80)
        }
        topBarStack.snp.makeConstraints { make in
            make.centerY.equalTo(topBar)
            make.left.equalToSuperview().offset(20)
            make.right.bottom.equalToSuperview().offset(-20)
        }
        cameraButton.snp.makeConstraints { make in
            make.width.equalTo(45)
            make.height.equalTo(48)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(topBar.snp.bottom).offset(20)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
       
    }
    
    
    @objc private func cameraTapped(_ sender: UIImageView) {
        present(TestViewController(), animated: true)
    }
    
    @objc func cameraTappedAction() {
        let alert = UIAlertController(title: "Add Photo", message: "Please select a method", preferredStyle: .alert)
    
        alert.addAction(UIAlertAction(title: "Add from library", style: .default) { _ in
            let vc = UIImagePickerController()
            vc.sourceType = .photoLibrary
            vc.delegate = self
            vc.allowsEditing = true
            self.present(vc, animated: true)
        })
        
        alert.addAction(UIAlertAction(title: "Take a photo", style: .default) { _ in
            let vc = UIImagePickerController()
            vc.sourceType = .camera
            vc.delegate = self
            vc.allowsEditing = true
            self.present(vc, animated: true)
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default) { _ in
            alert.dismiss(animated: true)
        })
        
        self.present(alert, animated: true, completion: nil)
    }

}




extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2-10, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        
        // Configure the cell
        let currentImage = imageArray[indexPath.row]
        cell.imageView.image = UIImage(named: "\(currentImage)")

        return cell
    }
    
}


extension HomeViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {}
