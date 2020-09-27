//
//  ViewController.swift
//  CollectionView
//
//  Created by H.W. Hsiao on 2020/9/22.
//  Copyright © 2020 H.W. Hsiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var addButton: UIBarButtonItem!
    @IBOutlet weak var trashButton: UIBarButtonItem!
    
    
    var collectionData = ["1 🍬", "2 🏐", "3 🎺", "4 🚤", "5 🏞", "6 💾", "7 📻", "8 🗡", "9 🎎", "10 📖", "11 🍶", "12 🐎"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = (view.frame.size.width) - 20 / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        //預設不啟用
        trashButton.isEnabled = false
        
        //refresh
        //(self.refresh和下方的@objc func refresh()有關)
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        collectionView.refreshControl = refresh
        
        navigationItem.leftBarButtonItem = editButtonItem
        navigationController?.isToolbarHidden = true
    }

    
    @IBAction func deleteItem() {
        if let selection = collectionView.indexPathsForSelectedItems {
            let items = selection.map { $0.item }.sorted().reversed()
            for item in items {
                collectionData.remove(at: item)
            }
            collectionView.deleteItems(at: selection)
        }
        //刪除項目後，要將ToolBar隱藏
        navigationController?.isToolbarHidden = true
    }
    
    
    @IBAction func addItem() {
//        let text = "\(collectionData.count + 1) 🌊"
//        collectionData.append(text)
//
//        let indexPath = IndexPath(row: collectionData.count - 1, section: 0)
//        collectionView.insertItems(at: [indexPath])
        
        collectionView.performBatchUpdates({
            for _ in 0..<2 {
                let text = "\(collectionData.count + 1) 🌊"
                collectionData.append(text)
                let indexPath = IndexPath(row: collectionData.count - 1, section: 0)
                collectionView.insertItems(at: [indexPath])
            }
        }, completion: nil)
    }
    
    @objc func refresh() {
        addItem()
        collectionView.refreshControl?.endRefreshing()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            if let dest = segue.destination as? DetailViewController, let index = sender as? IndexPath {
                dest.selection = collectionData[index.row]
            }
        }
    }
    
    //印象中這一塊程式和navigationItem.leftBarButtonItem = editButtonItem有關
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        //在編輯狀態下，addButton反白不可使用
        addButton.isEnabled = !editing
        //在編輯狀態下，trashButton才可以使用
        trashButton.isEnabled = isEditing
        //非編輯狀態下，隱藏ToolBar
        if !editing {
            navigationController?.isToolbarHidden = true
        }
        
        //允許多選擇
        collectionView.allowsMultipleSelection = editing
        collectionView.indexPathsForSelectedItems?.forEach {
            collectionView.deselectItem(at: $0, animated: false)
        }
        
        //目的是讓每個小格子cell進入編輯狀態
        let indexPaths = collectionView.indexPathsForVisibleItems
        for indexPath in indexPaths {
            let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
            cell.isEditing = editing
        }
    }
    
    
    
    
    
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionView", for: indexPath) as! CollectionViewCell
        cell.titleLabel.text = collectionData[indexPath.row]
        cell.isEditing = isEditing
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //只有在「非編輯」的狀態下執行segue
        if !isEditing {
            performSegue(withIdentifier: "DetailSegue", sender: indexPath)
        }
        //選取項目時才會顯示ToolBar
        navigationController?.isToolbarHidden = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if isEditing {
            if let selected = collectionView.indexPathsForSelectedItems, selected.count == 0 {
                navigationController?.isToolbarHidden = true
            }
        }
    }
    
    
}
