Visual Usage
============
Print a visual representation of resource utilization on an
Illumos based operating system using prstat

Example Usage:

    ~$ visusage -c 30 -b '#' -z 0 1 5

- Report on zone 0 for 5 times at 1 second intervals,
reserving 30 characters for the bar graph using # as
the graph character

Options
=======
    -b <char>    : Character to use for the bar graph
    -c <columns> : Number of columns to use for the bar graph
    -n           : Disable color output
    -h           : Print this help message
    -z <zoneid>  : Zone ID to report on

Example
=======
    dave @ [ datadyne :: (SunOS) ] ~ $ ./visusage
    Zone: 0 (global)
    Mem:  [||||||||||||||||||                                               ] 30%
    CPU:  [                                                                 ] 0.9%
    Total: 67 processes, 548 lwps, load averages: 0.05, 0.06, 0.06

Copying
=======
Released under the BSD 3-clause license, see LICENSE for details.
