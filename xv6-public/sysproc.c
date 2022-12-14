#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "pstat.h"
int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}


int sys_settickets(void){
  //struct proc* curproc = myproc();
  int ticket;
  if(argint(0, &ticket) < 0) // grab 1st arg
    return -1;
  
  return settickets(ticket);

  /*sets the number of tickets of the calling process. By default, each process should get one ticket; calling this routine makes it such that a process can raise the number of tickets it receives, and thus receive a higher proportion of CPU cycles. This routine should return 0 if successful, and -1 otherwise (if, for example, the caller passes in a number less than one)*/
}

int sys_getpinfo(void){
  struct pstat* currentState;
  if(argptr(0, (char**)&currentState,sizeof(*currentState)) < 0)
    return -1;
  if (currentState == 0)
    return -1;
  return getpinfo(currentState);
  /*returns some information about all running processes, including how many times each has been chosen to run and the process ID of each. You can use this system call to build a variant of the command line program ps, which can then be called to see what is going on. The structure pstat is defined below; note, you cannot change this structure, and must use it exactly as is. This routine should return 0 if successful, and -1 otherwise*/

}
  

int sys_mprotect(void){
  void* addr; // pointer to the address
  if(argptr(0, (void*)&addr,sizeof(*addr)) < 0) // if invalid pointer return -1;
    return -1;
  int len;
  if(argint(1, &len) < 0) // if invalid arg
    return -1;
  return mprotect(addr,len);
}
int sys_munprotect(void){
  void* addr; // pointer to the address
  if(argptr(0, (void*)&addr,sizeof(*addr)) < 0) // if invalid pointer return -1;
    return -1;
  int len;
  if(argint(1, &len) < 0) // if invalid arg
    return -1;
  return munprotect(addr,len);
}