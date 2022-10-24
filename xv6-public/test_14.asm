
_test_14:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:


#define PGSIZE 4096


int main(void) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
    const uint PAGES_NUM = 1;
    
    char *ptr = sbrk(PAGES_NUM * PGSIZE);
   f:	83 ec 0c             	sub    $0xc,%esp
  12:	68 00 10 00 00       	push   $0x1000
  17:	e8 64 02 00 00       	call   280 <sbrk>
  1c:	89 c3                	mov    %eax,%ebx
    printf(1, "XV6_TEST_OUTPUT %d\n", mprotect(ptr, -10));
  1e:	83 c4 08             	add    $0x8,%esp
  21:	6a f6                	push   $0xfffffff6
  23:	50                   	push   %eax
  24:	e8 7f 02 00 00       	call   2a8 <mprotect>
  29:	83 c4 0c             	add    $0xc,%esp
  2c:	50                   	push   %eax
  2d:	68 0c 06 00 00       	push   $0x60c
  32:	6a 01                	push   $0x1
  34:	e8 24 03 00 00       	call   35d <printf>
    printf(1, "XV6_TEST_OUTPUT %d\n", mprotect(ptr, PAGES_NUM + 10));
  39:	83 c4 08             	add    $0x8,%esp
  3c:	6a 0b                	push   $0xb
  3e:	53                   	push   %ebx
  3f:	e8 64 02 00 00       	call   2a8 <mprotect>
  44:	83 c4 0c             	add    $0xc,%esp
  47:	50                   	push   %eax
  48:	68 0c 06 00 00       	push   $0x60c
  4d:	6a 01                	push   $0x1
  4f:	e8 09 03 00 00       	call   35d <printf>
    
    exit();
  54:	e8 9f 01 00 00       	call   1f8 <exit>

00000059 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  59:	55                   	push   %ebp
  5a:	89 e5                	mov    %esp,%ebp
  5c:	56                   	push   %esi
  5d:	53                   	push   %ebx
  5e:	8b 75 08             	mov    0x8(%ebp),%esi
  61:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  64:	89 f0                	mov    %esi,%eax
  66:	89 d1                	mov    %edx,%ecx
  68:	83 c2 01             	add    $0x1,%edx
  6b:	89 c3                	mov    %eax,%ebx
  6d:	83 c0 01             	add    $0x1,%eax
  70:	0f b6 09             	movzbl (%ecx),%ecx
  73:	88 0b                	mov    %cl,(%ebx)
  75:	84 c9                	test   %cl,%cl
  77:	75 ed                	jne    66 <strcpy+0xd>
    ;
  return os;
}
  79:	89 f0                	mov    %esi,%eax
  7b:	5b                   	pop    %ebx
  7c:	5e                   	pop    %esi
  7d:	5d                   	pop    %ebp
  7e:	c3                   	ret    

0000007f <strcmp>:

int
strcmp(const char *p, const char *q)
{
  7f:	55                   	push   %ebp
  80:	89 e5                	mov    %esp,%ebp
  82:	8b 4d 08             	mov    0x8(%ebp),%ecx
  85:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  88:	eb 06                	jmp    90 <strcmp+0x11>
    p++, q++;
  8a:	83 c1 01             	add    $0x1,%ecx
  8d:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  90:	0f b6 01             	movzbl (%ecx),%eax
  93:	84 c0                	test   %al,%al
  95:	74 04                	je     9b <strcmp+0x1c>
  97:	3a 02                	cmp    (%edx),%al
  99:	74 ef                	je     8a <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  9b:	0f b6 c0             	movzbl %al,%eax
  9e:	0f b6 12             	movzbl (%edx),%edx
  a1:	29 d0                	sub    %edx,%eax
}
  a3:	5d                   	pop    %ebp
  a4:	c3                   	ret    

000000a5 <strlen>:

