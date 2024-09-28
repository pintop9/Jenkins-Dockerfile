

const request = require('supertest');  // Import Supertest for HTTP assertions
const app = require('./src/index');    // Import your Express app

describe('Home Page Tests', () => {
    test('GET / should return status code 200', async () => {
        const response = await request(app).get('/');
        expect(response.statusCode).toBe(200);
    });

    test('GET / should return correct data', async () => {
        const response = await request(app).get('/');
        expect(response.text).toContain('Deployment with Jenkins'); // Adjust based on your actual response
    });

    test('GET /time should return status code 200', async () => {
        const response = await request(app).get('/time');
        expect(response.statusCode).toBe(200);
    });

    test('GET /time should include "Current UTC Time"', async () => {
        const response = await request(app).get('/time');
        expect(response.text).toContain('Current UTC Time');
    });

    test('GET /unknown should return status code 404', async () => {
        const response = await request(app).get('/unknown');
        expect(response.statusCode).toBe(404);
    });
});
