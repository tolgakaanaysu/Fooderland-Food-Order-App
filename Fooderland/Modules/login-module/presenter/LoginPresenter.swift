
import Foundation

class LoginPresenter: ViewToPresenterLoginProtocol {
    var loginInteractor: PresenterToInteractorLoginProtocol?
    var loginView: PresenterToViewLoginProtocol?
    
    func signIn(email: String, password: String) {
        loginInteractor?.signIn(email: email, password: password)
    }
}

extension LoginPresenter: InteractorToPresenterLoginProtocol {
    func sendError(error: Error?) {
        loginView?.sendError(error: error)
        
    }
}


