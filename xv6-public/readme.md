P2B: Scheduling and VM in XV6
settickets(int priority)
 if its one then set to one
 if its zero then set it to zero
 otherwise return -1

struct pstat {
    int inuse[NPROC];
    int priority[NPROC];
    int pid[NPROC];
    int ticks[NPROC];
}