uint
strlen(const char *s)
{
  a5:	55                   	push   %ebp
  a6:	89 e5                	mov    %esp,%ebp
  a8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  ab:	b8 00 00 00 00       	mov    $0x0,%eax
  b0:	eb 03                	jmp    b5 <strlen+0x10>
  b2:	83 c0 01             	add    $0x1,%eax
  b5:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  b9:	75 f7                	jne    b2 <strlen+0xd>
    ;
  return n;
}
  bb:	5d                   	pop    %ebp
  bc:	c3                   	ret    

000000bd <memset>:

void*
memset(void *dst, int c, uint n)
{
  bd:	55                   	push   %ebp
  be:	89 e5                	mov    %esp,%ebp
  c0:	57                   	push   %edi
  c1:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  c4:	89 d7                	mov    %edx,%edi
  c6:	8b 4d 10             	mov    0x10(%ebp),%ecx
  c9:	8b 45 0c             	mov    0xc(%ebp),%eax
  cc:	fc                   	cld    
  cd:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  cf:	89 d0                	mov    %edx,%eax
  d1:	8b 7d fc             	mov    -0x4(%ebp),%edi
  d4:	c9                   	leave  
  d5:	c3                   	ret    

000000d6 <strchr>:

char*
strchr(const char *s, char c)
{
  d6:	55                   	push   %ebp
  d7:	89 e5                	mov    %esp,%ebp
  d9:	8b 45 08             	mov    0x8(%ebp),%eax
  dc:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  e0:	eb 03                	jmp    e5 <strchr+0xf>
  e2:	83 c0 01             	add    $0x1,%eax
  e5:	0f b6 10             	movzbl (%eax),%edx
  e8:	84 d2                	test   %dl,%dl
  ea:	74 06                	je     f2 <strchr+0x1c>
    if(*s == c)
  ec:	38 ca                	cmp    %cl,%dl
  ee:	75 f2                	jne    e2 <strchr+0xc>
  f0:	eb 05                	jmp    f7 <strchr+0x21>
      return (char*)s;
  return 0;
  f2:	b8 00 00 00 00       	mov    $0x0,%eax
}
  f7:	5d                   	pop    %ebp
  f8:	c3                   	ret    

000000f9 <gets>:

char*
gets(char *buf, int max)
{
  f9:	55                   	push   %ebp
  fa:	89 e5                	mov    %esp,%ebp
  fc:	57                   	push   %edi
  fd:	56                   	push   %esi
  fe:	53                   	push   %ebx
  ff:	83 ec 1c             	sub    $0x1c,%esp
 102:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 105:	bb 00 00 00 00       	mov    $0x0,%ebx
 10a:	89 de                	mov    %ebx,%esi
 10c:	83 c3 01             	add    $0x1,%ebx
 10f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 112:	7d 2e                	jge    142 <gets+0x49>
    cc = read(0, &c, 1);
 114:	83 ec 04             	sub    $0x4,%esp
 117:	6a 01                	push   $0x1
 119:	8d 45 e7             	lea    -0x19(%ebp),%eax
 11c:	50                   	push   %eax
 11d:	6a 00                	push   $0x0
 11f:	e8 ec 00 00 00       	call   210 <read>
    if(cc < 1)
 124:	83 c4 10             	add    $0x10,%esp
 127:	85 c0                	test   %eax,%eax
 129:	7e 17                	jle    142 <gets+0x49>
      break;
    buf[i++] = c;
 12b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 12f:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 132:	3c 0a                	cmp    $0xa,%al
 134:	0f 94 c2             	sete   %dl
 137:	3c 0d                	cmp    $0xd,%al
 139:	0f 94 c0             	sete   %al
 13c:	08 c2                	or     %al,%dl
 13e:	74 ca                	je     10a <gets+0x11>
    buf[i++] = c;
 140:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 142:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 146:	89 f8                	mov    %edi,%eax
 148:	8d 65 f4             	lea    -0xc(%ebp),%esp
 14b:	5b                   	pop    %ebx
 14c:	5e                   	pop    %esi
 14d:	5f                   	pop    %edi
 14e:	5d                   	pop    %ebp
 14f:	c3                   	ret    

00000150 <stat>:

int
stat(const char *n, struct stat *st)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	56                   	push   %esi
 154:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 155:	83 ec 08             	sub    $0x8,%esp
 158:	6a 00                	push   $0x0
 15a:	ff 75 08             	push   0x8(%ebp)
 15d:	e8 d6 00 00 00       	call   238 <open>
  if(fd < 0)
 162:	83 c4 10             	add    $0x10,%esp
 165:	85 c0                	test   %eax,%eax
 167:	78 24                	js     18d <stat+0x3d>
 169:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 16b:	83 ec 08             	sub    $0x8,%esp
 16e:	ff 75 0c             	push   0xc(%ebp)
 171:	50                   	push   %eax
 172:	e8 d9 00 00 00       	call   250 <fstat>
 177:	89 c6                	mov    %eax,%esi
  close(fd);
 179:	89 1c 24             	mov    %ebx,(%esp)
 17c:	e8 9f 00 00 00       	call   220 <close>
  return r;
 181:	83 c4 10             	add    $0x10,%esp
}
 184:	89 f0                	mov    %esi,%eax
 186:	8d 65 f8             	lea    -0x8(%ebp),%esp
 189:	5b                   	pop    %ebx
 18a:	5e                   	pop    %esi
 18b:	5d                   	pop    %ebp
 18c:	c3                   	ret    
    return -1;
 18d:	be ff ff ff ff       	mov    $0xffffffff,%esi
 192:	eb f0                	jmp    184 <stat+0x34>

00000194 <atoi>:

int
atoi(const char *s)
{
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	53                   	push   %ebx
 198:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 19b:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1a0:	eb 10                	jmp    1b2 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 1a2:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1a5:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1a8:	83 c1 01             	add    $0x1,%ecx
 1ab:	0f be c0             	movsbl %al,%eax
 1ae:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 1b2:	0f b6 01             	movzbl (%ecx),%eax
 1b5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1b8:	80 fb 09             	cmp    $0x9,%bl
 1bb:	76 e5                	jbe    1a2 <atoi+0xe>
  return n;
}
 1bd:	89 d0                	mov    %edx,%eax
 1bf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1c2:	c9                   	leave  
 1c3:	c3                   	ret    

000001c4 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	56                   	push   %esi
 1c8:	53                   	push   %ebx
 1c9:	8b 75 08             	mov    0x8(%ebp),%esi
 1cc:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1cf:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1d2:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1d4:	eb 0d                	jmp    1e3 <memmove+0x1f>
    *dst++ = *src++;
 1d6:	0f b6 01             	movzbl (%ecx),%eax
 1d9:	88 02                	mov    %al,(%edx)
 1db:	8d 49 01             	lea    0x1(%ecx),%ecx
 1de:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 1e1:	89 d8                	mov    %ebx,%eax
 1e3:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1e6:	85 c0                	test   %eax,%eax
 1e8:	7f ec                	jg     1d6 <memmove+0x12>
  return vdst;
}
 1ea:	89 f0                	mov    %esi,%eax
 1ec:	5b                   	pop    %ebx
 1ed:	5e                   	pop    %esi
 1ee:	5d                   	pop    %ebp
 1ef:	c3                   	ret    

