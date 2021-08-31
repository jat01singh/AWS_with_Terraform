import requests
import unittest

COUNTER_URL = 'http://localhost:8888/counter'

class TestCounter(unittest.TestCase):

    def setUp(self):
        requests.delete(COUNTER_URL)

    def test_get(self):
        response = requests.get(COUNTER_URL)
        self.assertEqual(200, response.status_code)
        content_json = response.json()
        self.assertIn("counter", content_json)
        self.assertEqual(0, content_json["counter"])

    def test_increment_counter(self):
        response = requests.get(COUNTER_URL)
        self.assertEqual(0, response.json()["counter"])
        response = requests.post(COUNTER_URL)
        self.assertEqual(200, response.status_code)
        self.assertEqual(1, response.json()["counter"])
        response = requests.get(COUNTER_URL)
        self.assertEqual(1, response.json()["counter"])

if __name__ == '__main__':
    unittest.main()