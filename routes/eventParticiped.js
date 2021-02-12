const express = require("express");
const connection = require("../db");
const router = express.Router();

router.post("/participate_event", async (req, res) => {

    try{

    const userQuery = `INSERT INTO 
    user (name, mail) VALUES (?, ?);`;
    const userValues = [
        req.body.name,
        req.body.mail
    ];
    const {insertId: user_id} = await connection.query(userQuery, userValues);

    const eventUserQuery = `INSERT INTO 
    event_has_user (event_id, user_id) VALUES (?, ?) WHERE event_id = ?;`;
    const eventUserValues = [
        req.body.event_id,
        user_id
    ];

    await connection.query(eventUserQuery, eventUserValues);

    res.sendStatus(200);
}

catch(error){
    console.log(error);
    res.status(500).send(error);
}});

module.exports = router;