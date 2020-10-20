//
//  ViewController.swift
//  Five Levels of Covid
//
//  Created by Paul Barnes on 19/10/2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let lightgreen = UIColor(hex: "#b6d7a8ff")
    let lightyellow = UIColor(hex: "#ffe599ff")
    let lightorange = UIColor(hex: "#f6b26bff")
    let lightred = UIColor(hex: "#e06666ff")
    let darkred = UIColor(hex: "#98000ff")
    let lightberryred = UIColor(hex: "#dd7e6bff")
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch level {
        case 1:
            return level1FirstItem.count
        case 2:
            return level2FirstItem.count
        case 3:
            return level3FirstItem.count
        case 4:
            return level4FirstItem.count
        case 5:
            return level5FirstItem.count
        default:
            return level1FirstItem.count
        }
    }
    
    @IBOutlet weak var theTable: UITableView!
    @IBOutlet weak var titleBanner: UILabel!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "ItemDetailCell") as! ItemDetailCell
        switch level {
        case 1:
            cell.titleLabel.text = level1FirstItem[indexPath.row]
            cell.detailLabel.text = level1SecondItem[indexPath.row]
            cell.theImage.image = UIImage(named: level1Image[indexPath.row])
            cell.backgroundColor=lightgreen
        case 2:
            cell.titleLabel.text = level2FirstItem[indexPath.row]
            cell.detailLabel.text = level2SecondItem[indexPath.row]
            cell.theImage.image = UIImage(named: level2Image[indexPath.row])
            cell.backgroundColor=lightyellow
        case 3:
            cell.titleLabel.text = level3FirstItem[indexPath.row]
            cell.detailLabel.text = level3SecondItem[indexPath.row]
            cell.theImage.image = UIImage(named: level3Image[indexPath.row])
            cell.backgroundColor=lightorange
        case 4:
            cell.titleLabel.text = level4FirstItem[indexPath.row]
            cell.detailLabel.text = level4SecondItem[indexPath.row]
            cell.theImage.image = UIImage(named: level4Image[indexPath.row])
            cell.backgroundColor=lightred
        case 5:
            cell.titleLabel.text = level5FirstItem[indexPath.row]
            cell.detailLabel.text = level5SecondItem[indexPath.row]
            cell.theImage.image = UIImage(named: level5Image[indexPath.row])
            cell.backgroundColor=lightberryred
        default:
            cell.titleLabel.text = "First Element"
            cell.detailLabel.text = "Second Element"
            cell.theImage.image = UIImage(named: "Visitors")
        }
        
        cell.theImage?.contentMode = UIView.ContentMode.scaleAspectFill
        cell.theImage?.layer.masksToBounds = true
        //cell.backgroundColor = levelColour
        cell.theImage.layer.borderColor = UIColor(displayP3Red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0).cgColor
        cell.theImage.layer.borderWidth = 1
        
        return cell
    }
    
    var level = 1
    var levelColour = UIColor.systemGreen

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        theTable.delegate = self
        theTable.dataSource = self
        theTable.rowHeight=110.0
        
        level = 1
        levelColour = UIColor.systemGreen
        setColours(level: 1)
    }
    
    func setColours(level: Int) {
        switch level {
        case 1:
            levelColour = UIColor.systemGreen
        case 2:
            levelColour = UIColor.systemYellow
        case 3:
            levelColour = UIColor.systemOrange
        case 4:
            levelColour = UIColor.systemRed
        case 5:
            levelColour = UIColor.init(hex: "#980000ff")
        default:
            levelColour = UIColor.systemGreen
        }
        
        
        self.view.backgroundColor = levelColour
        titleBanner.backgroundColor = levelColour
        theTable.backgroundColor = levelColour
        navigationController?.navigationBar.barTintColor = levelColour
        
    }

    @IBOutlet weak var titleLabel: UILabel!

    @IBAction func Click1(_ sender: Any) {
        level=1
        setColours(level: 1)
        theTable.reloadData()
        titleLabel.text="Level 1"
    }
    
    @IBAction func Click2(_ sender: Any) {
        level=2
        setColours(level: 2)
        theTable.reloadData()
        titleLabel.text="Level 2"
    }
    
    @IBAction func Click3(_ sender: Any) {
        level=3
        setColours(level: 3)
        theTable.reloadData()
        titleLabel.text="Level 3"
    }
    
    @IBAction func Click4(_ sender: Any) {
        level=4
        setColours(level: 4)
        theTable.reloadData()
        titleLabel.text="Level 4"
    }
    
    @IBAction func Clock5(_ sender: Any) {
        level=5
        setColours(level: 5)
        theTable.reloadData()
        titleLabel.text="Level 5"
    }
    
    @IBAction func ClickMore(_ sender: Any) {
    }
}

extension UIColor {
    public convenience init(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        self.init(red: 50, green: 50, blue: 50, alpha: 50)
    }
}



