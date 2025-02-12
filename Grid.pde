// Sophia Kong - Class to manage the game grid and UI
class Grid {
    int gridWidth;  // Number of columns 
    int gridHeight; // Number of rows

    // Grid dimensions
    Grid(int tWidth, int tHeight) {
        gridWidth = tWidth;
        gridHeight = tHeight;
    }

    // Draws the grid with specified columns and rows
    void initializeGrid(int colBoard, int rowBoard) {
        for (int i = 0; i <= colBoard + 1; i++) { // Vertical lines
            stroke(#FFFFFF);
            strokeWeight(8); 
            line(boardPixelWidth - i * (boardPixelWidth / colBoard), 100, 
                 boardPixelWidth - i * (boardPixelWidth / colBoard), boardPixelHeight + 100); 
        }

        for (int i = 0; i <= rowBoard; i++) { // Horizontal lines 
            stroke(#FFFFFF);
            strokeWeight(8);
            line(0, boardPixelHeight - i * (boardPixelHeight / rowBoard) + 100, 
                 boardPixelWidth, boardPixelHeight - i * (boardPixelHeight / rowBoard) + 100);
        }

        for (int i = 1; i <= colBoard + 1; i++) { // Top boxes
            fill(255);
            stroke(255);
            strokeWeight(4);
            circle(boardPixelWidth - i * (boardPixelWidth / colBoard) + 75, 50, 50);
        }
    }

    // Sets up the UI: including the start button and score display
    void setupUI() {
        // Draw start button
        stroke(2); 
        fill(0);
        strokeWeight(10);
        rect(980, 385, 200, 100); 
        fill(255); 
        textSize(50);
        text("Start", 1025, 450); 

        // Display Player 1's win count
        fill(#FFFFFF);
        textSize(30);
        text("Cordelius Wins:", 960, 100);
        textSize(40);
        text(p1Wins, 1160, 105);

        // Display Player 2's win count
        textSize(30);
        text("Dynamike Wins:", 960, 250);
        textSize(40);
        text(p2Wins, 1165, 255);

        // Indicate the current starting player
        textSize(30);
        text("Starting:", 960, 750);
    }

    // Setup the grid based on width and height
    void gridSetup(int boardWidth, int boardHeight) {
        gridWidth = boardWidth;
        gridHeight = boardHeight;
        initializeGrid(gridWidth, gridHeight);
    }
}
