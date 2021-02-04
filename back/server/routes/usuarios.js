// ================================
// DECLARACIONES GLOBALES Y LOCALES
// ================================
const express = require('express');
const bcrypt = require('bcrypt');
const { connection } = require('../mysql/mysql');
const app = express();

//=======
//GET ALL
//=======
app.get('/usuarios', (req, res) => {
    //======================
    //DECLARAMOS LA CONSULTA
    //======================
    let query = `SELECT*FROM casos`;

    //====================
    //EJECUTAMOS EL SCRIPT
    //====================
    connection(query, (error, results) => {
        //=======================================
        //VALIDADMOS SI HUBO ERROR EN LA CONSULTA
        //=======================================
        if (error) {
            return res.status(400).json({
                ok: false,
                message: 'Error en la consulta.',
                error
            });
        }
        //================================
        //VALIDAMOS SI LA TABLA ESTA VACIA
        //================================
        if (!results[0]) {
            return res.status(204).json({
                ok: true,
                message: 'Aún no éxisten registros.'
            });
        }

        res.status(200).json({
            ok: true,
            message: 'Consulta éxitosa.',
            data: results
        });
    });
});

//=======
//GET ONE
//=======
app.get('/usuarios', (req, res) => {
    //======================
    //DECLARAMOS LA CONSULTA
    //======================
    let query = `SELECT*FROM casos`;

    //====================
    //EJECUTAMOS EL SCRIPT
    //====================
    connection(query, (error, results) => {
        //=======================================
        //VALIDADMOS SI HUBO ERROR EN LA CONSULTA
        //=======================================
        if (error) {
            return res.status(400).json({
                ok: false,
                message: 'Error en la consulta.',
                error
            });
        }
        //================================
        //VALIDAMOS SI LA TABLA ESTA VACIA
        //================================
        if (!results[0]) {
            return res.status(204).json({
                ok: true,
                message: 'Aún no éxisten registros.'
            });
        }

        res.status(200).json({
            ok: true,
            message: 'Consulta éxitosa.',
            data: results
        });
    });
});

module.exports = app;