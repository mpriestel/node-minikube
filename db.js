const { MongoClient, ObjectId } = require('mongodb')

const mongoHost = process.env.MONGO_HOST
const dbName = process.env.MONGO_DATABASE
const mongoUser = process.env.MONGO_USER
const mongoPass = process.env.MONGO_PASS
const connectionUrl = 'mongodb://' + mongoUser + ':' + mongoPass + '@' + mongoHost + '/' + dbName

let db

const init = () =>
  MongoClient.connect(connectionUrl, { useNewUrlParser: true }).then((client) => {
    db = client.db(dbName)
  })

const insertItem = (item) => {
  const collection = db.collection('items')
  return collection.insertOne(item)
}

const getItems = () => {
  const collection = db.collection('items')
  return collection.find({}).toArray()
}

const updateQuantity = (id, quantity) => {
  const collection = db.collection('items')
  return collection.updateOne({ _id: ObjectId(id) }, { $inc: { quantity } })
}

module.exports = { init, insertItem, getItems, updateQuantity }
