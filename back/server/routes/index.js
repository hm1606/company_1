const express = require('express');

const app = express();

app.use(require('./hello'));
app.use(require('./usuarios'));

module.exports = app;