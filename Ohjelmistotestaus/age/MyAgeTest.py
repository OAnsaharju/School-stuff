import unittest
from AgeVerifyer import verifyAge


class MyAgeTest(unittest.TestCase):
    def test_SendValueForChild_And_CheckResponse(self):
        #arrange
        a = int(7)
        #act
        result = verifyAge(a)
        #assert
        self.assertEqual(result, "Olet lapsi")

    def test_SendValueForAdult_And_CheckResponse(self):
        #arrange
        a = int(20)
        #act
        result = verifyAge(a)
        #assert
        self.assertEqual(result, "Olet aikuinen")

    def test_SendValueForPensioner_And_CheckResponse(self):
        #arrange
        a = int(71)
        #act
        result = verifyAge(a)
        #assert
        self.assertEqual(result, "Olet eläkeläinen")


if (__name__ == "__main__"):
    unittest.main()