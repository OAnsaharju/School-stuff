import unittest
from triangleCheck import triangleChecker

class MyTriangleTest(unittest.TestCase):
    def test_IfAllSidesAreEqual(self): 


        a = int(7)
        b = int(7)
        c = int(7)
        result = triangleChecker(a, b, c)
        self.assertEqual(result, "Kolmio on tasasivuinen")

    def test_IfTwoSidesAreEqual(self):
    
        a = int(7)
        b = int(3)
        c = int(7)
        result = triangleChecker(a, b, c)
        self.assertEqual(result, "Kolmio on tasakylkinen")

    def test_IfNoneOfTheSidesAreEqual(self):
       
        a = int(7)
        b = int(1)
        c = int(2)
        result = triangleChecker(a, b, c)
        self.assertEqual(result, "Kaikki kolmion sivut ovat eripituisia")

if (__name__ == "__main__"):
    unittest.main()