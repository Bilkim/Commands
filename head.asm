
_head:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
            }
        }
    }
}

int main(int argc, char *argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 20             	sub    $0x20,%esp
  14:	8b 39                	mov    (%ecx),%edi
  16:	8b 71 04             	mov    0x4(%ecx),%esi
    int lines_to_read = DEFAULT_LINES;

    printf(1, "Head command is getting executed in user mode.\n");
  19:	68 98 09 00 00       	push   $0x998
  1e:	6a 01                	push   $0x1
  20:	e8 4b 06 00 00       	call   670 <printf>

    if (argc > 1) {
  25:	83 c4 10             	add    $0x10,%esp
  28:	83 ff 01             	cmp    $0x1,%edi
  2b:	0f 8e cc 00 00 00    	jle    fd <main+0xfd>
        if (argv[1][0] == '-') {
  31:	8b 46 04             	mov    0x4(%esi),%eax
  34:	80 38 2d             	cmpb   $0x2d,(%eax)
  37:	0f 84 ec 00 00 00    	je     129 <main+0x129>
        } else {
            for (int j = 1; j < argc && j < 3; j++) {
                if (j > 1) {
                    printf(1, "\n");
                }
                int fd = open(argv[j], O_RDONLY);
  3d:	83 ec 08             	sub    $0x8,%esp
  40:	8d 56 04             	lea    0x4(%esi),%edx
  43:	6a 00                	push   $0x0
  45:	50                   	push   %eax
  46:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  49:	e8 f5 04 00 00       	call   543 <open>
                if (fd < 0) {
  4e:	83 c4 10             	add    $0x10,%esp
                int fd = open(argv[j], O_RDONLY);
  51:	89 c3                	mov    %eax,%ebx
                if (fd < 0) {
  53:	85 c0                	test   %eax,%eax
  55:	78 56                	js     ad <main+0xad>
                    printf(2, "head: cannot open file %s\n", argv[j]);
                    exit();
                }
                printf(1, "==> %s <==\n", argv[j]);
  57:	83 ec 04             	sub    $0x4,%esp
  5a:	ff 76 04             	push   0x4(%esi)
  5d:	68 37 0a 00 00       	push   $0xa37
  62:	6a 01                	push   $0x1
  64:	e8 07 06 00 00       	call   670 <printf>
                print_head(fd, lines_to_read);
  69:	59                   	pop    %ecx
  6a:	58                   	pop    %eax
  6b:	6a 0e                	push   $0xe
  6d:	53                   	push   %ebx
  6e:	e8 8d 01 00 00       	call   200 <print_head>
                close(fd);
  73:	89 1c 24             	mov    %ebx,(%esp)
  76:	e8 b0 04 00 00       	call   52b <close>
            for (int j = 1; j < argc && j < 3; j++) {
  7b:	83 c4 10             	add    $0x10,%esp
  7e:	83 ff 02             	cmp    $0x2,%edi
  81:	7e 66                	jle    e9 <main+0xe9>
                    printf(1, "\n");
  83:	83 ec 08             	sub    $0x8,%esp
  86:	68 1a 0a 00 00       	push   $0xa1a
  8b:	6a 01                	push   $0x1
  8d:	e8 de 05 00 00       	call   670 <printf>
                int fd = open(argv[j], O_RDONLY);
  92:	8d 46 08             	lea    0x8(%esi),%eax
  95:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  98:	58                   	pop    %eax
  99:	5a                   	pop    %edx
  9a:	6a 00                	push   $0x0
  9c:	ff 76 08             	push   0x8(%esi)
  9f:	e8 9f 04 00 00       	call   543 <open>
                if (fd < 0) {
  a4:	83 c4 10             	add    $0x10,%esp
                int fd = open(argv[j], O_RDONLY);
  a7:	89 c3                	mov    %eax,%ebx
                if (fd < 0) {
  a9:	85 c0                	test   %eax,%eax
  ab:	79 17                	jns    c4 <main+0xc4>
                    printf(2, "head: cannot open file %s\n", argv[j]);
  ad:	50                   	push   %eax
  ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  b1:	ff 30                	push   (%eax)
  b3:	68 1c 0a 00 00       	push   $0xa1c
  b8:	6a 02                	push   $0x2
  ba:	e8 b1 05 00 00       	call   670 <printf>
                    exit();
  bf:	e8 3f 04 00 00       	call   503 <exit>
                printf(1, "==> %s <==\n", argv[j]);
  c4:	50                   	push   %eax
  c5:	ff 76 08             	push   0x8(%esi)
  c8:	68 37 0a 00 00       	push   $0xa37
  cd:	6a 01                	push   $0x1
  cf:	e8 9c 05 00 00       	call   670 <printf>
                print_head(fd, lines_to_read);
  d4:	5a                   	pop    %edx
  d5:	59                   	pop    %ecx
  d6:	6a 0e                	push   $0xe
  d8:	53                   	push   %ebx
  d9:	e8 22 01 00 00       	call   200 <print_head>
                close(fd);
  de:	89 1c 24             	mov    %ebx,(%esp)
  e1:	e8 45 04 00 00       	call   52b <close>
  e6:	83 c4 10             	add    $0x10,%esp
        print_head(0, lines_to_read); 
    }

    // Execute the kernel mode head
    if (argc > 1) {
        head(argv[1], O_RDONLY);  // Assuming the syscall is named "head" and takes a file path as an argument
  e9:	51                   	push   %ecx
  ea:	51                   	push   %ecx
  eb:	6a 00                	push   $0x0
  ed:	ff 76 04             	push   0x4(%esi)
  f0:	e8 b6 04 00 00       	call   5ab <head>
  f5:	83 c4 10             	add    $0x10,%esp
    } else {
        printf(2, "Please provide a file path for kernel mode execution.\n");
    }

    exit();
  f8:	e8 06 04 00 00       	call   503 <exit>
        printf(1, "Enter text (CTRL-D to end):\n");
  fd:	53                   	push   %ebx
  fe:	53                   	push   %ebx
  ff:	68 ff 09 00 00       	push   $0x9ff
 104:	6a 01                	push   $0x1
 106:	e8 65 05 00 00       	call   670 <printf>
        print_head(0, lines_to_read); 
 10b:	5e                   	pop    %esi
 10c:	5f                   	pop    %edi
 10d:	6a 0e                	push   $0xe
 10f:	6a 00                	push   $0x0
 111:	e8 ea 00 00 00       	call   200 <print_head>
        printf(2, "Please provide a file path for kernel mode execution.\n");
 116:	58                   	pop    %eax
 117:	5a                   	pop    %edx
 118:	68 c8 09 00 00       	push   $0x9c8
 11d:	6a 02                	push   $0x2
 11f:	e8 4c 05 00 00       	call   670 <printf>
 124:	83 c4 10             	add    $0x10,%esp
 127:	eb cf                	jmp    f8 <main+0xf8>
            lines_to_read = atoi(argv[1] + 1);
 129:	83 ec 0c             	sub    $0xc,%esp
 12c:	83 c0 01             	add    $0x1,%eax
 12f:	50                   	push   %eax
 130:	e8 5b 03 00 00       	call   490 <atoi>
            if(argc == 2){
 135:	83 c4 10             	add    $0x10,%esp
            lines_to_read = atoi(argv[1] + 1);
 138:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            if(argc == 2){
 13b:	83 ff 02             	cmp    $0x2,%edi
 13e:	0f 84 99 00 00 00    	je     1dd <main+0x1dd>
                    int fd = open(argv[j], O_RDONLY);
 144:	83 ec 08             	sub    $0x8,%esp
 147:	8d 46 08             	lea    0x8(%esi),%eax
 14a:	6a 00                	push   $0x0
 14c:	ff 76 08             	push   0x8(%esi)
 14f:	89 45 e0             	mov    %eax,-0x20(%ebp)
 152:	e8 ec 03 00 00       	call   543 <open>
                    if (fd < 0) {
 157:	83 c4 10             	add    $0x10,%esp
                    int fd = open(argv[j], O_RDONLY);
 15a:	89 c3                	mov    %eax,%ebx
                    if (fd < 0) {
 15c:	85 c0                	test   %eax,%eax
 15e:	78 5a                	js     1ba <main+0x1ba>
                    printf(1, "==> %s <==\n", argv[j]);
 160:	83 ec 04             	sub    $0x4,%esp
 163:	ff 76 08             	push   0x8(%esi)
 166:	68 37 0a 00 00       	push   $0xa37
 16b:	6a 01                	push   $0x1
 16d:	e8 fe 04 00 00       	call   670 <printf>
                    print_head(fd, lines_to_read);
 172:	59                   	pop    %ecx
 173:	58                   	pop    %eax
 174:	ff 75 e4             	push   -0x1c(%ebp)
 177:	53                   	push   %ebx
 178:	e8 83 00 00 00       	call   200 <print_head>
                    close(fd);
 17d:	89 1c 24             	mov    %ebx,(%esp)
 180:	e8 a6 03 00 00       	call   52b <close>
                for (int j = 2; j < argc && j < 4; j++) {
 185:	83 c4 10             	add    $0x10,%esp
 188:	83 ff 03             	cmp    $0x3,%edi
 18b:	0f 8e 58 ff ff ff    	jle    e9 <main+0xe9>
                        printf(1, "\n");
 191:	50                   	push   %eax
 192:	50                   	push   %eax
 193:	68 1a 0a 00 00       	push   $0xa1a
 198:	6a 01                	push   $0x1
 19a:	e8 d1 04 00 00       	call   670 <printf>
                    int fd = open(argv[j], O_RDONLY);
 19f:	8d 46 0c             	lea    0xc(%esi),%eax
 1a2:	89 45 e0             	mov    %eax,-0x20(%ebp)
 1a5:	58                   	pop    %eax
 1a6:	5a                   	pop    %edx
 1a7:	6a 00                	push   $0x0
 1a9:	ff 76 0c             	push   0xc(%esi)
 1ac:	e8 92 03 00 00       	call   543 <open>
                    if (fd < 0) {
 1b1:	83 c4 10             	add    $0x10,%esp
                    int fd = open(argv[j], O_RDONLY);
 1b4:	89 c3                	mov    %eax,%ebx
                    if (fd < 0) {
 1b6:	85 c0                	test   %eax,%eax
 1b8:	79 09                	jns    1c3 <main+0x1c3>
                        printf(2, "head: cannot open file %s\n", argv[j]);
 1ba:	50                   	push   %eax
 1bb:	8b 45 e0             	mov    -0x20(%ebp),%eax
 1be:	e9 ee fe ff ff       	jmp    b1 <main+0xb1>
                    printf(1, "==> %s <==\n", argv[j]);
 1c3:	57                   	push   %edi
 1c4:	ff 76 0c             	push   0xc(%esi)
 1c7:	68 37 0a 00 00       	push   $0xa37
 1cc:	6a 01                	push   $0x1
 1ce:	e8 9d 04 00 00       	call   670 <printf>
                    print_head(fd, lines_to_read);
 1d3:	58                   	pop    %eax
 1d4:	5a                   	pop    %edx
 1d5:	ff 75 e4             	push   -0x1c(%ebp)
 1d8:	e9 fb fe ff ff       	jmp    d8 <main+0xd8>
                printf(1, "Enter text (CTRL-D to end):\n");
 1dd:	51                   	push   %ecx
 1de:	51                   	push   %ecx
 1df:	68 ff 09 00 00       	push   $0x9ff
 1e4:	6a 01                	push   $0x1
 1e6:	e8 85 04 00 00       	call   670 <printf>
                print_head(0, lines_to_read); 
 1eb:	5b                   	pop    %ebx
 1ec:	5f                   	pop    %edi
 1ed:	ff 75 e4             	push   -0x1c(%ebp)
 1f0:	6a 00                	push   $0x0
 1f2:	e8 09 00 00 00       	call   200 <print_head>
 1f7:	83 c4 10             	add    $0x10,%esp
 1fa:	e9 ea fe ff ff       	jmp    e9 <main+0xe9>
 1ff:	90                   	nop

00000200 <print_head>:
void print_head(int fd, int lines_to_read) {
 200:	55                   	push   %ebp
    int line_count = 0;
 201:	31 c9                	xor    %ecx,%ecx
void print_head(int fd, int lines_to_read) {
 203:	89 e5                	mov    %esp,%ebp
 205:	57                   	push   %edi
 206:	56                   	push   %esi
 207:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 20d:	53                   	push   %ebx
 20e:	89 cb                	mov    %ecx,%ebx
 210:	81 ec 1c 02 00 00    	sub    $0x21c,%esp
    while ((bytes_read = read(fd, buf, sizeof(buf))) > 0) {
 216:	83 ec 04             	sub    $0x4,%esp
 219:	68 00 02 00 00       	push   $0x200
 21e:	57                   	push   %edi
 21f:	ff 75 08             	push   0x8(%ebp)
 222:	e8 f4 02 00 00       	call   51b <read>
 227:	83 c4 10             	add    $0x10,%esp
 22a:	89 c6                	mov    %eax,%esi
 22c:	85 c0                	test   %eax,%eax
 22e:	7e 3d                	jle    26d <print_head+0x6d>
            if (i == bytes_read - 1) {
 230:	8d 56 ff             	lea    -0x1(%esi),%edx
 233:	89 f1                	mov    %esi,%ecx
        for (i = 0; i < bytes_read; i++) {
 235:	31 c0                	xor    %eax,%eax
            if (i == bytes_read - 1) {
 237:	89 de                	mov    %ebx,%esi
 239:	eb 12                	jmp    24d <print_head+0x4d>
 23b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 23f:	90                   	nop
                    write(1, buf + start, i - start + 1);
 240:	8d 58 01             	lea    0x1(%eax),%ebx
            if (i == bytes_read - 1) {
 243:	39 c2                	cmp    %eax,%edx
 245:	74 31                	je     278 <print_head+0x78>
        for (i = 0; i < bytes_read; i++) {
 247:	39 d9                	cmp    %ebx,%ecx
 249:	74 5d                	je     2a8 <print_head+0xa8>
 24b:	89 d8                	mov    %ebx,%eax
            if (buf[i] == '\n') {
 24d:	80 3c 07 0a          	cmpb   $0xa,(%edi,%eax,1)
 251:	75 ed                	jne    240 <print_head+0x40>
                line_count++;
 253:	83 c6 01             	add    $0x1,%esi
                if (line_count == lines_to_read) {
 256:	3b 75 0c             	cmp    0xc(%ebp),%esi
 259:	75 e5                	jne    240 <print_head+0x40>
                    write(1, buf + start, i - start + 1);
 25b:	83 ec 04             	sub    $0x4,%esp
 25e:	83 c0 01             	add    $0x1,%eax
 261:	50                   	push   %eax
 262:	57                   	push   %edi
 263:	6a 01                	push   $0x1
 265:	e8 b9 02 00 00       	call   523 <write>
 26a:	83 c4 10             	add    $0x10,%esp
}
 26d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 270:	5b                   	pop    %ebx
 271:	5e                   	pop    %esi
 272:	5f                   	pop    %edi
 273:	5d                   	pop    %ebp
 274:	c3                   	ret    
 275:	8d 76 00             	lea    0x0(%esi),%esi
                write(1, buf + start, i - start + 1);
 278:	83 ec 04             	sub    $0x4,%esp
 27b:	89 95 e0 fd ff ff    	mov    %edx,-0x220(%ebp)
 281:	53                   	push   %ebx
 282:	57                   	push   %edi
 283:	6a 01                	push   $0x1
 285:	89 8d e4 fd ff ff    	mov    %ecx,-0x21c(%ebp)
 28b:	e8 93 02 00 00       	call   523 <write>
 290:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 296:	8b 95 e0 fd ff ff    	mov    -0x220(%ebp),%edx
 29c:	83 c4 10             	add    $0x10,%esp
        for (i = 0; i < bytes_read; i++) {
 29f:	39 d9                	cmp    %ebx,%ecx
 2a1:	75 a8                	jne    24b <print_head+0x4b>
 2a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2a7:	90                   	nop
 2a8:	89 f3                	mov    %esi,%ebx
 2aa:	e9 67 ff ff ff       	jmp    216 <print_head+0x16>
 2af:	90                   	nop

000002b0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 2b0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2b1:	31 c0                	xor    %eax,%eax
{
 2b3:	89 e5                	mov    %esp,%ebp
 2b5:	53                   	push   %ebx
 2b6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 2bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 2c0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 2c4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 2c7:	83 c0 01             	add    $0x1,%eax
 2ca:	84 d2                	test   %dl,%dl
 2cc:	75 f2                	jne    2c0 <strcpy+0x10>
    ;
  return os;
}
 2ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2d1:	89 c8                	mov    %ecx,%eax
 2d3:	c9                   	leave  
 2d4:	c3                   	ret    
 2d5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	53                   	push   %ebx
 2e4:	8b 55 08             	mov    0x8(%ebp),%edx
 2e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 2ea:	0f b6 02             	movzbl (%edx),%eax
 2ed:	84 c0                	test   %al,%al
 2ef:	75 17                	jne    308 <strcmp+0x28>
 2f1:	eb 3a                	jmp    32d <strcmp+0x4d>
 2f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2f7:	90                   	nop
 2f8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 2fc:	83 c2 01             	add    $0x1,%edx
 2ff:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 302:	84 c0                	test   %al,%al
 304:	74 1a                	je     320 <strcmp+0x40>
    p++, q++;
 306:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 308:	0f b6 19             	movzbl (%ecx),%ebx
 30b:	38 c3                	cmp    %al,%bl
 30d:	74 e9                	je     2f8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 30f:	29 d8                	sub    %ebx,%eax
}
 311:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 314:	c9                   	leave  
 315:	c3                   	ret    
 316:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 320:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 324:	31 c0                	xor    %eax,%eax
 326:	29 d8                	sub    %ebx,%eax
}
 328:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 32b:	c9                   	leave  
 32c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 32d:	0f b6 19             	movzbl (%ecx),%ebx
 330:	31 c0                	xor    %eax,%eax
 332:	eb db                	jmp    30f <strcmp+0x2f>
 334:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 33f:	90                   	nop

00000340 <strlen>:

uint
strlen(const char *s)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 346:	80 3a 00             	cmpb   $0x0,(%edx)
 349:	74 15                	je     360 <strlen+0x20>
 34b:	31 c0                	xor    %eax,%eax
 34d:	8d 76 00             	lea    0x0(%esi),%esi
 350:	83 c0 01             	add    $0x1,%eax
 353:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 357:	89 c1                	mov    %eax,%ecx
 359:	75 f5                	jne    350 <strlen+0x10>
    ;
  return n;
}
 35b:	89 c8                	mov    %ecx,%eax
 35d:	5d                   	pop    %ebp
 35e:	c3                   	ret    
 35f:	90                   	nop
  for(n = 0; s[n]; n++)
 360:	31 c9                	xor    %ecx,%ecx
}
 362:	5d                   	pop    %ebp
 363:	89 c8                	mov    %ecx,%eax
 365:	c3                   	ret    
 366:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36d:	8d 76 00             	lea    0x0(%esi),%esi

00000370 <memset>:

void*
memset(void *dst, int c, uint n)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 377:	8b 4d 10             	mov    0x10(%ebp),%ecx
 37a:	8b 45 0c             	mov    0xc(%ebp),%eax
 37d:	89 d7                	mov    %edx,%edi
 37f:	fc                   	cld    
 380:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 382:	8b 7d fc             	mov    -0x4(%ebp),%edi
 385:	89 d0                	mov    %edx,%eax
 387:	c9                   	leave  
 388:	c3                   	ret    
 389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000390 <strchr>:

char*
strchr(const char *s, char c)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	8b 45 08             	mov    0x8(%ebp),%eax
 396:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 39a:	0f b6 10             	movzbl (%eax),%edx
 39d:	84 d2                	test   %dl,%dl
 39f:	75 12                	jne    3b3 <strchr+0x23>
 3a1:	eb 1d                	jmp    3c0 <strchr+0x30>
 3a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3a7:	90                   	nop
 3a8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 3ac:	83 c0 01             	add    $0x1,%eax
 3af:	84 d2                	test   %dl,%dl
 3b1:	74 0d                	je     3c0 <strchr+0x30>
    if(*s == c)
 3b3:	38 d1                	cmp    %dl,%cl
 3b5:	75 f1                	jne    3a8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 3b7:	5d                   	pop    %ebp
 3b8:	c3                   	ret    
 3b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 3c0:	31 c0                	xor    %eax,%eax
}
 3c2:	5d                   	pop    %ebp
 3c3:	c3                   	ret    
 3c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop

000003d0 <gets>:

char*
gets(char *buf, int max)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	57                   	push   %edi
 3d4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 3d5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 3d8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 3d9:	31 db                	xor    %ebx,%ebx
{
 3db:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 3de:	eb 27                	jmp    407 <gets+0x37>
    cc = read(0, &c, 1);
 3e0:	83 ec 04             	sub    $0x4,%esp
 3e3:	6a 01                	push   $0x1
 3e5:	57                   	push   %edi
 3e6:	6a 00                	push   $0x0
 3e8:	e8 2e 01 00 00       	call   51b <read>
    if(cc < 1)
 3ed:	83 c4 10             	add    $0x10,%esp
 3f0:	85 c0                	test   %eax,%eax
 3f2:	7e 1d                	jle    411 <gets+0x41>
      break;
    buf[i++] = c;
 3f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3f8:	8b 55 08             	mov    0x8(%ebp),%edx
 3fb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 3ff:	3c 0a                	cmp    $0xa,%al
 401:	74 1d                	je     420 <gets+0x50>
 403:	3c 0d                	cmp    $0xd,%al
 405:	74 19                	je     420 <gets+0x50>
  for(i=0; i+1 < max; ){
 407:	89 de                	mov    %ebx,%esi
 409:	83 c3 01             	add    $0x1,%ebx
 40c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 40f:	7c cf                	jl     3e0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 411:	8b 45 08             	mov    0x8(%ebp),%eax
 414:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 418:	8d 65 f4             	lea    -0xc(%ebp),%esp
 41b:	5b                   	pop    %ebx
 41c:	5e                   	pop    %esi
 41d:	5f                   	pop    %edi
 41e:	5d                   	pop    %ebp
 41f:	c3                   	ret    
  buf[i] = '\0';
 420:	8b 45 08             	mov    0x8(%ebp),%eax
 423:	89 de                	mov    %ebx,%esi
 425:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 429:	8d 65 f4             	lea    -0xc(%ebp),%esp
 42c:	5b                   	pop    %ebx
 42d:	5e                   	pop    %esi
 42e:	5f                   	pop    %edi
 42f:	5d                   	pop    %ebp
 430:	c3                   	ret    
 431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 438:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43f:	90                   	nop

00000440 <stat>:

int
stat(const char *n, struct stat *st)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	56                   	push   %esi
 444:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 445:	83 ec 08             	sub    $0x8,%esp
 448:	6a 00                	push   $0x0
 44a:	ff 75 08             	push   0x8(%ebp)
 44d:	e8 f1 00 00 00       	call   543 <open>
  if(fd < 0)
 452:	83 c4 10             	add    $0x10,%esp
 455:	85 c0                	test   %eax,%eax
 457:	78 27                	js     480 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 459:	83 ec 08             	sub    $0x8,%esp
 45c:	ff 75 0c             	push   0xc(%ebp)
 45f:	89 c3                	mov    %eax,%ebx
 461:	50                   	push   %eax
 462:	e8 f4 00 00 00       	call   55b <fstat>
  close(fd);
 467:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 46a:	89 c6                	mov    %eax,%esi
  close(fd);
 46c:	e8 ba 00 00 00       	call   52b <close>
  return r;
 471:	83 c4 10             	add    $0x10,%esp
}
 474:	8d 65 f8             	lea    -0x8(%ebp),%esp
 477:	89 f0                	mov    %esi,%eax
 479:	5b                   	pop    %ebx
 47a:	5e                   	pop    %esi
 47b:	5d                   	pop    %ebp
 47c:	c3                   	ret    
 47d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 480:	be ff ff ff ff       	mov    $0xffffffff,%esi
 485:	eb ed                	jmp    474 <stat+0x34>
 487:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48e:	66 90                	xchg   %ax,%ax

00000490 <atoi>:

int
atoi(const char *s)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	53                   	push   %ebx
 494:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 497:	0f be 02             	movsbl (%edx),%eax
 49a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 49d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 4a0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 4a5:	77 1e                	ja     4c5 <atoi+0x35>
 4a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ae:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 4b0:	83 c2 01             	add    $0x1,%edx
 4b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 4b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 4ba:	0f be 02             	movsbl (%edx),%eax
 4bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4c0:	80 fb 09             	cmp    $0x9,%bl
 4c3:	76 eb                	jbe    4b0 <atoi+0x20>
  return n;
}
 4c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4c8:	89 c8                	mov    %ecx,%eax
 4ca:	c9                   	leave  
 4cb:	c3                   	ret    
 4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	8b 45 10             	mov    0x10(%ebp),%eax
 4d7:	8b 55 08             	mov    0x8(%ebp),%edx
 4da:	56                   	push   %esi
 4db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4de:	85 c0                	test   %eax,%eax
 4e0:	7e 13                	jle    4f5 <memmove+0x25>
 4e2:	01 d0                	add    %edx,%eax
  dst = vdst;
 4e4:	89 d7                	mov    %edx,%edi
 4e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 4f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 4f1:	39 f8                	cmp    %edi,%eax
 4f3:	75 fb                	jne    4f0 <memmove+0x20>
  return vdst;
}
 4f5:	5e                   	pop    %esi
 4f6:	89 d0                	mov    %edx,%eax
 4f8:	5f                   	pop    %edi
 4f9:	5d                   	pop    %ebp
 4fa:	c3                   	ret    

000004fb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4fb:	b8 01 00 00 00       	mov    $0x1,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <exit>:
SYSCALL(exit)
 503:	b8 02 00 00 00       	mov    $0x2,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <wait>:
SYSCALL(wait)
 50b:	b8 03 00 00 00       	mov    $0x3,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <pipe>:
SYSCALL(pipe)
 513:	b8 04 00 00 00       	mov    $0x4,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <read>:
SYSCALL(read)
 51b:	b8 05 00 00 00       	mov    $0x5,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <write>:
SYSCALL(write)
 523:	b8 10 00 00 00       	mov    $0x10,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <close>:
SYSCALL(close)
 52b:	b8 15 00 00 00       	mov    $0x15,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <kill>:
SYSCALL(kill)
 533:	b8 06 00 00 00       	mov    $0x6,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <exec>:
SYSCALL(exec)
 53b:	b8 07 00 00 00       	mov    $0x7,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <open>:
SYSCALL(open)
 543:	b8 0f 00 00 00       	mov    $0xf,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <mknod>:
SYSCALL(mknod)
 54b:	b8 11 00 00 00       	mov    $0x11,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <unlink>:
SYSCALL(unlink)
 553:	b8 12 00 00 00       	mov    $0x12,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <fstat>:
SYSCALL(fstat)
 55b:	b8 08 00 00 00       	mov    $0x8,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <link>:
SYSCALL(link)
 563:	b8 13 00 00 00       	mov    $0x13,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <mkdir>:
SYSCALL(mkdir)
 56b:	b8 14 00 00 00       	mov    $0x14,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <chdir>:
SYSCALL(chdir)
 573:	b8 09 00 00 00       	mov    $0x9,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <dup>:
SYSCALL(dup)
 57b:	b8 0a 00 00 00       	mov    $0xa,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <getpid>:
SYSCALL(getpid)
 583:	b8 0b 00 00 00       	mov    $0xb,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <sbrk>:
SYSCALL(sbrk)
 58b:	b8 0c 00 00 00       	mov    $0xc,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <sleep>:
SYSCALL(sleep)
 593:	b8 0d 00 00 00       	mov    $0xd,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <uptime>:
SYSCALL(uptime)
 59b:	b8 0e 00 00 00       	mov    $0xe,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <uniq>:
SYSCALL(uniq)
 5a3:	b8 16 00 00 00       	mov    $0x16,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <head>:
SYSCALL(head)
 5ab:	b8 17 00 00 00       	mov    $0x17,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    
 5b3:	66 90                	xchg   %ax,%ax
 5b5:	66 90                	xchg   %ax,%ax
 5b7:	66 90                	xchg   %ax,%ax
 5b9:	66 90                	xchg   %ax,%ax
 5bb:	66 90                	xchg   %ax,%ax
 5bd:	66 90                	xchg   %ax,%ax
 5bf:	90                   	nop

000005c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
 5c6:	83 ec 3c             	sub    $0x3c,%esp
 5c9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5cc:	89 d1                	mov    %edx,%ecx
{
 5ce:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5d1:	85 d2                	test   %edx,%edx
 5d3:	0f 89 7f 00 00 00    	jns    658 <printint+0x98>
 5d9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5dd:	74 79                	je     658 <printint+0x98>
    neg = 1;
 5df:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 5e6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 5e8:	31 db                	xor    %ebx,%ebx
 5ea:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5f0:	89 c8                	mov    %ecx,%eax
 5f2:	31 d2                	xor    %edx,%edx
 5f4:	89 cf                	mov    %ecx,%edi
 5f6:	f7 75 c4             	divl   -0x3c(%ebp)
 5f9:	0f b6 92 a4 0a 00 00 	movzbl 0xaa4(%edx),%edx
 600:	89 45 c0             	mov    %eax,-0x40(%ebp)
 603:	89 d8                	mov    %ebx,%eax
 605:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 608:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 60b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 60e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 611:	76 dd                	jbe    5f0 <printint+0x30>
  if(neg)
 613:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 616:	85 c9                	test   %ecx,%ecx
 618:	74 0c                	je     626 <printint+0x66>
    buf[i++] = '-';
 61a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 61f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 621:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 626:	8b 7d b8             	mov    -0x48(%ebp),%edi
 629:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 62d:	eb 07                	jmp    636 <printint+0x76>
 62f:	90                   	nop
    putc(fd, buf[i]);
 630:	0f b6 13             	movzbl (%ebx),%edx
 633:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 636:	83 ec 04             	sub    $0x4,%esp
 639:	88 55 d7             	mov    %dl,-0x29(%ebp)
 63c:	6a 01                	push   $0x1
 63e:	56                   	push   %esi
 63f:	57                   	push   %edi
 640:	e8 de fe ff ff       	call   523 <write>
  while(--i >= 0)
 645:	83 c4 10             	add    $0x10,%esp
 648:	39 de                	cmp    %ebx,%esi
 64a:	75 e4                	jne    630 <printint+0x70>
}
 64c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 64f:	5b                   	pop    %ebx
 650:	5e                   	pop    %esi
 651:	5f                   	pop    %edi
 652:	5d                   	pop    %ebp
 653:	c3                   	ret    
 654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 658:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 65f:	eb 87                	jmp    5e8 <printint+0x28>
 661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 668:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66f:	90                   	nop

00000670 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	56                   	push   %esi
 675:	53                   	push   %ebx
 676:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 679:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 67c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 67f:	0f b6 13             	movzbl (%ebx),%edx
 682:	84 d2                	test   %dl,%dl
 684:	74 6a                	je     6f0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 686:	8d 45 10             	lea    0x10(%ebp),%eax
 689:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 68c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 68f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 691:	89 45 d0             	mov    %eax,-0x30(%ebp)
 694:	eb 36                	jmp    6cc <printf+0x5c>
 696:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 69d:	8d 76 00             	lea    0x0(%esi),%esi
 6a0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6a3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 6a8:	83 f8 25             	cmp    $0x25,%eax
 6ab:	74 15                	je     6c2 <printf+0x52>
  write(fd, &c, 1);
 6ad:	83 ec 04             	sub    $0x4,%esp
 6b0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6b3:	6a 01                	push   $0x1
 6b5:	57                   	push   %edi
 6b6:	56                   	push   %esi
 6b7:	e8 67 fe ff ff       	call   523 <write>
 6bc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 6bf:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6c2:	0f b6 13             	movzbl (%ebx),%edx
 6c5:	83 c3 01             	add    $0x1,%ebx
 6c8:	84 d2                	test   %dl,%dl
 6ca:	74 24                	je     6f0 <printf+0x80>
    c = fmt[i] & 0xff;
 6cc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 6cf:	85 c9                	test   %ecx,%ecx
 6d1:	74 cd                	je     6a0 <printf+0x30>
      }
    } else if(state == '%'){
 6d3:	83 f9 25             	cmp    $0x25,%ecx
 6d6:	75 ea                	jne    6c2 <printf+0x52>
      if(c == 'd'){
 6d8:	83 f8 25             	cmp    $0x25,%eax
 6db:	0f 84 07 01 00 00    	je     7e8 <printf+0x178>
 6e1:	83 e8 63             	sub    $0x63,%eax
 6e4:	83 f8 15             	cmp    $0x15,%eax
 6e7:	77 17                	ja     700 <printf+0x90>
 6e9:	ff 24 85 4c 0a 00 00 	jmp    *0xa4c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6f3:	5b                   	pop    %ebx
 6f4:	5e                   	pop    %esi
 6f5:	5f                   	pop    %edi
 6f6:	5d                   	pop    %ebp
 6f7:	c3                   	ret    
 6f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ff:	90                   	nop
  write(fd, &c, 1);
 700:	83 ec 04             	sub    $0x4,%esp
 703:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 706:	6a 01                	push   $0x1
 708:	57                   	push   %edi
 709:	56                   	push   %esi
 70a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 70e:	e8 10 fe ff ff       	call   523 <write>
        putc(fd, c);
 713:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 717:	83 c4 0c             	add    $0xc,%esp
 71a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 71d:	6a 01                	push   $0x1
 71f:	57                   	push   %edi
 720:	56                   	push   %esi
 721:	e8 fd fd ff ff       	call   523 <write>
        putc(fd, c);
 726:	83 c4 10             	add    $0x10,%esp
      state = 0;
 729:	31 c9                	xor    %ecx,%ecx
 72b:	eb 95                	jmp    6c2 <printf+0x52>
 72d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 730:	83 ec 0c             	sub    $0xc,%esp
 733:	b9 10 00 00 00       	mov    $0x10,%ecx
 738:	6a 00                	push   $0x0
 73a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 73d:	8b 10                	mov    (%eax),%edx
 73f:	89 f0                	mov    %esi,%eax
 741:	e8 7a fe ff ff       	call   5c0 <printint>
        ap++;
 746:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 74a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 74d:	31 c9                	xor    %ecx,%ecx
 74f:	e9 6e ff ff ff       	jmp    6c2 <printf+0x52>
 754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 758:	8b 45 d0             	mov    -0x30(%ebp),%eax
 75b:	8b 10                	mov    (%eax),%edx
        ap++;
 75d:	83 c0 04             	add    $0x4,%eax
 760:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 763:	85 d2                	test   %edx,%edx
 765:	0f 84 8d 00 00 00    	je     7f8 <printf+0x188>
        while(*s != 0){
 76b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 76e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 770:	84 c0                	test   %al,%al
 772:	0f 84 4a ff ff ff    	je     6c2 <printf+0x52>
 778:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 77b:	89 d3                	mov    %edx,%ebx
 77d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 780:	83 ec 04             	sub    $0x4,%esp
          s++;
 783:	83 c3 01             	add    $0x1,%ebx
 786:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 789:	6a 01                	push   $0x1
 78b:	57                   	push   %edi
 78c:	56                   	push   %esi
 78d:	e8 91 fd ff ff       	call   523 <write>
        while(*s != 0){
 792:	0f b6 03             	movzbl (%ebx),%eax
 795:	83 c4 10             	add    $0x10,%esp
 798:	84 c0                	test   %al,%al
 79a:	75 e4                	jne    780 <printf+0x110>
      state = 0;
 79c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 79f:	31 c9                	xor    %ecx,%ecx
 7a1:	e9 1c ff ff ff       	jmp    6c2 <printf+0x52>
 7a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ad:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 7b0:	83 ec 0c             	sub    $0xc,%esp
 7b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7b8:	6a 01                	push   $0x1
 7ba:	e9 7b ff ff ff       	jmp    73a <printf+0xca>
 7bf:	90                   	nop
        putc(fd, *ap);
 7c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 7c3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 7c6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 7c8:	6a 01                	push   $0x1
 7ca:	57                   	push   %edi
 7cb:	56                   	push   %esi
        putc(fd, *ap);
 7cc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7cf:	e8 4f fd ff ff       	call   523 <write>
        ap++;
 7d4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 7d8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7db:	31 c9                	xor    %ecx,%ecx
 7dd:	e9 e0 fe ff ff       	jmp    6c2 <printf+0x52>
 7e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 7e8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 7eb:	83 ec 04             	sub    $0x4,%esp
 7ee:	e9 2a ff ff ff       	jmp    71d <printf+0xad>
 7f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7f7:	90                   	nop
          s = "(null)";
 7f8:	ba 43 0a 00 00       	mov    $0xa43,%edx
        while(*s != 0){
 7fd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 800:	b8 28 00 00 00       	mov    $0x28,%eax
 805:	89 d3                	mov    %edx,%ebx
 807:	e9 74 ff ff ff       	jmp    780 <printf+0x110>
 80c:	66 90                	xchg   %ax,%ax
 80e:	66 90                	xchg   %ax,%ax

00000810 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 810:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 811:	a1 88 0d 00 00       	mov    0xd88,%eax
{
 816:	89 e5                	mov    %esp,%ebp
 818:	57                   	push   %edi
 819:	56                   	push   %esi
 81a:	53                   	push   %ebx
 81b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 81e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 828:	89 c2                	mov    %eax,%edx
 82a:	8b 00                	mov    (%eax),%eax
 82c:	39 ca                	cmp    %ecx,%edx
 82e:	73 30                	jae    860 <free+0x50>
 830:	39 c1                	cmp    %eax,%ecx
 832:	72 04                	jb     838 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 834:	39 c2                	cmp    %eax,%edx
 836:	72 f0                	jb     828 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 838:	8b 73 fc             	mov    -0x4(%ebx),%esi
 83b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 83e:	39 f8                	cmp    %edi,%eax
 840:	74 30                	je     872 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 842:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 845:	8b 42 04             	mov    0x4(%edx),%eax
 848:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 84b:	39 f1                	cmp    %esi,%ecx
 84d:	74 3a                	je     889 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 84f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 851:	5b                   	pop    %ebx
  freep = p;
 852:	89 15 88 0d 00 00    	mov    %edx,0xd88
}
 858:	5e                   	pop    %esi
 859:	5f                   	pop    %edi
 85a:	5d                   	pop    %ebp
 85b:	c3                   	ret    
 85c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 860:	39 c2                	cmp    %eax,%edx
 862:	72 c4                	jb     828 <free+0x18>
 864:	39 c1                	cmp    %eax,%ecx
 866:	73 c0                	jae    828 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 868:	8b 73 fc             	mov    -0x4(%ebx),%esi
 86b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 86e:	39 f8                	cmp    %edi,%eax
 870:	75 d0                	jne    842 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 872:	03 70 04             	add    0x4(%eax),%esi
 875:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 878:	8b 02                	mov    (%edx),%eax
 87a:	8b 00                	mov    (%eax),%eax
 87c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 87f:	8b 42 04             	mov    0x4(%edx),%eax
 882:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 885:	39 f1                	cmp    %esi,%ecx
 887:	75 c6                	jne    84f <free+0x3f>
    p->s.size += bp->s.size;
 889:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 88c:	89 15 88 0d 00 00    	mov    %edx,0xd88
    p->s.size += bp->s.size;
 892:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 895:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 898:	89 0a                	mov    %ecx,(%edx)
}
 89a:	5b                   	pop    %ebx
 89b:	5e                   	pop    %esi
 89c:	5f                   	pop    %edi
 89d:	5d                   	pop    %ebp
 89e:	c3                   	ret    
 89f:	90                   	nop

000008a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	57                   	push   %edi
 8a4:	56                   	push   %esi
 8a5:	53                   	push   %ebx
 8a6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8ac:	8b 3d 88 0d 00 00    	mov    0xd88,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b2:	8d 70 07             	lea    0x7(%eax),%esi
 8b5:	c1 ee 03             	shr    $0x3,%esi
 8b8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 8bb:	85 ff                	test   %edi,%edi
 8bd:	0f 84 9d 00 00 00    	je     960 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 8c5:	8b 4a 04             	mov    0x4(%edx),%ecx
 8c8:	39 f1                	cmp    %esi,%ecx
 8ca:	73 6a                	jae    936 <malloc+0x96>
 8cc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8d1:	39 de                	cmp    %ebx,%esi
 8d3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 8d6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8e0:	eb 17                	jmp    8f9 <malloc+0x59>
 8e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8ea:	8b 48 04             	mov    0x4(%eax),%ecx
 8ed:	39 f1                	cmp    %esi,%ecx
 8ef:	73 4f                	jae    940 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8f1:	8b 3d 88 0d 00 00    	mov    0xd88,%edi
 8f7:	89 c2                	mov    %eax,%edx
 8f9:	39 d7                	cmp    %edx,%edi
 8fb:	75 eb                	jne    8e8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 8fd:	83 ec 0c             	sub    $0xc,%esp
 900:	ff 75 e4             	push   -0x1c(%ebp)
 903:	e8 83 fc ff ff       	call   58b <sbrk>
  if(p == (char*)-1)
 908:	83 c4 10             	add    $0x10,%esp
 90b:	83 f8 ff             	cmp    $0xffffffff,%eax
 90e:	74 1c                	je     92c <malloc+0x8c>
  hp->s.size = nu;
 910:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 913:	83 ec 0c             	sub    $0xc,%esp
 916:	83 c0 08             	add    $0x8,%eax
 919:	50                   	push   %eax
 91a:	e8 f1 fe ff ff       	call   810 <free>
  return freep;
 91f:	8b 15 88 0d 00 00    	mov    0xd88,%edx
      if((p = morecore(nunits)) == 0)
 925:	83 c4 10             	add    $0x10,%esp
 928:	85 d2                	test   %edx,%edx
 92a:	75 bc                	jne    8e8 <malloc+0x48>
        return 0;
  }
}
 92c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 92f:	31 c0                	xor    %eax,%eax
}
 931:	5b                   	pop    %ebx
 932:	5e                   	pop    %esi
 933:	5f                   	pop    %edi
 934:	5d                   	pop    %ebp
 935:	c3                   	ret    
    if(p->s.size >= nunits){
 936:	89 d0                	mov    %edx,%eax
 938:	89 fa                	mov    %edi,%edx
 93a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 940:	39 ce                	cmp    %ecx,%esi
 942:	74 4c                	je     990 <malloc+0xf0>
        p->s.size -= nunits;
 944:	29 f1                	sub    %esi,%ecx
 946:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 949:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 94c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 94f:	89 15 88 0d 00 00    	mov    %edx,0xd88
}
 955:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 958:	83 c0 08             	add    $0x8,%eax
}
 95b:	5b                   	pop    %ebx
 95c:	5e                   	pop    %esi
 95d:	5f                   	pop    %edi
 95e:	5d                   	pop    %ebp
 95f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 960:	c7 05 88 0d 00 00 8c 	movl   $0xd8c,0xd88
 967:	0d 00 00 
    base.s.size = 0;
 96a:	bf 8c 0d 00 00       	mov    $0xd8c,%edi
    base.s.ptr = freep = prevp = &base;
 96f:	c7 05 8c 0d 00 00 8c 	movl   $0xd8c,0xd8c
 976:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 979:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 97b:	c7 05 90 0d 00 00 00 	movl   $0x0,0xd90
 982:	00 00 00 
    if(p->s.size >= nunits){
 985:	e9 42 ff ff ff       	jmp    8cc <malloc+0x2c>
 98a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 990:	8b 08                	mov    (%eax),%ecx
 992:	89 0a                	mov    %ecx,(%edx)
 994:	eb b9                	jmp    94f <malloc+0xaf>