000001f0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 1f0:	b8 01 00 00 00       	mov    $0x1,%eax
 1f5:	cd 40                	int    $0x40
 1f7:	c3                   	ret    

000001f8 <exit>:
SYSCALL(exit)
 1f8:	b8 02 00 00 00       	mov    $0x2,%eax
 1fd:	cd 40                	int    $0x40
 1ff:	c3                   	ret    

00000200 <wait>:
SYSCALL(wait)
 200:	b8 03 00 00 00       	mov    $0x3,%eax
 205:	cd 40                	int    $0x40
 207:	c3                   	ret    

00000208 <pipe>:
SYSCALL(pipe)
 208:	b8 04 00 00 00       	mov    $0x4,%eax
 20d:	cd 40                	int    $0x40
 20f:	c3                   	ret    

00000210 <read>:
SYSCALL(read)
 210:	b8 05 00 00 00       	mov    $0x5,%eax
 215:	cd 40                	int    $0x40
 217:	c3                   	ret    

00000218 <write>:
SYSCALL(write)
 218:	b8 10 00 00 00       	mov    $0x10,%eax
 21d:	cd 40                	int    $0x40
 21f:	c3                   	ret    

00000220 <close>:
SYSCALL(close)
 220:	b8 15 00 00 00       	mov    $0x15,%eax
 225:	cd 40                	int    $0x40
 227:	c3                   	ret    

