//
//  SceneDelegate.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/07/27.
//

import UIKit

/*질문
 -. SceneDelegate이 아니라 UserDefaults.standard.set(false, forKey: "First")를 저장했는데 왜 검정화면이 뜨는지?
 
 */

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        /*데이터 초기화시 Selection화면으로 전환
        window = UIWindow(windowScene: scene)
        
        if UserDefaults.standard.bool(forKey: "Settings") {
            let sb = UIStoryboard(name: "Trend", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "SelectionCollectionViewController") as! SelectionCollectionViewController
            window?.rootViewController = vc
        } else {
            
        }
        */
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

