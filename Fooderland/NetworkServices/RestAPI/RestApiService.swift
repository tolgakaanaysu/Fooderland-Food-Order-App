//
//  RestApiService.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 15.09.2022.
//

import Foundation
import Alamofire
import FirebaseAuth
class RestApiService: NetworkServiceToRestApiService {
    var networkService: RestApiServiceToNetworkService?
    
    //MARK: - getAllFoods
    func getAllFoods() {
        let urlStr = RESTAPI.yemekleriGetir
        AF.request(urlStr,method: .get).response{ response in
            if let data = response.data {
                do {
                    
                    let yemeklerResponse = try JSONDecoder().decode(YemeklerResponse.self, from: data)
                    if let list = yemeklerResponse.yemekler {
                        self.networkService?.sendFoodList(foodList: list)
                    }
                } catch  {
                    debugPrint("Tüm yiyecekleri getirme hatası")
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    //MARK: - getFoodsInCart
    func getFoodsInCart() {
        let urlStr = RESTAPI.sepetiGetir
        let params = ["kullanici_adi": User.usernameInfo.rawValue]
        
        AF.request(urlStr,method: .post, parameters: params).response{ response in
            if let data = response.data {
                do {
                    
                    let sepetYemek = try JSONDecoder().decode(SepetYemeklerResponse.self, from: data)
                    if let list = sepetYemek.sepet_yemekler {
                        self.networkService?.sendCartList(foodList: list)
                        self.calculateTotalCost(list: list)
                        
                    }
                } catch {
                    self.networkService?.sendCartList(foodList: [])
                    self.calculateTotalCost(list: [])
                    debugPrint("Sepetteki ürünleri getirme hatası")
                    print(error.localizedDescription)
                }
            }
        }
    }
}

//MARK: - Delete Food
extension RestApiService {
    
    func deleteFoodInCart(sepet_yemek_id: String) {
        let urlStr = RESTAPI.sepettenSil
        let params = ["sepet_yemek_id": sepet_yemek_id,
                      "kullanici_adi": User.usernameInfo.rawValue]
        
        AF.request(urlStr,method: .post, parameters: params).response{ response in
            if let data = response.data {
                do {
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                } catch {
                    debugPrint("Silme işlemi başarısız")
                    print(error.localizedDescription)
                }
            }
        }
        getFoodsInCart()
    }
    
    func clearAllCart(list: [SepetYemekler]) {
        let urlStr = RESTAPI.sepettenSil
        for food in list {
            
            let params = ["sepet_yemek_id": food.sepet_yemek_id,
                          "kullanici_adi": User.usernameInfo.rawValue]
            
            AF.request(urlStr,method: .post, parameters: params).response{ response in
                if let data = response.data {
                    do {
                        let cevap = try JSONSerialization.jsonObject(with: data)
                        print(cevap)
                    } catch {
                        debugPrint("Silme işlemi başarısız")
                        print(error.localizedDescription)
                    }
                }
            }
        }
        getFoodsInCart()
    }
 
}

//MARK: - ADD FOOD
extension RestApiService {
    
     // There is no update api. So if added product is in  cart, delete it and upload a new one
     func checkAndAddFootInCart(food: Yemekler, adet: String) {
         let urlStr = RESTAPI.sepetiGetir
         let params = ["kullanici_adi": User.usernameInfo.rawValue]
         
         AF.request(urlStr,method: .post, parameters: params).response{ response in
             if let data = response.data {
                 var sum = Int(adet) ?? 0
                 do {
                     let sepetYemek = try JSONDecoder().decode(SepetYemeklerResponse.self, from: data)
                     if let list = sepetYemek.sepet_yemekler {
                        
                         for yemek in list {
                             if yemek.yemek_adi == food.yemek_adi {
                                 sum += Int(yemek.yemek_siparis_adet!)!
                                 self.deleteFoodInCart(sepet_yemek_id: yemek.sepet_yemek_id!)
                             }
                         }
                         
                     }
                 } catch {
                     print(error.localizedDescription)
                 }
                 self.addToShoppingCart(food: food, food_quantity: String(sum))
             }
         }
         getFoodsInCart()
     }
     
    
     func addToShoppingCart(food: Yemekler, food_quantity: String) {
         let urlStr = RESTAPI.sepeteEkle
         let params: Parameters = ["yemek_adi": food.yemek_adi!,
                                   "yemek_resim_adi": food.yemek_resim_adi!,
                                   "yemek_fiyat": Int(food.yemek_fiyat!)!,
                                   "yemek_siparis_adet": Int(food_quantity)!,
                                   "kullanici_adi": User.usernameInfo.rawValue]
         
         AF.request(urlStr,method: .post, parameters: params).response{ response in
             if let data = response.data {
                 do {
                     let cevap = try JSONSerialization.jsonObject(with: data)
                     print(cevap)
                 } catch {
                     print("Ekleme işlemi başarısız")
                     print(error.localizedDescription)
                 }
             }
         }
     }
}

//MARK: - UPDATE
extension RestApiService {
    func updateCart(food: SepetYemekler, quantity: Int){
        
        let deleteApi = RESTAPI.sepettenSil
        let deleteParams = ["sepet_yemek_id": food.sepet_yemek_id,
                      "kullanici_adi": User.usernameInfo.rawValue]
        
        AF.request(deleteApi,method: .post, parameters: deleteParams).response{ response in
            if let data = response.data {
                do {
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                } catch {
                    debugPrint("Silme işlemi başarısız")
                    print(error.localizedDescription)
                }
            }
        }
        
        let addApi = RESTAPI.sepeteEkle
        let params: Parameters = ["yemek_adi": food.yemek_adi!,
                                  "yemek_resim_adi": food.yemek_resim_adi!,
                                  "yemek_fiyat": Int(food.yemek_fiyat!)!,
                                  "yemek_siparis_adet": quantity,
                                  "kullanici_adi": User.usernameInfo.rawValue]
        
        AF.request(addApi,method: .post, parameters: params).response{ response in
            if let data = response.data {
                do {
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                } catch {
                    print("Ekleme işlemi başarısız")
                    print(error.localizedDescription)
                }
            }
        }
    }
}

//MARK: - Calculate Total Cost
extension RestApiService {
    
    func calculateFoodCost(food_quantitiy: String, food_price: String) -> Int{
        var total = 0
        let price = Int(food_price)!
        let quaintity = Int(food_quantitiy)!
        total += (price * quaintity)
        return total
    }
    
    func calculateTotalCost(list: [SepetYemekler]) {
        var total = 0
        for i in list {
            total += calculateFoodCost(food_quantitiy: i.yemek_siparis_adet!,
                                       food_price: i.yemek_fiyat!)
        }
        networkService?.sendTotalCost(total: String(total))
    }
}

