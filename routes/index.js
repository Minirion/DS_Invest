// const thingsRoutes = require('./things');
const getEventList = require ('./getEventList')

module.exports = (app) => {
  app.use("/api/eventslist", getEventList)
}