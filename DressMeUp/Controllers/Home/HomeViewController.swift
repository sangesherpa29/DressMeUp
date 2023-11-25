import UIKit
import SnapKit
import Alamofire

class HomeViewController: UIViewController {
    
    private lazy var session : URLSession = {
        URLCache.shared.memoryCapacity = 512 * 1024 * 1024
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        return URLSession(configuration: configuration)
    }()

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
        fetchImagesFromApi()
    }

    private func setupUI() {
        view.backgroundColor = UIColor.mainBackgroundColor

        collectionView.dataSource = self
        collectionView.delegate = self

        view.addSubview(topBar)
        view.addSubview(collectionView)
        
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
    
    // this array of images if populated with images from the API Call - fetchPhotos()
    var images = [UIImage]()
    
    // Solely used to add images from api to the images array above
    private func fetchImagesFromApi() {
        var count = 0
        DispatchQueue.main.async {
            self.fetchPhotos { data in
                for _ in 0..<data.results.count {
                    count += 1
                }
            }
            
            // re-trigger the collection view's layout
            self.collectionView.collectionViewLayout.invalidateLayout()
            // reload the collection View since to accomodate each image update
            self.collectionView.reloadData()            
        }
    }

}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
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
        
        DispatchQueue.main.async {
            self.fetchPhotos { data in
                
                // 2. Get data that represents the corresponding image
                if let data = try? Data(contentsOf: URL(string: data.results[indexPath.row].coverPhoto.urls.small_s3)!) {
                    
                    // 3. Use that data to create the image
                    if let image = UIImage(data: data) {
                    
                        // Append that image to the images array above.
                        DispatchQueue.main.async {
                            cell.imageView.image = image
                        }
                    }
                }
                
            }
        }

        // Configure the cell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoExpandedVC = PhotoExpandedViewController()
        self.navigationController?.pushViewController(photoExpandedVC, animated: true)
    }
    
}
