use Measurements;

// total time
start();

start('[setup]');

start('createD');
var D = {0..<100_000_000};
stop('createD');

start('createA');
var A: [D] real = 1.0;
stop('createA');

stop('[setup]');

start('A *= 2');
A *= 2;
stop('A *= 2');

start('B = A');
var B = A;
stop('B = A');


stop();

// Report timings
printTimings();

/* Example output:

           Total : 0.588673
         [setup] : 0.116947
         createD : 3e-06
         createA : 0.116938
          A *= 2 : 0.062219
           B = A : 0.409488

*/
