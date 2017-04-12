//
//  Sudoku.swift
//  Sudoku
//
//  Created by KwokWing Tong on 9/11/2016.
//  Copyright © 2016 Tong Kwok Wing. All rights reserved.
//

import UIKit


class Sudoku: NSObject {
	
	private var _sudokuTable: [[Int]]
	
	
	var sudokuTable:[[Int]] {
		return _sudokuTable
	}
	
	
	init(sudokuTable: [[Int]]) {
		
		_sudokuTable = sudokuTable
	}
	
	
	func solveSudokuProblem() {
		let rowIndex = 0
		let columnIndex = 0
		if !solve(rowIndex: rowIndex, columnIndex: columnIndex) {
			
			print(" No frasible solution found")
		}else {
			showResult()
		}
	}
	
	
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
			if sudokuTable[rowIndex][columnIndex] != 0 {
				
				return solve(rowIndex: rowIndex + 1, columnIndex: columnIndex )
			}else {
				for numbers in MIN_NUMBER...MAX_NUMBER {
					
					if vaild(rowIndex: rowIndex,columnIndex: columnIndex ,actualNumber: numbers) {
						_sudokuTable[rowIndex][columnIndex] = numbers
						
						if solve(rowIndex: rowIndex + 1, columnIndex: columnIndex ) {
							return true
						}
						
					}
				
				}
				
				
				
		}
		
		_sudokuTable[rowIndex][columnIndex] = 0 // backtracking
		
		
		return false
	}
	
	func vaild(rowIndex: Int, columnIndex: Int, actualNumber: Int) -> Bool{
		// if the given number is already in the column: the number cannot be part of the solution
		for i in 0..<BOARD_SIZE {
			if sudokuTable[i][columnIndex] == actualNumber {
				return false
			}
		}
		
		// if the given number is already in the row: the number cannot be part of the solution
		for j in 0..<BOARD_SIZE {
			
			if sudokuTable[rowIndex][j] == actualNumber{
				return false
			}
		}
		
		// if the given number is already in the box: the number cannot be part of the solution
		let boxRowOffset = (rowIndex/3) * BOX_SIZE
		let boxColumnffset = (columnIndex/3) * BOX_SIZE
		
		for i in 0..<BOX_SIZE {
			for j in 0..<BOX_SIZE {
				if actualNumber == sudokuTable[boxRowOffset + i][boxColumnffset + j] {
					return false
				}
			}
		}
		
		
		return true
	}
	
	func showResult() {
		
		for i in 0..<BOARD_SIZE {
			
			if i % 3 == 0 {
				print(" ")
			}
			
			for j in 0..<BOARD_SIZE {
				if j % 3 == 0 {
					print(" ",terminator: "")
				}
				
				print(String(sudokuTable[i][j]) + " ", terminator: "")
			}
			
			print(" ")
		}
		
	}
}
