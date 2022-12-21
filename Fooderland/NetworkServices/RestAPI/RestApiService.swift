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
    var username: String? {
        return User.username
    }
    
    //MARK: - getAllFoods
    func getAllFoods() {
        let urlStr = RESTAPI.yemekleriGetir
        AF.request(urlStr,method: .get).response{ response in
            if let data = response.data {
                do {
                    
                    let yemeklerResponse = try JSONDecoder().decode(FoodResponse.self, from: data)
                    if let list = yemeklerResponse.foods {
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
        guard self.username != nil else {
            print("nil username")
            return
        }
        let urlStr = RESTAPI.sepetiGetir
        let params = ["kullanici_adi": username]
        
        AF.request(urlStr,method: .post, parameters: params).response{ response in
            if let data = response.data {
                do {
                    
                    let sepetYemek = try JSONDecoder().decode(CartResponse.self, from: data)
                    if let list = sepetYemek.foodcart {
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
        guard self.username != nil else {
            print("nil username")
            return
        }
        let urlStr = RESTAPI.sepettenSil
        let params = ["sepet_yemek_id": sepet_yemek_id,
                      "kullanici_adi": username]
        
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
    
    func clearAllCart(list: [FoodCart]) {
        guard self.username != nil else {
            print("nil username")
            return
        }
        let urlStr = RESTAPI.sepettenSil
        for food in list {
            
            let params = ["sepet_yemek_id": food.id,
                          "kullanici_adi": username]
            
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
     func checkAndAddFootInCart(food: Food, adet: String) {
         guard self.username != nil else {
             print("nil username")
             return
         }
         let urlStr = RESTAPI.sepetiGetir
         let params = ["kullanici_adi": username]
         
         AF.request(urlStr,method: .post, parameters: params).response{ response in
             if let data = response.data {
                 var sum = Int(adet) ?? 0
                 do {
                     let sepetYemek = try JSONDecoder().decode(CartResponse.self, from: data)
                     if let list = sepetYemek.foodcart {
                        
                         for yemek in list {
                             if yemek.name == food.name {
                                 sum += Int(yemek.quaintity!)!
                                 self.deleteFoodInCart(sepet_yemek_id: yemek.id!)
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
     
    
     func addToShoppingCart(food: Food, food_quantity: String) {
         guard self.username != nil else {
             print("nil username")
             return
         }
         let urlStr = RESTAPI.sepeteEkle
         let params: Parameters = ["yemek_adi": food.name!,
                                   "yemek_resim_adi": food.imageName!,
                                   "yemek_fiyat": Int(food.price!)!,
                                   "yemek_siparis_adet": Int(food_quantity)!,
                                   "kullanici_adi": username!]
         
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
    func updateCart(food: FoodCart, quantity: Int){
        
        let deleteApi = RESTAPI.sepettenSil
        let deleteParams = ["sepet_yemek_id": food.id,
                      "kullanici_adi": username]
        
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
        let params: Parameters = ["yemek_adi": food.name!,
                                  "yemek_resim_adi": food.imageName!,
                                  "yemek_fiyat": Int(food.price!)!,
                                  "yemek_siparis_adet": quantity,
                                  "kullanici_adi": username!]
        
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
    
    func calculateTotalCost(list: [FoodCart]) {
        var total = 0
        for i in list {
            total += calculateFoodCost(food_quantitiy: i.quaintity!,
                                       food_price: i.price!)
        }
        networkService?.sendTotalCost(total: String(total))
    }
}
