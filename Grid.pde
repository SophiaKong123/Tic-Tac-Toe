// Sophia Kong - Class to manage the game grid and UI
class Grid {
    int gridWidth;  
    int gridHeight;

    // Constructor to initialize grid dimensions
    Grid(int width, int height) {
        gridWidth = width;
        gridHeight = height;
    }

    // Draws the grid lines on the game board
    void initializeGrid(int width, int height) {
        for (int i = 0; i <= width; i++) { 
            stroke(0); 
            strokeWeight(10);
            line(boardPixelWidth - i * (boardPixelWidth / width), 0, 
                 boardPixelWidth - i * (boardPixelWidth / width), boardPixelHeight);
        }

        for (int i = 0; i <= height; i++) { 
            stroke(0);
            strokeWeight(10);
            line(0, boardPixelHeight - i * (boardPixelHeight / height), 
                 boardPixelWidth, boardPixelHeight - i * (boardPixelHeight / height));
        }
    }

    // Sets up the UI: including the start button and score display
    void setupUI() {
        stroke(2); 
        fill(0);
        strokeWeight(10);
        // Start button
        rect(950, 385, 200, 100); 
        fill(255); 
        textSize(50);
        text("Start", 1000, 450); 

        // Player 1's win count
        fill(#FFFFFF);
        textSize(30);
        text("Cordelius Wins:", 950, 100);
        textSize(40);
        text(p1Wins, 1150, 105);

        // Player 2's win count
        textSize(30);
        text("Dynamike Wins:", 940, 250);
        textSize(40);
        text(p2Wins, 1150, 255);

        // Current starting player
        textSize(30);
        text("Starting:", 940, 750);
    }
}
