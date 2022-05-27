const express = require("express");
const bodyParser = require("body-parser");
const request = require("request");

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(__dirname + '/public'));

app.get('/', (req, res) => {
    res.sendFile(__dirname + "/signup.htm");
}),

    app.post('/', (req, res) => {
        var firstName = req.body.fName;
        var lastName = req.body.lName;
        var email = req.body.email;
        console.log(firstName, lastName, email); 

        var data ={
            members:[
                {

                }
            ]
        }



        const response = client.lists.createList({
            name: "name",
            permission_reminder: "permission_reminder",
            email_type_option: true,
            contact: {
              company: "company",
              address1: "address1",
              city: "city",
              country: "country",
            },
            campaign_defaults: {
              from_name: "from_name",
              from_email: "Beulah_Ryan@hotmail.com",
              subject: "subject",
              language: "language",
            },
          });
          console.log(response);
    })
app.listen(3000, () => {
    console.log('App listening on port 3000');
})

const mailchimp = require("@mailchimp/mailchimp_marketing");
const client = require("mailchimp-marketing");

mailchimp.setConfig({
    apiKey: "edda4af1bbcdcb4a80f1762c78ba68d7-us11",
    server: "us11",
});

async function run() {
    const response = await mailchimp.ping.get();
    console.log(response);
}
run();
// edda4af1bbcdcb4a80f1762c78ba68d7-us11
// 34d3a040d5