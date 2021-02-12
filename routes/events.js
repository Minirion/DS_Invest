const express = require("express");
const connection = require("../db");

const router = express.Router();

router.get("/", async (req, res) => {
  try {
    const eventList = await connection.query(
      `SELECT date, name_event, description, theme, lieu, number_participants FROM event;`,
    )
    console.log(eventList)
    res.status(200).json(eventList)
  }
  catch (error) {
    console.log(error)
    res.status(500)
  }
});

router.get("/:name_event", async (req, res) => {

  const { name_event } = req.params;

  try {
    const event = await connection.query(`SELECT * FROM event WHERE name_event = ?`, [name_event]);
    console.log(event);
    res.status(200).json(event);
  } catch (err) {
    console.log(err);
    res.status(500).send(err);
  }
});

module.exports = router;