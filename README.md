Password Generator Tool

Welcome to the Password Generator Tool! This script generates passwords based on user-defined keywords and length, or it can produce random passwords. It features an easy-to-use command-line interface with colorized output and ASCII art.
Description

This script provides two primary functions:

    Generate Password: Create password variations from user-defined keywords.
    Generate Random Password: Produce a random password of the specified length.

The tool includes colorful ASCII art and a simple menu-driven interface to guide you through password generation.
Dependencies

Ensure you have the following dependencies installed before running the script:

    figlet: For generating large text in ASCII art.
    lolcat: For colorizing text output.

You can install these dependencies using the following commands:

bash

sudo apt-get install figlet lolcat

Installation

To install and use the Password Generator Tool, follow these steps:

    Clone the Repository: Download the script from GitHub:

    bash

git clone https://github.com/DevarshOza/StrongPasswordGenerator.git

Navigate to the Directory: Change to the directory containing the script:

bash

cd StrongPasswordGenerator

Make the Script Executable: Grant execute permissions to the script:

bash

chmod 777 passwordgenerator.sh

Run the Script: Start the tool:

bash

    ./passwordgenerator.sh

Usage

When you run the script, you will be presented with a menu with the following options:

    Generate Password: Create passwords based on keywords and desired length.
    Generate Random Password: Generate a random password of a specified length.
    Exit: Exit the script.

Generating a Password

    Select Option 1 to generate a password from keywords.
    Enter the number of keywords (between 2 and 4).
    Provide the keywords when prompted.
    Specify the desired length of the generated passwords.
    The script will output various password variations based on the keywords and length provided.

Generating a Random Password

    Select Option 2 to generate a random password.
    Specify the desired length for the random password.
    The script will generate and display a random password of the specified length.

Example

bash

./passwordgenerator.sh

Follow the on-screen prompts to either generate a password based on keywords or create a random password.
Troubleshooting

    Missing Dependencies: Ensure figlet and lolcat are installed. Use the installation commands provided above.
    Permissions Issues: Ensure you have the necessary permissions to execute the script.
    Invalid Input: If you enter invalid data (e.g., non-numeric length), the script will prompt you to enter valid data.
