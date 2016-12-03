//
//  ViewController.swift
//  Sudoku
//
//  Created by KwokWing Tong on 9/11/2016.
//  Copyright © 2016 Tong Kwok Wing. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
	
	@IBOutlet var zone0: [UITextField]!
	
	@IBOutlet var zone1: [UITextField]!
	
	@IBOutlet var zone2: [UITextField]!
	
	@IBOutlet var zone3: [UITextField]!
	
	@IBOutlet var zone4: [UITextField]!
	
	@IBOutlet var zone5: [UITextField]!
	
	@IBOutlet var zone6: [UITextField]!
	
	@IBOutlet var zone7: [UITextField]!
	
	@IBOutlet var zone8: [UITextField]!
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let sudoku = [[3, 0, 6, 5, 0, 8, 4, 0, 0],
									[5, 2, 0, 0, 0, 0, 0, 0, 0],
									[0, 8, 7, 0, 0, 0, 0, 3, 1],
									[0, 0, 3, 0, 1, 0, 0, 8, 0],
									[9, 0, 0, 8, 6, 3, 0, 0, 5],
									[0, 5, 0, 0, 9, 0, 6, 0, 0],
									[1, 3, 0, 0, 0, 0, 2, 5, 0],
									[0, 0, 0, 0, 0, 0, 0, 7, 4],
									[0, 0, 5, 2, 0, 6, 3, 0, 0]]
		
		let sudokuSolve = Sudoku(sudokuTable: sudoku)
		sudokuSolve.solveSudokuProblem()
		
		zone0[0].text = ("\(sudoku[0][0])")
		
	}

	


}

