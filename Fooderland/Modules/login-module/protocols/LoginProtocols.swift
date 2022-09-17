
import Foundation

// View -> Presenter
protocol ViewToPresenterLoginProtocol {
    var loginInteractor: PresenterToInteractorLoginProtocol? { get set }
    var loginView: PresenterToViewLoginProtocol? { get set }
    
    func signIn(email: String, password: String)
    
    func getUsername()

}

//Presenter -> Interactor
protocol PresenterToInteractorLoginProtocol {
    var loginPresenter: InteractorToPresenterLoginProtocol? { get set }
    var networkService: InteractorToNetworkServiceProtocol? { get set }
    
    func signIn(email: String, password: String)
    
    func getUsername()

}

//Interactor -> Presenter
protocol InteractorToPresenterLoginProtocol {
    
    func sendError(error: Error?)
   
}

//Presenter -> View
protocol PresenterToViewLoginProtocol {
    
    func sendError(error: Error?)
   
}

//Presenter -> Router
protocol PresenterToRouterLoginProtocol {
    static func createModule(ref: LoginVC)
}
