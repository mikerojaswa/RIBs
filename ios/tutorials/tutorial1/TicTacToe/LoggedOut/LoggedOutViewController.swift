//
//  LoggedOutViewController.swift
//  TicTacToe
//
//  Created by Michael Rojas on 8/12/18.
//  Copyright © 2018 Uber. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import CoreGraphics

protocol LoggedOutPresentableListener: class {
    func login(withPlayer1Name player1Name: String?, player2Name: String?)
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?


    private var player1TextField: UITextField =
        UITextField(frame: CGRect(x: 25, y: 75, width: 200, height: 60))
    private var player2TextField: UITextField =
        UITextField(frame: CGRect(x: 25, y: 175, width: 200, height: 60))
    private var button: UIButton = UIButton(frame: CGRect(x: 25, y: 275, width: 200, height: 60))

    
    override func viewDidLoad() {
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        player1TextField.backgroundColor = .red
        player1TextField.placeholder = "Player 1 name"
        player2TextField.backgroundColor = .red
        player2TextField.placeholder = "Player 2 name"
        button.backgroundColor = .green
        button.setTitle("LOGIN", for: .normal)
        self.view.backgroundColor = .white
        self.view.addSubview(player1TextField)
        self.view.addSubview(player2TextField)
        self.view.addSubview(button)
    }
    
    @objc func didTapLoginButton() {
        listener?.login(withPlayer1Name: player1TextField.text, player2Name: player2TextField.text)
    }
}
