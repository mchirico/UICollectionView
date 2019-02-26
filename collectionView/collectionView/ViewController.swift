//
//  ViewController.swift
//  collectionView
//
//  Created by Michael Chirico on 2/25/19.
//  Copyright © 2019 Michael Chirico. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var items = [Int]()
  var width = [Int]()
  var height = [Int]()
  var fmt = [Bool]()
  var inc = 20
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    for i in 0...30 {
      items.append(i)
      width.append(20)
      height.append(20)
      fmt.append(false)
    }
  

    
  }
  
  
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell0", for: indexPath) as! CollectionViewCell
    
    cell.label0.text = "\(items[indexPath.item])"
    cell.label0.textAlignment = .center
    
  
    
    
    if fmt[indexPath.item] {
      
      cell.label0.backgroundColor = UIColor(red: 0.9,
                                            green: 0.9,
                                            blue: 0.9,
                                            alpha: 1)
    } else {
      cell.label0.backgroundColor = UIColor(red: 0.1,
                                            green: 0.9,
                                            blue: 0.9,
                                            alpha: 1)
      
    }
    
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    print(" \(items[indexPath.item])")
    
    items[indexPath.item] += 1
    fmt[indexPath.item] = !fmt[indexPath.item]
    
    if  width[indexPath.item] > 95 {
      inc = -5
    }
    
    if  width[indexPath.item] < 20 {
      inc = 15
    }
    
    width[indexPath.item] += inc
    height[indexPath.item] += inc
    
    collectionView.reloadItems(at: [indexPath])
    
    
  }
  
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    
    print("HERE>>>>>>>>>.\(indexPath.item)")
    
    let w = width[indexPath.item]
    let h = height[indexPath.item]
    
    return CGSize(width: w, height: h)

  }
  
}
