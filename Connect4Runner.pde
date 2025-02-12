// Sophia Kong - Connect 4 Game

// Variables to track player moves and wins
int p1Moves = 0; 
int p2Moves = 0;

int p1Wins = 0;
int p2Wins = 0;
int gameCount; 

// Variables to track who's turn it is
boolean isP1Turn = false; 
boolean isP2Turn = false; 

boolean gameInProgress = false;

// Grid settings
int boardWidth = 7; // Columns for Connect 4
int boardHeight = 6; // Rows for Connect 4
int boardPixelWidth = 945; // Width of the board in pixels (7 columns x 135 each)
int boardPixelHeight = 810; // Height of the board in pixels (6 rows x 135 each)

// Images and fonts
PImage cordelius; 
PImage dynamike; 
PImage bg; 

// Game objects
Grid grid; 
Connect4 connect4;

// Setup function initializes the icons, bg...
void setup() {
    // Load all required images
    cordelius = loadImage("cordelius.png");
    dynamike = loadImage("downloadC.png");
    bg = loadImage("brawl.jpg");

    // Resize images for consistency in the UI
    cordelius.resize(75, 75);
    dynamike.resize(135, 135);
    bg.resize(1200, 900);

    // Set canvas size and background
    size(1200, 900);
    background(bg);

    // Determine which player starts the first game
    firstPlayer();

    // Initialize the game board and UI
    grid = new Grid(boardWidth, boardHeight);
    grid.gridSetup(boardWidth,boardHeight);
    grid.setupUI();

    // Initialize Connect4 and reset scores
    connect4 = new Connect4();
    connect4.scoreReset();

    // Randomly decide the first player
    gameCount = int(random(10));
}

void draw() {
}

// Handles mouse clicks
void mousePressed() {
    // Handle Start button click
    if (mouseX > 1000 && mouseX < 1200 && mouseY > 385 && mouseY < 485) {
        setup(); // Restart the game
         fill(0);
        rect(980, 385, 200, 100); 
        if (isP1Turn) {
          fill(255);
            text("Cordelius", 1070, 750); 
        } else {
          fill (255);
            text("Dynamike", 1070, 750); 
        }
        gameInProgress = true;
        return;
    }

    // Only allow clicks above the grid
    if (mouseX < boardPixelWidth && mouseY<100 && gameInProgress) {
        connect4.playGame(); // Process the move
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
