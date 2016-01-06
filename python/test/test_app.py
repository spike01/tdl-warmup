import unittest

from app import App


class TestApp(unittest.TestCase):
    # I test my implementation of sum before submitting it.
    def test_sum(self):
        self.assertEqual(App.sum(1, 2), 3)
