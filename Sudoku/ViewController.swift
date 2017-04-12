//
//  ViewController.swift
//  Sudoku
//
//  Created by KwokWing Tong on 9/11/2016.
//  Copyright © 2016 Tong Kwok Wing. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITextFieldDelegate {
	
	// UI IBOutlet
	@IBOutlet var row0: [UITextField]!
	
	@IBOutlet var row1: [UITextField]!
	
	@IBOutlet var row2: [UITextField]!
	
	@IBOutlet var row3: [UITextField]!
	
	@IBOutlet var row4: [UITextField]!
	
	@IBOutlet var row5: [UITextField]!
	
	@IBOutlet var row6: [UITextField]!
	
	@IBOutlet var row7: [UITextField]!
	
	@IBOutlet var row8: [UITextField]!
	
	
	// save from textField array to this array
	var sudokuArray: [[Int]] = [[0, 0, 0, 0, 0, 0, 0, 0, 0],
	                            [0, 0, 0, 0, 0, 0, 0, 0, 0],
	                            [0, 0, 0, 0, 0, 0, 0, 0, 0],
	                            [0, 0, 0, 0, 0, 0, 0, 0, 0],
	                            [0, 0, 0, 0, 0, 0, 0, 0, 0],
	                            [0, 0, 0, 0, 0, 0, 0, 0, 0],
	                            [0, 0, 0, 0, 0, 0, 0, 0, 0],
	                            [0, 0, 0, 0, 0, 0, 0, 0, 0],
	                            [0, 0, 0, 0, 0, 0, 0, 0, 0]]
	
	// for detect which textfield to type and save in this array
	var checkTextField: [Bool] = [false,false,false,false,false,false,false,false,false,
	                              false,false,false,false,false,false,false,false,false,
	                              false,false,false,false,false,false,false,false,false,
	                              false,false,false,false,false,false,false,false,false,
	                              false,false,false,false,false,false,false,false,false,
	                              false,false,false,false,false,false,false,false,false,
	                              false,false,false,false,false,false,false,false,false,
	                              false,false,false,false,false,false,false,false,false,
	                              false,false,false,false,false,false,false,false,false]
	
	// for checkAnswer function to use
	var sudokuSolve: Sudoku!
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// alloc the all textfield to viewcontroller
		for i in 0...8 {
			row0[i].delegate = self
			row1[i].delegate = self
			row2[i].delegate = self
			row3[i].delegate = self
			row4[i].delegate = self
			row5[i].delegate = self
			row6[i].delegate = self
			row7[i].delegate = self
			row8[i].delegate = self
		}
		
		viewTextToArray()
	
		
		sudokuSolve = Sudoku(sudokuTable: sudokuArray)
		sudokuSolve.solveSudokuProblem()
		
		// add gestureRecognizer to view
		let tap = UITapGestureRecognizer.init(target: self, action: #selector(dismisskeyboard))
		
		self.view.addGestureRecognizer(tap)
		
	}
	
	// tap outside the view to dismiss keyboard
	func dismisskeyboard() {
		for i in 0...8 {
			row0[i].resignFirstResponder()
			row1[i].resignFirstResponder()
			row2[i].resignFirstResponder()
			row3[i].resignFirstResponder()
			row4[i].resignFirstResponder()
			row5[i].resignFirstResponder()
			row6[i].resignFirstResponder()
			row7[i].resignFirstResponder()
			row8[i].resignFirstResponder()
			
			
		}
		
	}
	
	// record tag when the user end editing and save it to checkTextField array
	func textFieldDidEndEditing(_ textField: UITextField) {
		
		
		for i in 0...80 {
			if textField.tag == i {
				checkTextField[i] = true
			}
		}
		
		
		
		
		
	}
	
	// assign text from textfield to sudokuArray
	func viewTextToArray() {
		
		
		
		for i in 0...8 {
			emptyToZero(number: i)
			
			
			if row0[i].text != "" {
				row0[i].isUserInteractionEnabled = false
				sudokuArray[0][i] = Int(row0[i].text!)!
			}
			
			if row1[i].text != "" {
				row1[i].isUserInteractionEnabled = false
				sudokuArray[1][i] = Int(row1[i].text!)!
			}
			if row2[i].text != "" {
				row2[i].isUserInteractionEnabled = false
				sudokuArray[2][i] = Int(row2[i].text!)!
			}
			
			if row3[i].text != "" {
				row3[i].isUserInteractionEnabled = false
				sudokuArray[3][i] = Int(row3[i].text!)!
			}
			if row4[i].text != "" {
				row4[i].isUserInteractionEnabled = false
				sudokuArray[4][i] = Int(row4[i].text!)!
			}
			if row5[i].text != "" {
				row5[i].isUserInteractionEnabled = false
				sudokuArray[5][i] = Int(row5[i].text!)!
			}
			
			if row6[i].text != "" {
				row6[i].isUserInteractionEnabled = false
				sudokuArray[6][i] = Int(row6[i].text!)!
			}
			
			if row7[i].text != "" {
				row7[i].isUserInteractionEnabled = false
				sudokuArray[7][i] = Int(row7[i].text!)!
			}
			if row8[i].text != "" {
				row8[i].isUserInteractionEnabled = false
				sudokuArray[8][i] = Int(row8[i].text!)!
			}
			
			
		}
		
		
		
	}
		
	
	func emptyToZero(number: Int) {
		
	
		
		if row0[number].text == "" {
			sudokuArray[0][number] = 0
		}
		
		if row1[number].text == "" {
			sudokuArray[1][number] = 0
		}
		if row2[number].text == "" {
			sudokuArray[2][number] = 0
		}
		if row3[number].text == "" {
			sudokuArray[3][number] = 0
		}
		
		if row4[number].text == "" {
			sudokuArray[4][number] = 0
		}
		if row5[number].text == "" {
			sudokuArray[5][number] = 0
		}
		
		if row6[number].text == "" {
			sudokuArray[6][number] = 0
		}
		
		if row7[number].text == "" {
			sudokuArray[7][number] = 0
		}
		
		if row8[number].text == "" {
			sudokuArray[8][number] = 0
		}
	}

	
	@IBAction func generateAnswer(_ sender: UIButton) {
		let rowIndex = 0
		let columnIndex = 0
		
		if !solve(rowIndex: rowIndex, columnIndex: columnIndex) {
			let alertsolution = UIAlertController.init(title: "Sudoku", message: "No feasible solution with this sudoku", preferredStyle: .alert)
			
			let action = UIAlertAction.init(title: "OK", style: .default, handler: nil)
			
			alertsolution.addAction(action)
			
			self.present(alertsolution, animated: true, completion: nil)
		}
		
		print(sudokuArray)
	}
	
	
	// when user enter number in textField , then can click checkAnswer button to check and correct it. If the answer is wrong, the text color will change to red and correct it. If the answer is right, text color will be black normally.
	@IBAction func checkAnswer(_ sender: UIButton) {
		
		for i in 0...80 {
			// check range i to find which checkTextField position has true value
			if 0...8 ~= i {
				if checkTextField[i] == true {
					
					if row0[i].text == String(sudokuSolve.sudokuTable[0][i]) {
						print("Enter right answer")
					}else {
						print("Enter wrong answer")
						row0[i].textColor = UIColor.red
						row0[i].text = String(sudokuSolve.sudokuTable[0][i])
					}
				}
			}
			
			if 9...17 ~= i {
				
				
				if checkTextField[i] == true {
					
					
					if i >= 9 {
						let i = i - 9
						
						if row1[i].text == String(sudokuSolve.sudokuTable[1][i]) {
							print("Enter right answer")
						}else {
							print("Enter wrong answer")
							row1[i].textColor = UIColor.red
							row1[i].text = String(sudokuSolve.sudokuTable[1][i])
						}
					}
				
				}
			}
			
			
			if 18...26 ~= i {
				
				
				if checkTextField[i] == true {
					
					
					if i >= 18 {
						let i = i - 18
						
						if row2[i].text == String(sudokuSolve.sudokuTable[2][i]) {
							print("Enter right answer")
						}else {
							print("Enter wrong answer")
							row2[i].textColor = UIColor.red
							row2[i].text = String(sudokuSolve.sudokuTable[2][i])
						}
					}
					
				}
			}
			
			
			if 27...35 ~= i {
				
				
				if checkTextField[i] == true {
					
					
					if i >= 27 {
						let i = i - 27
						
						if row3[i].text == String(sudokuSolve.sudokuTable[3][i]) {
							print("Enter right answer")
						}else {
							print("Enter wrong answer")
							row3[i].textColor = UIColor.red
							row3[i].text = String(sudokuSolve.sudokuTable[3][i])
						}
					}
					
				}
			}
			
			
			
			
			if 36...44 ~= i {
				
				
				if checkTextField[i] == true {
					
					
					if i >= 36 {
						let i = i - 36
						
						if row4[i].text == String(sudokuSolve.sudokuTable[4][i]) {
							print("Enter right answer")
						}else {
							print("Enter wrong answer")
							row4[i].textColor = UIColor.red
							row4[i].text = String(sudokuSolve.sudokuTable[4][i])
						}
					}
					
				}
			}
			
			if 45...53 ~= i {
				
				
				if checkTextField[i] == true {
					
					
					if i >= 45 {
						let i = i - 45
						
						if row5[i].text == String(sudokuSolve.sudokuTable[5][i]) {
							print("Enter right answer")
						}else {
							print("Enter wrong answer")
							row5[i].textColor = UIColor.red
							row5[i].text = String(sudokuSolve.sudokuTable[5][i])
						}
					}
					
				}
			}
			
			if 54...62 ~= i {
				
				
				if checkTextField[i] == true {
					
					
					if i >= 54 {
						let i = i - 54
						
						if row6[i].text == String(sudokuSolve.sudokuTable[6][i]) {
							print("Enter right answer")
						}else {
							print("Enter wrong answer")
							row6[i].textColor = UIColor.red
							row6[i].text = String(sudokuSolve.sudokuTable[6][i])
						}
					}
					
				}
			}
			
			if 63...71 ~= i {
				
				
				if checkTextField[i] == true {
					
					
					if i >= 63 {
						let i = i - 63
						
						if row7[i].text == String(sudokuSolve.sudokuTable[7][i]) {
							print("Enter right answer")
						}else {
							print("Enter wrong answer")
							row7[i].textColor = UIColor.red
							row7[i].text = String(sudokuSolve.sudokuTable[7][i])
						}
					}
					
				}
			}
			
			if 72...80 ~= i {
				
				
				if checkTextField[i] == true {
					
					
					if i >= 72 {
						let i = i - 72
						
						if row8[i].text == String(sudokuSolve.sudokuTable[8][i]) {
							print("Enter right answer")
						}else {
							print("Enter wrong answer")
							row8[i].textColor = UIColor.red
							row8[i].text = String(sudokuSolve.sudokuTable[8][i])
						}
					}
					
				}
			}
			
			
			
			
			
			
			
			
			
			
		}
	}
	
	// solve the sudoku 
	func solve( rowIndex: Int, columnIndex:  Int) -> Bool{
		
		
		var rowIndex = rowIndex
		var columnIndex = columnIndex
		
		
		// all row and column is solved
		if rowIndex == BOARD_SIZE && columnIndex  == BOARD_SIZE - 1 {
			return true
		}
		// reach the end row, then reset the row
		if rowIndex == 9 {
			columnIndex = columnIndex + 1
			rowIndex = 0;
			
		}
		
		// check the row and column is not equel to zero, if not zero , then move to next row
		if sudokuArray[rowIndex][columnIndex] != 0 {
			
			return solve(rowIndex: rowIndex + 1, columnIndex: columnIndex )
		}else {
			for numbers in MIN_NUMBER...MAX_NUMBER {
				
				
				// to check the numbers whether assign it to textfield array
				if vaild(rowIndex: rowIndex,columnIndex: columnIndex ,actualNumber: numbers) {
					
					if rowIndex == 0 {
						row0[columnIndex].text = String(numbers)
						// anitmation for the text, it will slow down the loop to clearly see the changing text
						RunLoop.current.run(until: Date.init(timeIntervalSinceNow: 0.05))
					}
					if rowIndex == 1 {
						row1[columnIndex].text = String(numbers)
						RunLoop.current.run(until: Date.init(timeIntervalSinceNow: 0.05))
					}
					
					if rowIndex == 2 {
						row2[columnIndex].text = String(numbers)
						RunLoop.current.run(until: Date.init(timeIntervalSinceNow: 0.05))
					}
					
					if rowIndex == 3 {
						row3[columnIndex].text = String(numbers)
						RunLoop.current.run(until: Date.init(timeIntervalSinceNow: 0.05))
					}
					if rowIndex == 4 {
						row4[columnIndex].text = String(numbers)
						RunLoop.current.run(until: Date.init(timeIntervalSinceNow: 0.05))
					}
					if rowIndex == 5 {
						row5[columnIndex].text = String(numbers)
						RunLoop.current.run(until: Date.init(timeIntervalSinceNow: 0.05))
					}
					
					if rowIndex == 6 {
						row6[columnIndex].text = String(numbers)
						RunLoop.current.run(until: Date.init(timeIntervalSinceNow: 0.05))
					}
					
					if rowIndex == 7 {
						row7[columnIndex].text = String(numbers)
						RunLoop.current.run(until: Date.init(timeIntervalSinceNow: 0.05))
					}
					
					if rowIndex == 8 {
						row8[columnIndex].text = String(numbers)
						RunLoop.current.run(until: Date.init(timeIntervalSinceNow: 0.05))
					}
					
				
					
					
					sudokuArray[rowIndex][columnIndex] = numbers
					
					if solve(rowIndex: rowIndex + 1, columnIndex: columnIndex ) {
						return true
					}
					
				}
				
			}
			
			
			
		}
		
		
		// backtracking
		if rowIndex == 0 {
			row0[columnIndex].text = ""
		}
		
		if rowIndex == 1 {
			row1[columnIndex].text = ""
		}
		
		if rowIndex == 2 {
			row2[columnIndex].text = ""
		}
		
		if rowIndex == 3 {
			row3[columnIndex].text = ""
		}
		
		if rowIndex == 4 {
			row4[columnIndex].text = ""
		}
		
		if rowIndex == 5 {
			row5[columnIndex].text = ""
		}
		
		if rowIndex == 6 {
			row6[columnIndex].text = ""
		}
		
		if rowIndex == 7 {
			row7[columnIndex].text = ""
		}
		
		if rowIndex == 8 {
			row8[columnIndex].text = ""
		}
		
		
		
		sudokuArray[rowIndex][columnIndex] = 0 // backtracking
		
		
		return false
	}
	
	// to check the numbers whether assign it to sudokuArray
	func vaild(rowIndex: Int, columnIndex: Int, actualNumber: Int) -> Bool{
		
		// if the given number is already in the column: the number cannot be part of the solution
		for i in 0..<BOARD_SIZE {
			

			
			
			
			if sudokuArray[i][columnIndex] == actualNumber {
				return false
			}
		}
		
		// if the given number is already in the row: the number cannot be part of the solution
		for j in 0..<BOARD_SIZE {
			
			
			
			if sudokuArray[rowIndex][j] == actualNumber{
				return false
			}
		}
		
		// if the given number is already in the box: the number cannot be part of the solution
		let boxRowOffset = (rowIndex/3) * BOX_SIZE
		let boxColumnffset = (columnIndex/3) * BOX_SIZE
		
		for i in 0..<BOX_SIZE {
			for j in 0..<BOX_SIZE {
				if actualNumber == sudokuArray[boxRowOffset + i][boxColumnffset + j] {
					return false
				}
			}
		}
		
		
		
		return true
	}


}


