const express = require('express');


const bcrypt = require('bcrypt');
const { connection } = require('../mysql/mysql');


const app = express();

app.get('/new', (req, res) => {
    connection('SELECT * FROM casos', (err, results) => {
        if (err) {
            return res.status(400).json({
                err,
                message: 'No fue posible consultar.',
            });
        }

        if (!results[0]) {
            return res.status(400).json({
                ok: false,
                message: 'Aún no éxisten registros.'
            });
        }

        res.status(200).send({
            ok: true,
            casos: results,
        });
    });
});

module.exports = app;