00000228 <kill>:
SYSCALL(kill)
 228:	b8 06 00 00 00       	mov    $0x6,%eax
 22d:	cd 40                	int    $0x40
 22f:	c3                   	ret    

00000230 <exec>:
SYSCALL(exec)
 230:	b8 07 00 00 00       	mov    $0x7,%eax
 235:	cd 40                	int    $0x40
 237:	c3                   	ret    

00000238 <open>:
SYSCALL(open)
 238:	b8 0f 00 00 00       	mov    $0xf,%eax
 23d:	cd 40                	int    $0x40
 23f:	c3                   	ret    

00000240 <mknod>:
SYSCALL(mknod)
 240:	b8 11 00 00 00       	mov    $0x11,%eax
 245:	cd 40                	int    $0x40
 247:	c3                   	ret    

00000248 <unlink>:
SYSCALL(unlink)
 248:	b8 12 00 00 00       	mov    $0x12,%eax
 24d:	cd 40                	int    $0x40
 24f:	c3                   	ret    

00000250 <fstat>:
SYSCALL(fstat)
 250:	b8 08 00 00 00       	mov    $0x8,%eax
 255:	cd 40                	int    $0x40
 257:	c3                   	ret    

00000258 <link>:
SYSCALL(link)
 258:	b8 13 00 00 00       	mov    $0x13,%eax
 25d:	cd 40                	int    $0x40
 25f:	c3                   	ret    

00000260 <mkdir>:
SYSCALL(mkdir)
 260:	b8 14 00 00 00       	mov    $0x14,%eax
 265:	cd 40                	int    $0x40
 267:	c3                   	ret    

00000268 <chdir>:
SYSCALL(chdir)
 268:	b8 09 00 00 00       	mov    $0x9,%eax
 26d:	cd 40                	int    $0x40
 26f:	c3                   	ret    

00000270 <dup>:
SYSCALL(dup)
 270:	b8 0a 00 00 00       	mov    $0xa,%eax
 275:	cd 40                	int    $0x40
 277:	c3                   	ret    

00000278 <getpid>:
SYSCALL(getpid)
 278:	b8 0b 00 00 00       	mov    $0xb,%eax
 27d:	cd 40                	int    $0x40
 27f:	c3                   	ret    

00000280 <sbrk>:
SYSCALL(sbrk)
 280:	b8 0c 00 00 00       	mov    $0xc,%eax
 285:	cd 40                	int    $0x40
 287:	c3                   	ret    

00000288 <sleep>:
SYSCALL(sleep)
 288:	b8 0d 00 00 00       	mov    $0xd,%eax
 28d:	cd 40                	int    $0x40
 28f:	c3                   	ret    

00000290 <uptime>:
SYSCALL(uptime)
 290:	b8 0e 00 00 00       	mov    $0xe,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret    

00000298 <settickets>:
SYSCALL(settickets)
 298:	b8 16 00 00 00       	mov    $0x16,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret    

000002a0 <getpinfo>:
SYSCALL(getpinfo)
 2a0:	b8 17 00 00 00       	mov    $0x17,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <mprotect>:
SYSCALL(mprotect)
 2a8:	b8 18 00 00 00       	mov    $0x18,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <munprotect>:
 2b0:	b8 19 00 00 00       	mov    $0x19,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 2b8:	55                   	push   %ebp
 2b9:	89 e5                	mov    %esp,%ebp
 2bb:	83 ec 1c             	sub    $0x1c,%esp
 2be:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 2c1:	6a 01                	push   $0x1
 2c3:	8d 55 f4             	lea    -0xc(%ebp),%edx
 2c6:	52                   	push   %edx
 2c7:	50                   	push   %eax
 2c8:	e8 4b ff ff ff       	call   218 <write>
}
 2cd:	83 c4 10             	add    $0x10,%esp
 2d0:	c9                   	leave  
 2d1:	c3                   	ret    

