// Sophia Kong - Tic Tac Toe Game

// Variables to track player moves and wins
int p1Moves = 0; 
int p2Moves = 0;

int p1Wins = 0;
int p2Wins = 0;
int gameCount; 

// Variables to track whose turn it is
boolean isP1Turn = false; 
boolean isP2Turn = false; 

boolean gameInProgress = false;

// Grid settings
int boardWidth = 3; 
int boardHeight = 3;
int boardPixelWidth = 900; 
int boardPixelHeight = 900;

// Images and fonts
PImage cordelius; 
PImage dynamike; 
PImage bg; 

// Game objects
Grid grid; 
TicTacToe ticTacToe;

// Setup function initializes the game environment
void setup() {
    // Load all required images
    cordelius = loadImage("cordelius.png");
    dynamike = loadImage("downloadC.png");
    bg = loadImage("brawl.jpg");

    // Resize images for consistency in the UI
    cordelius.resize(150, 150);
    dynamike.resize(300, 300);
    bg.resize(1200, 900);

    // Set canvas size and background
    size(1200, 900);
    background(bg);

    // Determine which player starts the first game
    firstPlayer();

    // Initialize the game board and UI
    grid = new Grid(boardWidth, boardHeight);
    grid.initializeGrid(boardWidth, boardHeight);
    grid.setupUI();

    // Initialize TicTacToe and reset scores
    ticTacToe = new TicTacToe();
    ticTacToe.resetScores();

    // Randomly decide the first player
    gameCount = int(random(10));
}


void draw() {
    // Empty
}

// Handles mouse clicks
void mousePressed() {
   
    if (mouseX > 950 && mouseX < 1150 && mouseY > 385 && mouseY < 585) {
        setup(); // Restart the game
        fill(255);
        rect(950, 385, 200, 100); 
        if (isP1Turn) {
            text("Cordelius", 1050, 750); 
        } else {
            text("Dynamike", 1050, 750); 
        }
        gameInProgress = true;
    }

    // Check if a grid cell is clicked during an active game
    if (mouseX < boardPixelWidth && mouseY < boardPixelHeight && gameInProgress) {
        if (isP1Turn) {
            ticTacToe.processMove();
        } else if (isP2Turn) {
            ticTacToe.processMove();
        }
    }
}

// Determines which player starts the game
void firstPlayer() {
    if (gameCount % 2 == 0) { 
        isP1Turn = true; 
        isP2Turn = false;
    } else {
        isP1Turn = false;
        isP2Turn = true;
    }
    gameCount++; // Increment the game count for the next game
}
