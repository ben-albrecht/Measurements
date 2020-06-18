/* A tool for taking quickly gathering timings of multiple sections in a program */
module Measurements {
  import Time.Timer;
  import Map.map;
  import List.list;

  // TODO: create replicated global stop watch across locales

  var globalStopWatch = new StopWatch();

  proc start(id='') {
    globalStopWatch.start(id);
  }

  proc stop(id='') {
    globalStopWatch.stop(id);
  }

  proc elapsed(id='') {
    return globalStopWatch[id];
  }

  proc printTimings() throws {
    writeln(globalStopWatch);
  }


  /* Timer manager */
  record StopWatch {
    var timers: map(string, Timer);
    var order: list(string);

    /* Pretty print */
    proc writeThis(f) throws {
      for id in order {
        if id == '' then
          f.writef('%16s : %r\n', 'Total', this[id]);
        else {
          f.writef('%16s : %r\n', id, this[id]);
        }
      }
    }

    proc reset(id='') {
      timers[id].reset();
    }

    proc elapsed(id='') {
      return timers[id].elapsed();
    }

    proc start(id='') {
      if !this.timers.contains(id) {
        this.timers[id] = new Timer();
        order.append(id);
      }
      timers[id].start();
    }

    proc stop(id='') {
      timers[id].stop();
    }

    // Accessor = elapsed time
    proc this(id: string) {
      return timers[id].elapsed();
    }
  } // StopWatch

}
