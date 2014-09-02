var Async = require("./async")

var task = $do {
  x <- Async.of("cats")
  y <- Async.of("dogs")
  return console.log("hello", x, "and", y)
}

Async.runAsync(task)
