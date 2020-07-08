#include <iostream>
#include <random>
#include <ctime>

int guess_not_correct(int target){
    int guess = 0;
    std::cout << "Enter your guess: ";
    std::cin >> guess;

    if (guess == target){
        std::cout << "Congratulations you guessed correct!" << std::endl;
        return false;  // "guess_not_correct" is false now 
    }
    else if (guess > target)
    {
        std::cout << "Guess is LARGER than the target" << std::endl;
    }
    else
    {
        std::cout << "Guess is  SMALLER than the target" << std::endl;
    }

    return true; // in all cases except guess==target "guess_not_correct" is true.
    
    
}

int main(){
    std::cout << "Welcome to the Guessing Game" << std::endl;
    std::cout << "Guess the number between 0 and 99" << std::endl;

    std::srand(std::time(nullptr));  // seed the random number using current time
    int random_int = std::rand() % 99; // returns a random number from 0-99

    while (guess_not_correct(random_int)){
    }
}