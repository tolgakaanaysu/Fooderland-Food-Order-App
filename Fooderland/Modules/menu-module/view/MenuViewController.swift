//
//  ViewController.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 1.09.2022.
//

import UIKit

final class MenuViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var sordSegmentedControl: UISegmentedControl!
    
    //MARK: - Property
    var presenter: MenuPresenterProtocol?
    
    //MARK: - Lifecylce
    override func viewDidLoad() {
        super.viewDidLoad()
        MenuBuilder.start(view: self)
        presenter?.viewDidLoad()
    }
    
    //MARK: - IBActions
    @IBAction func sortSegmentedControl(_ sender: UISegmentedControl) {
        presenter?.selectedSegmentedController(at: sender.selectedSegmentIndex)
    }
    
    //MARK: - Methods
    private func searchBarConfig() {
        searchBar.barTintColor = .systemIndigo
        searchBar.placeholder = "Ara"
        searchBar.searchTextField.textColor = .darkGray
        searchBar.searchTextField.tokenBackgroundColor = .white
        searchBar.searchTextField.backgroundColor = .white
        searchBar.layer.borderWidth = 0
        searchBar.layer.borderColor = UIColor.systemIndigo.cgColor
    }
    
    private func collectionViewDesign() {
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 16, left: 32, bottom: 0, right: 32)
        design.scrollDirection = .vertical
        design.minimumLineSpacing = 30
        design.itemSize = CGSize(width: 160, height: 250)
        collectionView.collectionViewLayout = design
        collectionView.backgroundColor  = .viewBackgroundColor
    }
}

//MARK: - CollectionView
extension MenuViewController:UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.numberOfItemsInSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let food = presenter?.cellForItem(at: indexPath.row),
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuVCIdentifiers.menuCollectionViewCell.rawValue,
                                                            for: indexPath) as? MenuCollectionViewCell else { return .init() }
        cell.configureCell(with: food)
        return cell
    }
}

extension MenuViewController: UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectItem(at: indexPath.row)
    }
}

//MARK: - UISearchBarDelegate
extension MenuViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.searchTextDidChange(text: searchText)
    }
}

//MARK: - Enum MenuVC Identifiers
enum MenuVCIdentifiers: String {
    case menuCollectionViewCell = "menuCollectionViewCell"
    
}

//MARK: - MenuPresenterDelegate
extension MenuViewController: MenuPresenterDelegate {
   
    func prepareComponents() {
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.delegate = self
        collectionViewDesign()
        searchBarConfig()
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
}
