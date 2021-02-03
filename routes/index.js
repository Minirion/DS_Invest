// const thingsRoutes = require('./things');
const getEventList = require ('./events')

module.exports = (app) => {
  app.use("/api/eventslist", getEventList)
}