// Sophia Kong - Class to manage the Tic Tac Toe game logic
class TicTacToe {
    int[][] boardState = new int[3][3]; 
    int selectedRow = 0; // Row selected by click
    int selectedCol = 0; // Column selected by click
    int totalMoves = 0;  // Sum of rows, columns, diagonals

    // Resets the board
    void resetScores() {
        for (int r = 0; r < 3; r++) {
            for (int c = 0; c < 3; c++) {
                boardState[r][c] = 0; 
            }
        }
        p1Moves = 0; 
        p2Moves = 0; 
    }

    // Processes board and player moves
    void processMove() {
        detectRow();       
        detectCol();       
        validateMove();   
        evaluateWinner();  
    }

    // Detects the selected row based on the mouse X position
    void detectRow() {
        selectedRow = mouseX / 300;
    }

    // Detects the selected column based on the mouse Y position
    void detectCol() {
        selectedCol = mouseY / 300;
    }

    // Validates the player's move and updates the game board
    void validateMove() {
        if (boardState[selectedRow][selectedCol] == 0) { // Make sure the square is empty
            if (isP1Turn) { 
                image(cordelius, (mouseX / 300) * 300 + 75, (mouseY / 300) * 300 + 75); // Draw Player 1's image
                isP1Turn = false;
                isP2Turn = true;
                p1Moves++; // Increment Player 1's move count
                boardState[selectedRow][selectedCol] = 1; 
            } else if (isP2Turn) { // Player 2's move
                image(dynamike, (mouseX / 300) * 300, (mouseY / 300) * 300); // Draw Player 2's image
                isP1Turn = true;
                isP2Turn = false;
                p2Moves++; // Increment Player 2's move count
                boardState[selectedRow][selectedCol] = 5; 
            }
        }
    }

    // Evaluates the current state of the board to determine if there's a winner or a draw
    void evaluateWinner() {
        checkRowsAndCols(); // Check rows and columns for a winner
        checkDiagonals();   // Check diagonals for a winner
        checkForDraw();     // Check if the game is a draw
    }

    // Checks all rows and columns for a winning condition
    void checkRowsAndCols() {
        for (int r = 0; r < boardState.length; r++) { // Check rows
            totalMoves = 0;
            for (int c = 0; c < boardState[0].length; c++) {
                totalMoves += boardState[r][c];
            }
            confirmWinner();
        }

        for (int c = 0; c < boardState[0].length; c++) { // Check columns
            totalMoves = 0;
            for (int r = 0; r < boardState.length; r++) {
                totalMoves += boardState[r][c];
            }
            confirmWinner();
        }
    }

    // Checks both diagonals for a winning condition
    void checkDiagonals() {
        totalMoves = 0;
        for (int i = 0; i < boardState.length; i++) { // Top-left to bottom-right diagonal
            totalMoves += boardState[i][i];
        }
        confirmWinner();

        totalMoves = 0;
        for (int i = 0; i < boardState.length; i++) { // Top-right to bottom-left diagonal
            totalMoves += boardState[i][boardState.length - i - 1];
        }
        confirmWinner();
    }

    // Checks if the game is a draw
    void checkForDraw() {
        if (p1Moves + p2Moves == 9) { // All cells are filled
            displayDraw();
        }
    }

    // Confirms if there is a winner based on totalMoves
    void confirmWinner() {
        if (totalMoves == 3) { // Player 1 wins
            displayP1Victory();
        } else if (totalMoves == 15) { // Player 2 wins
            displayP2Victory();
        }
    }

    // If Player 1 wins
    void displayP1Victory() {
        fill(0);
        rect(400, 350, 430, 200); 
        fill(255);
        textSize(100);
        text("Cordelius", 420, 450);
        text("Wins!!!", 500, 520);
        p1Wins++; // Increment Player 1's win count
        restartGame(); // Reset the game
    }

    // If Player 2 wins
    void displayP2Victory() {
        fill(0);
        rect(400, 350, 430, 200);
        fill(255);
        textSize(100);
        text("Dynamike", 420, 450);
        text("Wins!!!", 500, 520);
        p2Wins++; 
        restartGame();
    }


    void displayDraw() {
        fill(0);
        rect(400, 360, 200, 110); 
        fill(255);
        textSize(100);
        text("Tie", 430, 450);
        restartGame(); 
    }

    // Restarts the game by resetting scores and updating the UI
    void restartGame() {
        resetScores();
        grid.setupUI();
        gameInProgress = false; 
    }
}
