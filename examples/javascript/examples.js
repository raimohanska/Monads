var Async$307 = require('./async');
var task$309 = Async$307.of('cats').chain(function (x$310) {
        return Async$307.of('dogs').map(function (y$312) {
            return console.log('hello', x$310, 'and', y$312);
        });
    });
Async$307.runAsync(task$309);