000002d2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 2d2:	55                   	push   %ebp
 2d3:	89 e5                	mov    %esp,%ebp
 2d5:	57                   	push   %edi
 2d6:	56                   	push   %esi
 2d7:	53                   	push   %ebx
 2d8:	83 ec 2c             	sub    $0x2c,%esp
 2db:	89 45 d0             	mov    %eax,-0x30(%ebp)
 2de:	89 d0                	mov    %edx,%eax
 2e0:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 2e2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 2e6:	0f 95 c1             	setne  %cl
 2e9:	c1 ea 1f             	shr    $0x1f,%edx
 2ec:	84 d1                	test   %dl,%cl
 2ee:	74 44                	je     334 <printint+0x62>
    neg = 1;
    x = -xx;
 2f0:	f7 d8                	neg    %eax
 2f2:	89 c1                	mov    %eax,%ecx
    neg = 1;
 2f4:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 2fb:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 300:	89 c8                	mov    %ecx,%eax
 302:	ba 00 00 00 00       	mov    $0x0,%edx
 307:	f7 f6                	div    %esi
 309:	89 df                	mov    %ebx,%edi
 30b:	83 c3 01             	add    $0x1,%ebx
 30e:	0f b6 92 80 06 00 00 	movzbl 0x680(%edx),%edx
 315:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 319:	89 ca                	mov    %ecx,%edx
 31b:	89 c1                	mov    %eax,%ecx
 31d:	39 d6                	cmp    %edx,%esi
 31f:	76 df                	jbe    300 <printint+0x2e>
  if(neg)
 321:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 325:	74 31                	je     358 <printint+0x86>
    buf[i++] = '-';
 327:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 32c:	8d 5f 02             	lea    0x2(%edi),%ebx
 32f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 332:	eb 17                	jmp    34b <printint+0x79>
    x = xx;
 334:	89 c1                	mov    %eax,%ecx
  neg = 0;
 336:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 33d:	eb bc                	jmp    2fb <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 33f:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 344:	89 f0                	mov    %esi,%eax
 346:	e8 6d ff ff ff       	call   2b8 <putc>
  while(--i >= 0)
 34b:	83 eb 01             	sub    $0x1,%ebx
 34e:	79 ef                	jns    33f <printint+0x6d>
}
 350:	83 c4 2c             	add    $0x2c,%esp
 353:	5b                   	pop    %ebx
 354:	5e                   	pop    %esi
 355:	5f                   	pop    %edi
 356:	5d                   	pop    %ebp
 357:	c3                   	ret    
 358:	8b 75 d0             	mov    -0x30(%ebp),%esi
 35b:	eb ee                	jmp    34b <printint+0x79>

