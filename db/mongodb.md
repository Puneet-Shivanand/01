## Mongobd


    # basics
    show dbs
    use <db>
    db
    show collections

    new Date
    new ObjectId


    # queries

    <query>.forEach(printjson)

    db.collection.count()

    db.<collection>.insert(<doc>);
    db.<collection>.insert({ _id : 3})
    db.<collection>.insert({"_id": getNextSequence("<collection"), "<field>": "<value>"})

    db.<collection>.find();
    db.<collection>.find().forEach(printjson)
    db.<collection>.find({'<field>': '<value>'})
    db.<collection>.find({'<field>': '</.*a.*>'})  #values start with 'a'
    db.<collection>.find()[0]._id.getTimestamp()

    db.<collection>.findOne({ <field>: <value> })
    db.<collection>.findOne({ <field>.<field>: <value> })
    db.<collection>.findOne({ <field>: <value> }).<field>
    db.<collection>.findOne({ <field>: <value> }, {<field>: 1, <field>:0 })


    # auto increment field
    function getNextSequence(name) {
    var ret = db.counters.findAndModify(
          {
              query: { _id: name },
              update: { $inc: { seq: 1 } },
              new: true,
              upsert: true
          }
      );
    return ret.seq;
    }


    # import export

    mongo <host>/<db> <file>.js

    mongoimport --db <db> --collection <collection> <file>.json

    mongoimport --db <db> --collection <collection> <file>.json --jsonArray

    mongoexport --db <db> --collection <collection> --out <file>.json

    mongoexport --db <db> --collection <collection> --out <file>.json --jsonArray
