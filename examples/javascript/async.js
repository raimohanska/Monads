Async = function(f) {
  if (!(this instanceof Async)) return new Async(f)
  this.run = f
}
Async.prototype.chain = function(f) {
  var self = this
  return Async(function(callback) {
    self.run(function(value) {
      var next = f(value)
      next.run(callback)
    })
  })
}
Async.of = Async.prototype.of = function(value) {
  return new Async(function(callback) {
    callback(value)
  })
}
Async.liftIO = function(f) {
  return new Async(function(callback) {
    callback(f())
  })
}
Async.runAsync = function(async) {
  async.run(function() {})
}

// Derived
Async.prototype.map = function(f) {
    return this.chain(function(a) {
        return Async.of(f(a));
    });
};
Async.prototype.ap = function(a) {
    return this.chain(function(f) {
        return a.map(f);
    });
};

// Export
if(typeof module != 'undefined')
    module.exports = Async;

