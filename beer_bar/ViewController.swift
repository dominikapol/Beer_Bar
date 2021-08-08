//
//  ViewController.swift
//  beer_bar
//
//  Created by Dominika Poleshyck on 4.08.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var beerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addBeerToTheStockroom() {
        BeerBar.shared.addBeer(value: Beer.heiniekenBeer())
        BeerBar.shared.addBeer(value: Beer.zhigaBeer())
    }
    @IBAction func closeBarRightNow() {
        BeerBar.shared.closeBar()
        beerLabel.text = BeerBar.shared.printTheBarIsClosed()
    }
    @IBAction func pourBeerForClient() {
        if BeerBar.shared.beerForClient() == true {
            beerLabel.text = Beer.beerInfo(Beer.heiniekenBeer())()
        } else {
            beerLabel.text = "Пивчика нет(("
        }
    }
    @IBAction func printStatisticOfTheDay () {
        beerLabel.text = BeerBar.shared.printStatistic()
    }
    
    class Beer {
        var nameOfBeer: String
        var countryOfOrigin: String
        var cost: Double
        var volume: Double
        init(nameOfBeer: String, countryOfOrigin: String, cost: Double, volume: Double) {
            self.cost = cost
            self.countryOfOrigin = countryOfOrigin
            self.nameOfBeer = nameOfBeer
            self.volume = volume
        }
        func beerInfo() -> String {
            return ("Ваш пивчик! \n Название пива: \(nameOfBeer) \n Страна происхождение: \(countryOfOrigin) \n Цена: \(cost) \n Объем бутылки \(volume) \n")
        }
        static func heiniekenBeer() -> Beer {
            let heiniken = Beer(nameOfBeer: "Heinieken", countryOfOrigin: "Германия", cost: 2.5, volume: 0.5)
            return heiniken
        }
        
        static func zhigaBeer() -> Beer {
            let zhiga = Beer(nameOfBeer: "Жигулевское", countryOfOrigin: "Россия", cost: 1.0, volume: 1.5)
            return zhiga
        }
    }
    
    class BeerBar {
        var beerArray: ([Beer]) = []
        static let shared: BeerBar = BeerBar()
        private init() {
            self.beerArray = []
        }
        
        func addBeer(value: Beer)  {
            beerArray.append(value)
        }
        
        func beerForClient() -> Bool {
            if beerArray.isEmpty {
                return false
            } else {
                beerArray.removeLast()
            }
            return true
        }
        
        func closeBar() {
            beerArray.removeAll()
        }
        
        func printTheBarIsClosed() -> String {
            let goodbye: String = "Sorry, the bar is closed"
            return goodbye
        }
        
        func printStatistic() -> String {
            let statistic = self.beerArray.map { allBeer in
                return "Название пива: \(allBeer.nameOfBeer) Страна Производитель: \(allBeer.countryOfOrigin) Стоимость пива: \(allBeer.cost) Объём пива: \(allBeer.volume)"
            }
            return statistic.joined(separator: ", ")
        }
        
    }
    
}
