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

module.exports = router;