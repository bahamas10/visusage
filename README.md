Visual Usage
============
A set of tools to get a visual representation of system utilization
on an Illumos based operating system.

These tools are not meant to replace system tools like mpstat(1M), prstat(1M),
etc.  Instead, these tools should make it easier to identify problems from a
thousand foot view, such as running these tools and looking for large spikes
of red output.

viszones
========
View CPU and memory utilization from prstat(1M) per zone

    ~$ viszones -c 30 -b '#' -z 0 1 5

Report CPU and memory usage on zone 0 for 5 times at 1 second intervals,
reserving 30 characters for the bar graph using # as the graph character.

Options
-------
    -b <char>    : Character to use for the bar graph
    -c <columns> : Number of columns to use for the bar graph
    -n           : Disable color output
    -h           : Print this help message
    -z <zoneid>  : Zone ID to report on

Example
-------
    dave @ [ datadyne :: (SunOS) ] ~ $ ./viszones
    Zone: 0 (global)
    Mem:  [||||||||||||||||||                                               ] 30%
    CPU:  [                                                                 ] 0.9%
    Total: 67 processes, 548 lwps, load averages: 0.05, 0.06, 0.06

viscores
========
View CPU utilization per core from mpstat(1M)

    ~$ viscores 1

Report CPU utilization per core, updating every second.

Options
-------
    -b <char>    : Character to use for the bar graph
    -c <columns> : Number of columns to use for the bar graph
    -n           : Disable color output
    -h           : Print this help message

Example
-------
    dave @ [ datadyne :: (SunOS) ] ~/dev/visusage $ ./viscores
    CPU  0: [|||                                                                             ]   4%
    CPU  1: [||||                                                                            ]   6%
    CPU  2: [|||                                                                             ]   4%
    CPU  3: [||                                                                              ]   3%

To Do
=====
Switch to an ncurses view, or something similar to avoid the hacky
clearing of the terminal window to update the view.

Copying
=======
Released under the BSD 3-clause license, see LICENSE for details.
