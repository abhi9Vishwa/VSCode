const express = require("express");
const bodyParser = require("body-parser");
const ejs = require("ejs");
const lodash = require('lodash');
const homeStartingContent = "Lacus vel facilisis volutpat est velit egestas dui id ornare. Semper auctor neque vitae tempus quam. Sit amet cursus sit amet dictum sit amet justo. Viverra tellus in hac habitasse. Imperdiet proin fermentum leo vel orci porta. Donec ultrices tincidunt arcu non sodales neque sodales ut. Mattis molestie a iaculis at erat pellentesque adipiscing. Magnis dis parturient montes nascetur ridiculus mus mauris vitae ultricies. Adipiscing elit ut aliquam purus sit amet luctus venenatis lectus. Ultrices vitae auctor eu augue ut lectus arcu bibendum at. Odio euismod lacinia at quis risus sed vulputate odio ut. Cursus mattis molestie a iaculis at erat pellentesque adipiscing.";
const aboutContent = "Hac habitasse platea dictumst vestibulum rhoncus est pellentesque. Dictumst vestibulum rhoncus est pellentesque elit ullamcorper. Non diam phasellus vestibulum lorem sed. Platea dictumst quisque sagittis purus sit. Egestas sed sed risus pretium quam vulputate dignissim suspendisse. Mauris in aliquam sem fringilla. Semper risus in hendrerit gravida rutrum quisque non tellus orci. Amet massa vitae tortor condimentum lacinia quis vel eros. Enim ut tellus elementum sagittis vitae. Mauris ultrices eros in cursus turpis massa tincidunt dui.";
const contactContent = "Scelerisque eleifend donec pretium vulputate sapien. Rhoncus urna neque viverra justo nec ultrices. Arcu dui vivamus arcu felis bibendum. Consectetur adipiscing elit duis tristique. Risus viverra adipiscing at in tellus integer feugiat. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Consequat interdum varius sit amet mattis. Iaculis nunc sed augue lacus. Interdum posuere lorem ipsum dolor sit amet consectetur adipiscing elit. Pulvinar elementum integer enim neque. Ultrices gravida dictum fusce ut placerat orci nulla. Mauris in aliquam sem fringilla ut morbi tincidunt. Tortor posuere ac ut consequat semper viverra nam libero.";

const app = express();
var postLog = [{ title: 'Qwerty', body: "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum" },
{ title: 'Day 1', body: "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)." }];

app.set('view engine', 'ejs');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));


app.get("/", (req, res) => {

  res.render('home.ejs', {
    para1: homeStartingContent,
    posts: postLog,
  });
});

app.get("/post/:postTitleName", (req, res) => {
  var hasMatch = false;
  for (var index = 0; index < postLog.length; index++) {

    if (lodash.kebabCase(lodash.toLower((postLog[index].title))) == lodash.kebabCase(lodash.toLower(req.params.postTitleName))) {
      // console.log(lodash.kebabCase(postLog[index].title));
      console.log(lodash.kebabCase(lodash.toLower((postLog[index].title))));
      hasMatch = true;
      res.render('post.ejs', {
        customPostTitle: postLog[index].title,
        customPostBody: postLog[index].body,
      });
      break;
    }
  }
  console.log(hasMatch);
})

app.get("/about", (req, res) => {

  res.render('about.ejs', {
    paraAbout: aboutContent,
  });
});
app.get("/contact", (req, res) => {

  res.render('contact.ejs', {
    paraContact: contactContent,
  });
})
app.get("/compose", (req, res) => {

  res.render('compose.ejs', {

  });
})

app.post("/", (req, res) => {
  console.log(req.body.title);
  console.log(req.body.body);

  var post = { title: req.body.title, body: req.body.body }

  postLog.push(post)
  console.log(postLog);
  console.log(postLog[0].title);
  res.redirect('/')
})








app.listen(3000, function () {
  console.log("Server started on port 3000");
});