0000035d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 35d:	55                   	push   %ebp
 35e:	89 e5                	mov    %esp,%ebp
 360:	57                   	push   %edi
 361:	56                   	push   %esi
 362:	53                   	push   %ebx
 363:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 366:	8d 45 10             	lea    0x10(%ebp),%eax
 369:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 36c:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 371:	bb 00 00 00 00       	mov    $0x0,%ebx
 376:	eb 14                	jmp    38c <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 378:	89 fa                	mov    %edi,%edx
 37a:	8b 45 08             	mov    0x8(%ebp),%eax
 37d:	e8 36 ff ff ff       	call   2b8 <putc>
 382:	eb 05                	jmp    389 <printf+0x2c>
      }
    } else if(state == '%'){
 384:	83 fe 25             	cmp    $0x25,%esi
 387:	74 25                	je     3ae <printf+0x51>
  for(i = 0; fmt[i]; i++){
 389:	83 c3 01             	add    $0x1,%ebx
 38c:	8b 45 0c             	mov    0xc(%ebp),%eax
 38f:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 393:	84 c0                	test   %al,%al
 395:	0f 84 20 01 00 00    	je     4bb <printf+0x15e>
    c = fmt[i] & 0xff;
 39b:	0f be f8             	movsbl %al,%edi
 39e:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 3a1:	85 f6                	test   %esi,%esi
 3a3:	75 df                	jne    384 <printf+0x27>
      if(c == '%'){
 3a5:	83 f8 25             	cmp    $0x25,%eax
 3a8:	75 ce                	jne    378 <printf+0x1b>
        state = '%';
 3aa:	89 c6                	mov    %eax,%esi
 3ac:	eb db                	jmp    389 <printf+0x2c>
      if(c == 'd'){
 3ae:	83 f8 25             	cmp    $0x25,%eax
 3b1:	0f 84 cf 00 00 00    	je     486 <printf+0x129>
 3b7:	0f 8c dd 00 00 00    	jl     49a <printf+0x13d>
 3bd:	83 f8 78             	cmp    $0x78,%eax
 3c0:	0f 8f d4 00 00 00    	jg     49a <printf+0x13d>
 3c6:	83 f8 63             	cmp    $0x63,%eax
 3c9:	0f 8c cb 00 00 00    	jl     49a <printf+0x13d>
 3cf:	83 e8 63             	sub    $0x63,%eax
 3d2:	83 f8 15             	cmp    $0x15,%eax
 3d5:	0f 87 bf 00 00 00    	ja     49a <printf+0x13d>
 3db:	ff 24 85 28 06 00 00 	jmp    *0x628(,%eax,4)
        printint(fd, *ap, 10, 1);
 3e2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 3e5:	8b 17                	mov    (%edi),%edx
 3e7:	83 ec 0c             	sub    $0xc,%esp
 3ea:	6a 01                	push   $0x1
 3ec:	b9 0a 00 00 00       	mov    $0xa,%ecx
 3f1:	8b 45 08             	mov    0x8(%ebp),%eax
 3f4:	e8 d9 fe ff ff       	call   2d2 <printint>
        ap++;
 3f9:	83 c7 04             	add    $0x4,%edi
 3fc:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 3ff:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 402:	be 00 00 00 00       	mov    $0x0,%esi
 407:	eb 80                	jmp    389 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 409:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 40c:	8b 17                	mov    (%edi),%edx
 40e:	83 ec 0c             	sub    $0xc,%esp
 411:	6a 00                	push   $0x0
 413:	b9 10 00 00 00       	mov    $0x10,%ecx
 418:	8b 45 08             	mov    0x8(%ebp),%eax
 41b:	e8 b2 fe ff ff       	call   2d2 <printint>
        ap++;
 420:	83 c7 04             	add    $0x4,%edi
 423:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 426:	83 c4 10             	add    $0x10,%esp
      state = 0;
 429:	be 00 00 00 00       	mov    $0x0,%esi
 42e:	e9 56 ff ff ff       	jmp    389 <printf+0x2c>
        s = (char*)*ap;
 433:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 436:	8b 30                	mov    (%eax),%esi
        ap++;
 438:	83 c0 04             	add    $0x4,%eax
 43b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 43e:	85 f6                	test   %esi,%esi
 440:	75 15                	jne    457 <printf+0xfa>
          s = "(null)";
 442:	be 20 06 00 00       	mov    $0x620,%esi
 447:	eb 0e                	jmp    457 <printf+0xfa>
          putc(fd, *s);
 449:	0f be d2             	movsbl %dl,%edx
 44c:	8b 45 08             	mov    0x8(%ebp),%eax
 44f:	e8 64 fe ff ff       	call   2b8 <putc>
          s++;
 454:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 457:	0f b6 16             	movzbl (%esi),%edx
 45a:	84 d2                	test   %dl,%dl
 45c:	75 eb                	jne    449 <printf+0xec>
      state = 0;
 45e:	be 00 00 00 00       	mov    $0x0,%esi
 463:	e9 21 ff ff ff       	jmp    389 <printf+0x2c>
        putc(fd, *ap);
 468:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 46b:	0f be 17             	movsbl (%edi),%edx
 46e:	8b 45 08             	mov    0x8(%ebp),%eax
 471:	e8 42 fe ff ff       	call   2b8 <putc>
        ap++;
 476:	83 c7 04             	add    $0x4,%edi
 479:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 47c:	be 00 00 00 00       	mov    $0x0,%esi
 481:	e9 03 ff ff ff       	jmp    389 <printf+0x2c>
        putc(fd, c);
 486:	89 fa                	mov    %edi,%edx
 488:	8b 45 08             	mov    0x8(%ebp),%eax
 48b:	e8 28 fe ff ff       	call   2b8 <putc>
      state = 0;
 490:	be 00 00 00 00       	mov    $0x0,%esi
 495:	e9 ef fe ff ff       	jmp    389 <printf+0x2c>
        putc(fd, '%');
 49a:	ba 25 00 00 00       	mov    $0x25,%edx
 49f:	8b 45 08             	mov    0x8(%ebp),%eax
 4a2:	e8 11 fe ff ff       	call   2b8 <putc>
        putc(fd, c);
 4a7:	89 fa                	mov    %edi,%edx
 4a9:	8b 45 08             	mov    0x8(%ebp),%eax
 4ac:	e8 07 fe ff ff       	call   2b8 <putc>
      state = 0;
 4b1:	be 00 00 00 00       	mov    $0x0,%esi
 4b6:	e9 ce fe ff ff       	jmp    389 <printf+0x2c>
    }
  }
}
 4bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4be:	5b                   	pop    %ebx
 4bf:	5e                   	pop    %esi
 4c0:	5f                   	pop    %edi
 4c1:	5d                   	pop    %ebp
 4c2:	c3                   	ret    

000004c3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 4c3:	55                   	push   %ebp
 4c4:	89 e5                	mov    %esp,%ebp
 4c6:	57                   	push   %edi
 4c7:	56                   	push   %esi
 4c8:	53                   	push   %ebx
 4c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 4cc:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 4cf:	a1 24 09 00 00       	mov    0x924,%eax
 4d4:	eb 02                	jmp    4d8 <free+0x15>
 4d6:	89 d0                	mov    %edx,%eax
 4d8:	39 c8                	cmp    %ecx,%eax
 4da:	73 04                	jae    4e0 <free+0x1d>
 4dc:	39 08                	cmp    %ecx,(%eax)
 4de:	77 12                	ja     4f2 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 4e0:	8b 10                	mov    (%eax),%edx
 4e2:	39 c2                	cmp    %eax,%edx
 4e4:	77 f0                	ja     4d6 <free+0x13>
 4e6:	39 c8                	cmp    %ecx,%eax
 4e8:	72 08                	jb     4f2 <free+0x2f>
 4ea:	39 ca                	cmp    %ecx,%edx
 4ec:	77 04                	ja     4f2 <free+0x2f>
 4ee:	89 d0                	mov    %edx,%eax
 4f0:	eb e6                	jmp    4d8 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 4f2:	8b 73 fc             	mov    -0x4(%ebx),%esi
 4f5:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 4f8:	8b 10                	mov    (%eax),%edx
 4fa:	39 d7                	cmp    %edx,%edi
 4fc:	74 19                	je     517 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 4fe:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 501:	8b 50 04             	mov    0x4(%eax),%edx
 504:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 507:	39 ce                	cmp    %ecx,%esi
 509:	74 1b                	je     526 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 50b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 50d:	a3 24 09 00 00       	mov    %eax,0x924
}
 512:	5b                   	pop    %ebx
 513:	5e                   	pop    %esi
 514:	5f                   	pop    %edi
 515:	5d                   	pop    %ebp
 516:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 517:	03 72 04             	add    0x4(%edx),%esi
 51a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 51d:	8b 10                	mov    (%eax),%edx
 51f:	8b 12                	mov    (%edx),%edx
 521:	89 53 f8             	mov    %edx,-0x8(%ebx)
 524:	eb db                	jmp    501 <free+0x3e>
    p->s.size += bp->s.size;
 526:	03 53 fc             	add    -0x4(%ebx),%edx
 529:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 52c:	8b 53 f8             	mov    -0x8(%ebx),%edx
 52f:	89 10                	mov    %edx,(%eax)
 531:	eb da                	jmp    50d <free+0x4a>

