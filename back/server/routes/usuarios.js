// ================================
// DECLARACIONES GLOBALES Y LOCALES
// ================================
const express = require('express');
const bcrypt = require('bcrypt');
const {
    connection
} = require('../mysql/mysql');
const {
    json
} = require('body-parser');
const app = express();

//=======
//GET ALL
//=======
app.get('/usuarios', (req, res) => {
    //======================
    //DECLARAMOS LA CONSULTA
    //======================
    let query = `SELECT*FROM Usuarios`;

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
            return res.status(400).json({
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
app.get('/usuarios/:id', (req, res) => {
    let id = req.params.id;
    //======================
    //DECLARAMOS LA CONSULTA
    //======================
    let query = `SELECT*FROM Usuarios WHERE idUsuarios=${id}`;

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
            return res.status(400).json({
                ok: true,
                message: 'Aún no éxisten registros.'
            });
        }

        res.status(200).json({
            ok: true,
            message: 'Consulta éxitosa.',
            data: results[0]
        });
    });
});

app.post('/usuarios/interno', (req, res) => {
    let body = req.body;

    if (
        !body.user ||
        !body.email ||
        !body.password ||
        !body.tipoUsuario ||
        !body.persona
    ) {
        return res.status(400).json({
            ok: false,
            message: 'Todos los campos son obligatorios',
        });
    }

    let queryAUTH = `SELECT*FROM Usuarios WHERE email='${body.email}' OR user='${body.user}'`;

    connection(queryAUTH, (errorAUTH, resultsAUTH) => {
        if (errorAUTH) {
            return res.status(400).json({
                ok: false,
                message: 'Error en la consulta.',
                errorAUTH
            });
        }
        if (resultsAUTH[0]) {
            return res.status(400).json({
                ok: false,
                message: 'Ya éxiste un registro con estos datos, por favor verfica tu información.',
            });
        }

        let queryAP = `SELECT*FROM Personal WHERE email='${body.persona}'`;
        connection(queryAP, (errorAP, resultsAP) => {
            if (errorAP) {
                return res.status(400).json({
                    ok: false,
                    message: 'Error en la consulta.'
                });
            }
            if (!resultsAP[0]) {
                return res.status(400).json({
                    ok: false,
                    message: 'Este registro no éxiste, por favor verifica tu información.'
                });
            }

            let idClientes = resultsAP[0].idClientes;

            let queryTU = `SELECT*FROM TipoUsuario WHERE nombre='${body.tipoUsuario}'`;
            connection(queryTU, (errorTU, resultsTU) => {
                if (errorTU) {
                    return res.status(400).json({
                        ok: false,
                        message: 'Error en la consulta.'
                    });
                }
                if (!resultsTU[0]) {
                    return res.status(400).json({
                        ok: false,
                        message: 'Este registro no éxiste, por favor verifica tu información.'
                    });
                }
                let idTipoUsuario = resultsTU[0].idTipoUsuario;
                let password = bcrypt.hashSync(body.password, 10);

                let queryINSERT = `INSERT INTO Usuarios (user,email,password,status,idTipoUsuario,idPersona) VALUES('${body.user}','${body.email}','${password}','0','${idTipoUsuario}','${idClientes}');`;
                connection(queryINSERT, (errorINSERT, resultsINSERT) => {
                    if (errorTU) {
                        return res.status(400).json({
                            ok: false,
                            message: 'Error en la consulta.'
                        });
                    }
                    res.json({
                        ok: true,
                        message: 'Registro éxitoso.'
                    });
                });
            });
        });

    });

});


app.post('/usuarios/clientes', (req, res) => {
    let body = req.body;

    if (
        !body.user ||
        !body.email ||
        !body.password
    ) {
        return res.status(400).json({
            ok: false,
            message: 'Todos los campos son obligatorios',
        });
    }

    let queryAUTH = `SELECT*FROM Usuarios U
    JOIN TipoUsuario TU
    ON TU.idTipoUsuario=U.idTipoUsuario
    WHERE U.email='${body.email}' AND U.user='${body.user}' AND TU.nombre='user'`;

    connection(queryAUTH, (errorAUTH, resultsAUTH) => {
        if (errorAUTH) {
            return res.status(400).json({
                ok: false,
                message: 'Error en la consulta.',
                errorAUTH
            });
        }
        if (resultsAUTH[0]) {
            return res.status(400).json({
                ok: false,
                message: 'Ya éxiste un registro con estos datos, por favor verfica tu información.',
            });
        }

        let queryAP = `SELECT*FROM Clientes WHERE email='${body.persona}'`;
        connection(queryAP, (errorAP, resultsAP) => {
            if (errorAP) {
                return res.status(400).json({
                    ok: false,
                    message: 'Error en la consulta.'
                });
            }
            if (!resultsAP[0]) {
                let queryADD = `INSERT INTO Clientes (email,status) VALUES('${body.persona}','1')`;
                connection(queryADD, (errorADD, resultsADD) => {
                    
                    console.log(queryADD);

                    if (errorADD) {
                        return res.status(400).json({
                            ok: false,
                            message: 'Error en la consulta.'
                        });
                    }
                    let queryNEW = `SELECT*FROM Clientes WHERE email='${body.persona}'`;
                    connection(queryNEW, (errorNEW, resultsNEW) => {
                        if (errorNEW) {
                            return res.status(400).json({
                                ok: false,
                                message: 'Error en la consulta.'
                            });
                        }

                        let idClientes = resultsNEW[0].idClientes;
                        let queryTU = `SELECT*FROM TipoUsuario WHERE nombre='${body.tipoUsuario}'`;
                        connection(queryTU, (errorTU, resultsTU) => {
                            if (errorTU) {
                                return res.status(400).json({
                                    ok: false,
                                    message: 'Error en la consulta.'
                                });
                            }
                            if (!resultsTU[0]) {
                                return res.status(400).json({
                                    ok: false,
                                    message: 'Este registro no éxiste, por favor verifica tu información.'
                                });
                            }
                            let idTipoUsuario = resultsTU[0].idTipoUsuario;
                            let password = bcrypt.hashSync(body.password, 10);
                            let queryINSERT = `INSERT INTO Usuarios (user,email,password,status,idTipoUsuario,idPersona) VALUES('${body.user}','${body.email}','${password}','0','${idTipoUsuario}','${idClientes}');`;
                            connection(queryINSERT, (errorINSERT, resultsINSERT) => {
                                if (errorINSERT) {
                                    return res.status(400).json({
                                        ok: false,
                                        message: 'Error en la consulta.'
                                    });
                                }
                                return res.json({
                                    ok: true,
                                    message: 'Registro éxitoso.'
                                });
                            });
                        });

                    });
                });

            }

            let idClientes = resultsAP[0].idClientes;
            let queryTU = `SELECT*FROM TipoUsuario WHERE nombre='${body.tipoUsuario}'`;
            connection(queryTU, (errorTU, resultsTU) => {
                if (errorTU) {
                    return res.status(400).json({
                        ok: false,
                        message: 'Error en la consulta.'
                    });
                }
                if (!resultsTU[0]) {
                    return res.status(400).json({
                        ok: false,
                        message: 'Este registro no éxiste, por favor verifica tu información.'
                    });
                }
                let idTipoUsuario = resultsTU[0].idTipoUsuario;
                let password = bcrypt.hashSync(body.password, 10);
                let queryINSERT = `INSERT INTO Usuarios (user,email,password,status,idTipoUsuario,idPersona) VALUES('${body.user}','${body.email}','${password}','0','${idTipoUsuario}','${idClientes}');`;
                connection(queryINSERT, (errorINSERT, resultsINSERT) => {
                    if (errorINSERT) {
                        return res.status(400).json({
                            ok: false,
                            message: 'Error en la consulta.'
                        });
                    }
                    res.json({
                        ok: true,
                        message: 'Registro éxitoso.'
                    });
                });
            });

        });

    });

});

module.exports = app;