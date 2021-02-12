// const thingsRoutes = require('./things');
const getEventList = require ('./events')
const postParticipateEvent = require('./eventParticiped')

module.exports = (app) => {
  app.use("/api/eventslist", getEventList)
  app.use("/api", postParticipateEvent)
}