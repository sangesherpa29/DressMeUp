import UIKit
import SnapKit
import Alamofire

class HomeViewController: UIViewController {
    
    var urlString = "https://api.unsplash.com/search/collections?page=1&per_page=30&query=fashion&client_id=qzPoaDGNkM9dmkfKUhwHXal4rfVBBfITIEJZwMvpISg"
    var results: [Result] = []
    
    var imageArray = ["img1", "img2", "img3", "img4", "img5", "img6", "img7", "img8", "img9", "img10"]

    lazy var collectionView : UICollectionView = {
        var flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        flowlayout.minimumInteritemSpacing = 10
        flowlayout.minimumLineSpacing = 10
        
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
        fetchPhotos()
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
            make.width.height.equalTo(40)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(topBar.snp.bottom).offset(20)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
       
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

extension HomeViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/2-5, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomCollectionViewCell.identifier,
            for: indexPath) as? CustomCollectionViewCell else {
            print("Could not cast Cell")
            return UICollectionViewCell()
        }
        
        for res in results {
            let imageUrl = URL(string: res.cover_photo.urls.regular)
            print(res)
        }


        // Configure the cell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoExpandedVC = PhotoExpandedViewController()
        let currentImage = results[indexPath.row]
        photoExpandedVC.photoImageView.image = UIImage(named: "\(currentImage)")
        self.navigationController?.pushViewController(photoExpandedVC, animated: true)
    }
    
}
