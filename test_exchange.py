import unittest
from main import exchange

class TestExchange(unittest.TestCase):
    
    def test_exchange_positive_amount(self):
        self.assertEqual(exchange(100, 1.2), 120)

    def test_exchange_zero_amount(self):
        self.assertEqual(exchange(0, 1.5), 0)

    def test_exchange_negative_rate(self):
        self.assertEqual(exchange(100, -1), -100)

if __name__ == "__main__":
    unittest.main()