00000533 <morecore>:

static Header*
morecore(uint nu)
{
 533:	55                   	push   %ebp
 534:	89 e5                	mov    %esp,%ebp
 536:	53                   	push   %ebx
 537:	83 ec 04             	sub    $0x4,%esp
 53a:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 53c:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 541:	77 05                	ja     548 <morecore+0x15>
    nu = 4096;
 543:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 548:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 54f:	83 ec 0c             	sub    $0xc,%esp
 552:	50                   	push   %eax
 553:	e8 28 fd ff ff       	call   280 <sbrk>
  if(p == (char*)-1)
 558:	83 c4 10             	add    $0x10,%esp
 55b:	83 f8 ff             	cmp    $0xffffffff,%eax
 55e:	74 1c                	je     57c <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 560:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 563:	83 c0 08             	add    $0x8,%eax
 566:	83 ec 0c             	sub    $0xc,%esp
 569:	50                   	push   %eax
 56a:	e8 54 ff ff ff       	call   4c3 <free>
  return freep;
 56f:	a1 24 09 00 00       	mov    0x924,%eax
 574:	83 c4 10             	add    $0x10,%esp
}
 577:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 57a:	c9                   	leave  
 57b:	c3                   	ret    
    return 0;
 57c:	b8 00 00 00 00       	mov    $0x0,%eax
 581:	eb f4                	jmp    577 <morecore+0x44>

