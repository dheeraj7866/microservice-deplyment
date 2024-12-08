const express = require('express');
const app = express();

app.get('/', (req, res) => {
    res.send({ message: "Welcome to Service B - Node.js App" });
});

app.get('/api/data', (req, res) => {
    res.send({ data: "This is some sample data from Service B." });
});

const PORT = 3000;
app.listen(PORT, () => console.log(`Service B is running on port ${PORT}`));