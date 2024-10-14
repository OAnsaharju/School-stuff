import unittest
from kpsCheck import kpsCheck

#   Here we have established all of the possible scenarios for testing the game logic
#   in the function. Validating the inputs has been done in the program itself.

class MyKpsTest(unittest.TestCase):
    def test_tie_scenarios(self):
        self.assertEqual(kpsCheck("rock", "rock"), "It's a tie!")
        self.assertEqual(kpsCheck("paper", "paper"), "It's a tie!")
        self.assertEqual(kpsCheck("scissors", "scissors"), "It's a tie!")

    def test_user_win_scenarios(self):
        self.assertEqual(kpsCheck("rock", "scissors"), "You win!")
        self.assertEqual(kpsCheck("scissors", "paper"), "You win!")
        self.assertEqual(kpsCheck("paper", "rock"), "You win!")

    def test_user_loss_scenarios(self):
        self.assertEqual(kpsCheck("rock", "paper"), "Computer Wins!")
        self.assertEqual(kpsCheck("scissors", "rock"), "Computer Wins!")
        self.assertEqual(kpsCheck("paper", "scissors"), "Computer Wins!")


if (__name__ == "__main__"):
    unittest.main()

# OTTO ANSAHARJU