//
//  TableViewCell.swift
//  collectionViewinsideTableView
//
//  Created by Dnyaneshwar Shinde on 11/07/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    let titleArray = ["A","B","D","E","F","G","H","I","J"]
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        collectionview.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        
        self.collectionview.delegate = self
        self.collectionview.dataSource = self
        
    }
}
    extension TableViewCell : UICollectionViewDataSource {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return titleArray.count
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            
            let rowindex = indexPath.row
 
            if rowindex == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
                let value = titleArray[indexPath.row] as String
                cell.collTitle?.text = value
                cell.backgroundColor = UIColor.cyan
                
                return cell
            }else if rowindex == 1 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
                cell.collTitle?.text = titleArray[indexPath.row]
                cell.backgroundColor = UIColor.cyan
                return cell
            }else if rowindex == 2 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
                cell.collTitle?.text = titleArray[indexPath.row]
                cell.backgroundColor = UIColor.cyan
                
                return cell
            }else if rowindex == 3 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
                cell.collTitle?.text = titleArray[indexPath.row]
                cell.backgroundColor = UIColor.cyan
            return cell
            }
            
            return cell
        }
    }
extension TableViewCell : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(titleArray[indexPath.row])
        
    }
    
}
    
    extension TableViewCell : UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let itemsPerRow:CGFloat = 2
            let hardCodedPadding:CGFloat = 5
            let itemWidth = (collectionview.bounds.width / itemsPerRow) - hardCodedPadding
           // let itemHeight = collectionview.bounds.height - (2 * hardCodedPadding)
            return CGSize(width: itemWidth, height: itemWidth)
        }
        
    }


