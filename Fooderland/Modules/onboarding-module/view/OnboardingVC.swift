//
//  OnboardingVC.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 7.09.2022.
//

import UIKit

final class OnboardingVC: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var startButton: UIButton!
    
    var onboardingSlider: [OnboardingModel] = []
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let slider1 = OnboardingModel(title: "Aradığınız tüm yemekler!", image: UIImage(named: "slider1")!)
        let slider2 = OnboardingModel(title: "En yakın restoranı bul!", image: UIImage(named: "slider2")!)
        let slider3 = OnboardingModel(title: "Siparişin sıcacık kapında!", image: UIImage(named: "slider3")!)
        
        onboardingSlider.append(slider1)
        onboardingSlider.append(slider2)
        onboardingSlider.append(slider3)
        
    }
    
    @IBAction func startButton(_ sender: Any) {
        if currentPage == onboardingSlider.count - 1 {
            performSegue(withIdentifier: "goLoginVC", sender: nil)
        } else {
            currentPage += 1
            pageControl.currentPage = currentPage
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingSlider.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let slide = onboardingSlider[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboardingCell", for: indexPath) as! OnboardingCollectionViewCell
        cell.imageView.image = slide.image
        cell.sloganLabel.text = slide.title
        cell.imageView.contentMode = .scaleAspectFit
        cell.imageView.autoresizingMask = .flexibleHeight
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}
