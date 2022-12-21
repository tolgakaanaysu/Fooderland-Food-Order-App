//
//  ViewController.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 1.09.2022.
//

import UIKit
import Kingfisher
import FirebaseAuth
final class MenuVC: UIViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var sordSegmentedControl: UISegmentedControl!
    
    var menuPresenter: ViewToPresenterMenuProtocol?
    var filterFoodList: [Food] = []
    var mainFoodList: [Food] = []
    var shoppingCartList: [FoodCart] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.delegate = self
        MenuRouter.createModule(ref: self)
        design()
        searchBarConfig()
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        menuPresenter?.getAllFoods()
        menuPresenter?.getFoodInCart()
    
    }
    
    @IBAction func sortSegmentedControl(_ sender: UISegmentedControl) {
   
        switch sender.selectedSegmentIndex {
        case 0:
            filterFoodList.sort(by: {$0.id! < $1.id!})
        case 1:
            filterFoodList.sort(by: {Int($0.price!)! < Int($1.price!)!})
        case 2:
            filterFoodList.sort(by: {Int($0.price!)! > Int($1.price!)!})
        case 3:
            filterFoodList.sort(by: {$0.name! < $1.name!})
        default:
            print("default")
        }
        collectionView.reloadData()
    }
    
}

//MARK: - CollectionView
extension MenuVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filterFoodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let food = filterFoodList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuVCIdentifiers.menuCollectionViewCell.rawValue, for: indexPath) as! MenuCollectionViewCell
       
        cell.configureCell(with: food)
        //FIXME: ımage view
        cell.foodImageView.kf.setImage(with: takeImages(yemek_resim_adi: food.imageName!),
                                       placeholder: UIImage.actions)
    
      

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = filterFoodList[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: food)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let food = sender as? Food {
                let detayVC = segue.destination as! FoodDetailsVC
                detayVC.food = food
            }
        }
    }
    
    func design(){
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 16, left: 32, bottom: 0, right: 32)
        design.scrollDirection = .vertical
        design.minimumLineSpacing = 30
        design.itemSize = CGSize(width: 160, height: 250)
        collectionView.collectionViewLayout = design
        collectionView.backgroundColor  = .viewBackgroundColor
    }
    
    func takeImages(yemek_resim_adi: String) -> URL? {
        let urlStr = RESTAPI.yemekResimGetir + yemek_resim_adi
        let url = URL(string: urlStr)
        return url
    }
}

//MARK: - PRESENTER PROTOCOL
extension MenuVC: PresenterToViewMenuProtocol {
    
    func sendCartList(list: [FoodCart]) {
        shoppingCartList = list
//        print(shoppingCartList.count)
//        if shoppingCartList.count == 0 {
//            tabBarController?.viewControllers![1].tabBarItem.badgeValue = nil
//        } else {
//            tabBarController?.viewControllers![1].tabBarItem.badgeValue = "\(shoppingCartList.count)"
//        }
        
    }
    
    func sendFoodList(foodList: Array<Food>) {
        mainFoodList = foodList
        filterFoodList = foodList
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

//MARK: - SearchBar
extension MenuVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            filterFoodList = mainFoodList.filter { yemekler in
                yemekler.name!.lowercased().contains(searchText.lowercased())
            }
            
        } else {
                filterFoodList = mainFoodList
        }
        collectionView.reloadData()
    }
    
    func searchBarConfig(){
        searchBar.barTintColor = .systemIndigo
        searchBar.placeholder = "Ara"
        searchBar.searchTextField.textColor = .darkGray
        searchBar.searchTextField.tokenBackgroundColor = .white
        searchBar.searchTextField.backgroundColor = .white
        searchBar.layer.borderWidth = 0
        searchBar.layer.borderColor = UIColor.systemIndigo.cgColor
    }
}


//MARK: - Enum MenuVC Identifiers
enum MenuVCIdentifiers: String {
    case toFoodDetailsVC = "toFoodDetailsVC"
    case menuCollectionViewCell = "menuCollectionViewCell"
    
}
