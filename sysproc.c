#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

#define DEFAULT_LINES 10
#define BUFSIZE 512

int
sys_head(void) {
    char *path;
    int lines_to_read = DEFAULT_LINES;
    char buf[BUFSIZE]; // using BUFSIZE for better performance instead of reading byte by byte
    int line_count = 0;
    struct inode *ip;
    int pos = 0; // position in the file
    int read_count, i;

    if (argstr(0, &path) < 0) {
        return -1;
    }

    cprintf("Head command is getting executed in kernel mode.\n");

    begin_op();
    ip = namei(path);

    if (!ip) {
        end_op();
        return -1;  // Failed to find inode
    }

    ilock(ip);

    // Loop until we've read the desired number of lines or reached the end of the file
    while (line_count < lines_to_read) {
        read_count = readi(ip, buf, pos, sizeof(buf));

        // If we reach the end of the file, break
        if (read_count <= 0) {
            break;
        }

        for (i = 0; i < read_count; i++) {
            cprintf("%c", buf[i]);

            if (buf[i] == '\n') {
                line_count++;
                if (line_count == lines_to_read) {
                    break; // Stop if we've printed enough lines
                }
            }
        }

        pos += read_count;
    }

    iunlockput(ip);
    end_op();

    return 0;
}



int is_whitespace(char c) {
    return c == ' ' || c == '\t' || c == '\n' || c == '\r';
}

void remove_trailing_newline(char *str) {
    int len = strlen(str);
    while (len > 0 && (str[len - 1] == '\n' || str[len - 1] == '\r')) {
        str[len - 1] = '\0';
        len--;
    }
}

int strcmp_custom(const char *s1, const char *s2) {
    while (*s1 != '\0' && *s2 != '\0' && *s1 == *s2) {
        s1++;
        s2++;
    }
    return *s1 - *s2;
}

void strncpy_custom(char *dest, const char *src, int n) {
    int i;
    for (i = 0; i < n && src[i] != '\0'; i++) {
        dest[i] = src[i];
    }
    dest[i] = '\0';
}


int
sys_uniq(void) {
    char *path;
    if (argstr(0, &path) < 0) {
        return -1;
    }

    cprintf("Uniq command is getting executed in kernel mode.\n");

    return 0;
}

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


