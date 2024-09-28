    def test_home_status_code(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)

    def test_home_data(self):
        response = self.app.get('/')
        self.assertIn(b"Deployment with Jenkins", response.data)

    def test_time_status_code(self):
        response = self.app.get('/time')
        self.assertEqual(response.status_code, 200)

    def test_time_data(self):
        response = self.app.get('/time')
        self.assertIn(b"Current UTC Time", response.data)

    def test_unknown_page(self):
        response = self.app.get('/unknown')
        self.assertEqual(response.status_code, 404)

if __name__ == '__main__':
    unittest.main()