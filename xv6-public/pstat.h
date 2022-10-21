#ifndef _PSTAT_H
#define _PSTAT_H

#include "param.h"

struct pstat {
  int inuse[NPROC]; // whether this slot of process table is inuse (1 or 0)
  int tickets[NPROC]; // the number of tickets this process has (store 0 or 1 ie priority)
  int pid[NPROC]; // the PID f each process
  int ticks[NPROC]; // the number of ticks each process has accumulated
};

#endif // _PSTAT_H