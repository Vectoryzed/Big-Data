cd Downloads/big-data-3/mongodb

./mongodb/bin/mongod --dbpath db

cd Downloads/big-data-3/mongodb

./mongodb/bin/mongo
show dbs
use sample
db.users.count()
db.users.findOne()
db.users.distinct("user_name")
db.users.find({user_name: "ActionSportsJax"})
db.users.find({user_name: "ActionSportsJax"}).pretty()
db.users.find({user_name: "ActionSportsJax"}, {tweet_ID: 1})
db.users.find({user_name: "ActionSportsJax"}, {tweet_ID: 1, _id: 0})
db.users.find({tweet_text: "FIFA"})
db.users.find({tweet_text: /FIFA/}).count()
db.users.createIndex({"tweet_text: "text"})
db.users.find({$text: {$search: "FIFA"}}).count()
db.users.find({$text: {$search: "FIFA - Texas"}}).count()
db.users.find({tweet_mentioned_count: {$gt: 6}})
db.users.find({$where: "this.tweet_mentioned_count > this.tweet_followers_count"}).count()
db.users.find({$and: [{tweet_text: /FIFA/}, {tweet_mentioned_count: {$gt: 4}}]}).count()