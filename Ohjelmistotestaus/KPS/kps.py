from kpsCheck import kpsCheck
import random

options = ["rock", "paper", "scissors"]
computer_choice = random.choice(options)
exit_game = ""

while exit_game != "exit":
    user_choice = input("This is a game of rock, paper, scissors. Choose one!")
    user_choice = user_choice.lower()
    print(user_choice)

    #validating the input
    while user_choice not in ["rock", "paper", "scissors"]:
        print("Invalid input! Make sure you choose one of the following.. rock, paper, scissors")
        user_choice = input("This is a game of rock, paper, scissors. Choose one!")
        user_choice = user_choice.lower()
        

    result = kpsCheck(user_choice, computer_choice)
    print(result)
    exit_game = input("To continue playing press Enter. If you want to stop playing write 'exit' ")
    if exit_game == "exit":
        print("Thank you for playing!")   
        
# OTTO ANSAHARJU


