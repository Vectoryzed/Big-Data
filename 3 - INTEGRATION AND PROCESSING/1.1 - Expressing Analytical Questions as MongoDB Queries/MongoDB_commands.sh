cd Downloads/big-data-3/mongodb
./mongodb/bin/mongod --dbpath db

cd Downloads/big-data-3/mongodb
./mongodb/bin/mongo
show dbs
use sample
show collections
db.users.findOne()
db.users.find({"user.Location: {$ne: null}}).count()
db.users.find({$where: "this.user.FollowersCount > this.user.FriendsCount"}).count()
db.users.find({tweet_text: /http:/}, {tweet_text: 1}).pretty()
db.users.find({$and: [{tweet_text: /England/}, {tweet_text: {$ne: /UEFA/}}]}, {tweet_text: 1}).pretty()
db.users.find({$and: [{tweet_text: /UEFA/}, {"user.Location": "Ireland"}]}, {tweet_text: 1, user_name: 1, _id: 0}).pretty()
cd mongodb
./bin/mongoexport --db sample --collection users --out mongoexport.csv