00000583 <malloc>:

void*
malloc(uint nbytes)
{
 583:	55                   	push   %ebp
 584:	89 e5                	mov    %esp,%ebp
 586:	53                   	push   %ebx
 587:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 58a:	8b 45 08             	mov    0x8(%ebp),%eax
 58d:	8d 58 07             	lea    0x7(%eax),%ebx
 590:	c1 eb 03             	shr    $0x3,%ebx
 593:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 596:	8b 0d 24 09 00 00    	mov    0x924,%ecx
 59c:	85 c9                	test   %ecx,%ecx
 59e:	74 04                	je     5a4 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5a0:	8b 01                	mov    (%ecx),%eax
 5a2:	eb 4a                	jmp    5ee <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 5a4:	c7 05 24 09 00 00 28 	movl   $0x928,0x924
 5ab:	09 00 00 
 5ae:	c7 05 28 09 00 00 28 	movl   $0x928,0x928
 5b5:	09 00 00 
    base.s.size = 0;
 5b8:	c7 05 2c 09 00 00 00 	movl   $0x0,0x92c
 5bf:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 5c2:	b9 28 09 00 00       	mov    $0x928,%ecx
 5c7:	eb d7                	jmp    5a0 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 5c9:	74 19                	je     5e4 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 5cb:	29 da                	sub    %ebx,%edx
 5cd:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 5d0:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 5d3:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 5d6:	89 0d 24 09 00 00    	mov    %ecx,0x924
      return (void*)(p + 1);
 5dc:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 5df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5e2:	c9                   	leave  
 5e3:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 5e4:	8b 10                	mov    (%eax),%edx
 5e6:	89 11                	mov    %edx,(%ecx)
 5e8:	eb ec                	jmp    5d6 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5ea:	89 c1                	mov    %eax,%ecx
 5ec:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 5ee:	8b 50 04             	mov    0x4(%eax),%edx
 5f1:	39 da                	cmp    %ebx,%edx
 5f3:	73 d4                	jae    5c9 <malloc+0x46>
    if(p == freep)
 5f5:	39 05 24 09 00 00    	cmp    %eax,0x924
 5fb:	75 ed                	jne    5ea <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 5fd:	89 d8                	mov    %ebx,%eax
 5ff:	e8 2f ff ff ff       	call   533 <morecore>
 604:	85 c0                	test   %eax,%eax
 606:	75 e2                	jne    5ea <malloc+0x67>
 608:	eb d5                	jmp    5df <malloc+0x5c>
