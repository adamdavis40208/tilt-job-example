## Recreating a bug with a smaller example of what we're seeing in tilt

This example spins up two jobs: 

* A local yaml job that sleeps for 10 seconds and exits
* A job installed via a helm chart that sleeps for 80 seconds and then exits

`tilt ci` respects and waits for the local yaml job (10 second) but exits before the 80 second job is done.


```
        cukes │ Serving files on port 8000
        cukes │ Sleeping for 80 seconds
 example-html │ Done sleeping
 example-html │      ┊ Scheduled       - <1s
 example-html │      ┊ Initialized     - <1s
 example-html │      ┊ Completed       - 12s
SUCCESS. All workloads are healthy.
```

I would expect the cukes job to also print "done sleeping", but tilt ci exits before it is finished.