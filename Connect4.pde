// Sophia Kong Connect4 class to handle game logic
class Connect4 {
    int[][] score = new int[6][7]; // Create array for Connect 4 (6*7)
    int total = 0; // Total sum to check for winner

    // Resets the score
    void scoreReset() {
        for (int r = 0; r < 6; r++) {
            for (int c = 0; c < 7; c++) {
                score[r][c] = 0; // Reset all cells to 0
            }
        }
        p1Moves = 0; // Reset Player 1 moves
        p2Moves = 0; // Reset Player 2 moves
    }

    //  Game logic
    void playGame() {
        int column = checkCol(); // Get the column clicked
        isEmptySquare(column); // Place the piece in the selected column
        checkAll(); // Check if there's a winner or draw
    }

    // Returns the column clicked as an integer
    int checkCol() {
        return mouseX / 135;
    }

    // Checks if there's an empty square in the selected column and places the piece
    void isEmptySquare(int column) {
        for (int rIndex = 5; rIndex >= 0; rIndex--) { // Start from the bottom row
            if (score[rIndex][column] == 0) { // If the cell is empty
                if (isP1Turn) { // Player 1's turn
                    image(cordelius, column * 135 + 30, rIndex * 135 + 130);
                    isP1Turn = false;
                    isP2Turn = true;
                    p1Moves++;
                    score[rIndex][column] = 1; // Mark as Player 1's piece
                } else if (isP2Turn) { // Player 2's turn
                    image(dynamike, column * 135 , rIndex * 135 + 95);
                    isP1Turn = true;
                    isP2Turn = false;
                    p2Moves++;
                    score[rIndex][column] = 5; // Mark as Player 2's piece
                }
                break; // Exit the loop after placing a piece
            }
        }
    }

    // Checks all possible win conditions
    void checkAll() {
        // Check rows
        for (int r = 0; r < 6; r++) {
            for (int c = 0; c < 4; c++) { // Ensure 4-in-a-row is possible
                total = score[r][c] + score[r][c + 1] + score[r][c + 2] + score[r][c + 3];
                isWinner();
            }
        }

        // Check columns
        for (int c = 0; c < 7; c++) {
            for (int r = 0; r < 3; r++) { // Ensure 4-in-a-column is possible
                total = score[r][c] + score[r + 1][c] + score[r + 2][c] + score[r + 3][c];
                isWinner();
            }
        }

        // Check diagonals (top-left to bottom-right)
        for (int r = 0; r < 3; r++) {
            for (int c = 0; c < 4; c++) {
                total = score[r][c] + score[r + 1][c + 1] + score[r + 2][c + 2] + score[r + 3][c + 3];
                isWinner();
            }
        }

        // Check diagonals (top-right to bottom-left)
        for (int r = 0; r < 3; r++) {
            for (int c = 3; c < 7; c++) {
                total = score[r][c] + score[r + 1][c - 1] + score[r + 2][c - 2] + score[r + 3][c - 3];
                isWinner();
            }
        }

        // Check for a draw
        if (p1Moves + p2Moves == 42) { // All cells are filled
            tieGame();
        }
    }

    // Determines if there's a winner
    void isWinner() {
        if (total == 4) { // Player 1 wins
            player1Wins();
        } else if (total == 20) { // Player 2 wins
            player2Wins();
        }
    }

    // Displays Player 1's victory message
    void player1Wins() {
      playAgain(); 
        fill(0);
        rect(400, 350, 430, 200); 
        fill(255);
        textSize(100);
        text("Cordelius", 420, 450);
        text("Wins!!!", 500, 520);
        p1Wins++; // Increment Player 1's win count
        
    }

    // Displays Player 2's victory message
    void player2Wins() {
        playAgain();
        fill(0);
        rect(400, 350, 430, 200);
        fill(255);
        textSize(100);
        text("Dynamike", 420, 450);
        text("Wins!!!", 500, 520);
        p2Wins++; 
    }

    // Displays tie game message
    void tieGame() {
      playAgain(); 
        fill(0);
        rect(400, 360, 200, 110); 
        fill(255);
        textSize(100);
        text("Tie", 430, 450);
    }

    // Restarts the game by resetting the board
    void playAgain() {
        scoreReset();
        grid.gridSetup(boardWidth, boardHeight);
        grid.setupUI();
        gameInProgress = false;
    }
}
