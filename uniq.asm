
_uniq:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
        dest[i] = src[i];
    }
    dest[i] = '\0';
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
  11:	81 ec 18 04 00 00    	sub    $0x418,%esp
    if (argc != 2) {
  17:	83 39 02             	cmpl   $0x2,(%ecx)
int main(int argc, char *argv[]) {
  1a:	8b 59 04             	mov    0x4(%ecx),%ebx
    if (argc != 2) {
  1d:	74 14                	je     33 <main+0x33>
        printf(2, "Usage: %s <filename>\n", argv[0]);
  1f:	57                   	push   %edi
  20:	ff 33                	push   (%ebx)
  22:	68 a8 09 00 00       	push   $0x9a8
  27:	6a 02                	push   $0x2
  29:	e8 52 06 00 00       	call   680 <printf>
        exit();
  2e:	e8 e0 04 00 00       	call   513 <exit>
    }

    printf(1, "Uniq command is geing executed in user mode.\n");
  33:	51                   	push   %ecx
  34:	51                   	push   %ecx
  35:	68 d0 09 00 00       	push   $0x9d0
  3a:	6a 01                	push   $0x1
  3c:	e8 3f 06 00 00       	call   680 <printf>

    char *filename = argv[1];
  41:	8b 43 04             	mov    0x4(%ebx),%eax
    int fd = open(filename, O_RDONLY); // Open the file for reading
  44:	5b                   	pop    %ebx
  45:	5e                   	pop    %esi
  46:	6a 00                	push   $0x0
  48:	50                   	push   %eax
    char *filename = argv[1];
  49:	89 85 d8 fb ff ff    	mov    %eax,-0x428(%ebp)
    int fd = open(filename, O_RDONLY); // Open the file for reading
  4f:	e8 ff 04 00 00       	call   553 <open>

    if (fd < 0) {
  54:	83 c4 10             	add    $0x10,%esp
    int fd = open(filename, O_RDONLY); // Open the file for reading
  57:	89 85 dc fb ff ff    	mov    %eax,-0x424(%ebp)
    if (fd < 0) {
  5d:	85 c0                	test   %eax,%eax
  5f:	0f 88 19 01 00 00    	js     17e <main+0x17e>
        printf(2, "Error opening %s\n", filename);
        exit();
    }

    char buf[BUFSIZE];
    char prev_line[BUFSIZE] = ""; // Initialize with an empty string
  65:	8d bd ec fd ff ff    	lea    -0x214(%ebp),%edi
  6b:	b9 7f 00 00 00       	mov    $0x7f,%ecx
  70:	31 c0                	xor    %eax,%eax
  72:	c7 85 e8 fd ff ff 00 	movl   $0x0,-0x218(%ebp)
  79:	00 00 00 
  7c:	f3 ab                	rep stos %eax,%es:(%edi)
  7e:	8d bd e8 fb ff ff    	lea    -0x418(%ebp),%edi
  84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

    while (1) {
        int n = read(fd, buf, BUFSIZE);
  88:	83 ec 04             	sub    $0x4,%esp
  8b:	68 00 02 00 00       	push   $0x200
  90:	57                   	push   %edi
  91:	ff b5 dc fb ff ff    	push   -0x424(%ebp)
  97:	e8 8f 04 00 00       	call   52b <read>
        if (n <= 0) {
  9c:	83 c4 10             	add    $0x10,%esp
        int n = read(fd, buf, BUFSIZE);
  9f:	89 85 e4 fb ff ff    	mov    %eax,-0x41c(%ebp)
        if (n <= 0) {
  a5:	85 c0                	test   %eax,%eax
  a7:	0f 8e b2 00 00 00    	jle    15f <main+0x15f>
            break;
        }

        int line_start = 0;
        for (int i = 0; i < n; i++) {
  ad:	31 f6                	xor    %esi,%esi
        int line_start = 0;
  af:	31 d2                	xor    %edx,%edx
  b1:	eb 0d                	jmp    c0 <main+0xc0>
  b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b7:	90                   	nop
        for (int i = 0; i < n; i++) {
  b8:	3b b5 e4 fb ff ff    	cmp    -0x41c(%ebp),%esi
  be:	74 c8                	je     88 <main+0x88>
            if (buf[i] == '\n') {
  c0:	0f b6 04 37          	movzbl (%edi,%esi,1),%eax
                if (strcmp_custom(buf + line_start, prev_line) != 0) {
                    printf(1, "%s\n", buf + line_start);
                    remove_trailing_newline(buf + line_start);
                    strncpy_custom(prev_line, buf + line_start, BUFSIZE);
                }
                line_start = i + 1;
  c4:	83 c6 01             	add    $0x1,%esi
            if (buf[i] == '\n') {
  c7:	3c 0a                	cmp    $0xa,%al
  c9:	75 ed                	jne    b8 <main+0xb8>
                if (strcmp_custom(buf + line_start, prev_line) != 0) {
  cb:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
                buf[i] = '\0'; // Null-terminate the line
  ce:	c6 84 35 e7 fb ff ff 	movb   $0x0,-0x419(%ebp,%esi,1)
  d5:	00 
    return *s1 - *s2;
  d6:	0f b6 85 e8 fd ff ff 	movzbl -0x218(%ebp),%eax
    while (*s1 != '\0' && *s2 != '\0' && *s1 == *s2) {
  dd:	8d 8d e8 fd ff ff    	lea    -0x218(%ebp),%ecx
  e3:	0f b6 13             	movzbl (%ebx),%edx
                if (strcmp_custom(buf + line_start, prev_line) != 0) {
  e6:	89 9d e0 fb ff ff    	mov    %ebx,-0x420(%ebp)
    while (*s1 != '\0' && *s2 != '\0' && *s1 == *s2) {
  ec:	84 d2                	test   %dl,%dl
  ee:	75 1c                	jne    10c <main+0x10c>
  f0:	eb 62                	jmp    154 <main+0x154>
  f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f8:	84 c0                	test   %al,%al
  fa:	74 58                	je     154 <main+0x154>
  fc:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
        s1++;
 100:	83 c3 01             	add    $0x1,%ebx
        s2++;
 103:	8d 41 01             	lea    0x1(%ecx),%eax
    while (*s1 != '\0' && *s2 != '\0' && *s1 == *s2) {
 106:	84 d2                	test   %dl,%dl
 108:	74 46                	je     150 <main+0x150>
        s2++;
 10a:	89 c1                	mov    %eax,%ecx
    while (*s1 != '\0' && *s2 != '\0' && *s1 == *s2) {
 10c:	0f b6 01             	movzbl (%ecx),%eax
 10f:	38 c2                	cmp    %al,%dl
 111:	74 e5                	je     f8 <main+0xf8>
                    printf(1, "%s\n", buf + line_start);
 113:	8b 9d e0 fb ff ff    	mov    -0x420(%ebp),%ebx
 119:	83 ec 04             	sub    $0x4,%esp
 11c:	53                   	push   %ebx
 11d:	68 cc 09 00 00       	push   $0x9cc
 122:	6a 01                	push   $0x1
 124:	e8 57 05 00 00       	call   680 <printf>
                    remove_trailing_newline(buf + line_start);
 129:	89 1c 24             	mov    %ebx,(%esp)
 12c:	e8 9f 00 00 00       	call   1d0 <remove_trailing_newline>
                    strncpy_custom(prev_line, buf + line_start, BUFSIZE);
 131:	83 c4 0c             	add    $0xc,%esp
 134:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 13a:	68 00 02 00 00       	push   $0x200
 13f:	53                   	push   %ebx
 140:	50                   	push   %eax
 141:	e8 2a 01 00 00       	call   270 <strncpy_custom>
 146:	83 c4 10             	add    $0x10,%esp
                line_start = i + 1;
 149:	89 f2                	mov    %esi,%edx
 14b:	e9 68 ff ff ff       	jmp    b8 <main+0xb8>
    return *s1 - *s2;
 150:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
                if (strcmp_custom(buf + line_start, prev_line) != 0) {
 154:	38 c2                	cmp    %al,%dl
 156:	75 bb                	jne    113 <main+0x113>
                line_start = i + 1;
 158:	89 f2                	mov    %esi,%edx
 15a:	e9 59 ff ff ff       	jmp    b8 <main+0xb8>
            }
        }
    }

    close(fd);
 15f:	83 ec 0c             	sub    $0xc,%esp
 162:	ff b5 dc fb ff ff    	push   -0x424(%ebp)
 168:	e8 ce 03 00 00       	call   53b <close>
    uniq(filename);
 16d:	58                   	pop    %eax
 16e:	ff b5 d8 fb ff ff    	push   -0x428(%ebp)
 174:	e8 3a 04 00 00       	call   5b3 <uniq>
    exit();
 179:	e8 95 03 00 00       	call   513 <exit>
        printf(2, "Error opening %s\n", filename);
 17e:	52                   	push   %edx
 17f:	ff b5 d8 fb ff ff    	push   -0x428(%ebp)
 185:	68 be 09 00 00       	push   $0x9be
 18a:	6a 02                	push   $0x2
 18c:	e8 ef 04 00 00       	call   680 <printf>
        exit();
 191:	e8 7d 03 00 00       	call   513 <exit>
 196:	66 90                	xchg   %ax,%ax
 198:	66 90                	xchg   %ax,%ax
 19a:	66 90                	xchg   %ax,%ax
 19c:	66 90                	xchg   %ax,%ax
 19e:	66 90                	xchg   %ax,%ax

000001a0 <is_whitespace>:
int is_whitespace(char c) {
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	0f b6 45 08          	movzbl 0x8(%ebp),%eax
 1a7:	8d 48 f7             	lea    -0x9(%eax),%ecx
 1aa:	80 f9 17             	cmp    $0x17,%cl
 1ad:	77 11                	ja     1c0 <is_whitespace+0x20>
    return c == ' ' || c == '\t' || c == '\n' || c == '\r';
 1af:	b8 13 00 80 00       	mov    $0x800013,%eax
}
 1b4:	5d                   	pop    %ebp
    return c == ' ' || c == '\t' || c == '\n' || c == '\r';
 1b5:	d3 e8                	shr    %cl,%eax
 1b7:	83 e0 01             	and    $0x1,%eax
}
 1ba:	c3                   	ret    
 1bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1bf:	90                   	nop
    return c == ' ' || c == '\t' || c == '\n' || c == '\r';
 1c0:	31 c0                	xor    %eax,%eax
}
 1c2:	5d                   	pop    %ebp
 1c3:	c3                   	ret    
 1c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <remove_trailing_newline>:
void remove_trailing_newline(char *str) {
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	53                   	push   %ebx
 1d4:	83 ec 10             	sub    $0x10,%esp
 1d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    int len = strlen(str);
 1da:	53                   	push   %ebx
 1db:	e8 70 01 00 00       	call   350 <strlen>
    while (len > 0 && (str[len - 1] == '\n' || str[len - 1] == '\r')) {
 1e0:	83 c4 10             	add    $0x10,%esp
 1e3:	85 c0                	test   %eax,%eax
 1e5:	7e 22                	jle    209 <remove_trailing_newline+0x39>
 1e7:	8d 44 03 ff          	lea    -0x1(%ebx,%eax,1),%eax
 1eb:	eb 0f                	jmp    1fc <remove_trailing_newline+0x2c>
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
        str[len - 1] = '\0';
 1f0:	c6 00 00             	movb   $0x0,(%eax)
    while (len > 0 && (str[len - 1] == '\n' || str[len - 1] == '\r')) {
 1f3:	8d 50 ff             	lea    -0x1(%eax),%edx
 1f6:	39 d8                	cmp    %ebx,%eax
 1f8:	74 0f                	je     209 <remove_trailing_newline+0x39>
 1fa:	89 d0                	mov    %edx,%eax
 1fc:	0f b6 10             	movzbl (%eax),%edx
 1ff:	80 fa 0a             	cmp    $0xa,%dl
 202:	74 ec                	je     1f0 <remove_trailing_newline+0x20>
 204:	80 fa 0d             	cmp    $0xd,%dl
 207:	74 e7                	je     1f0 <remove_trailing_newline+0x20>
}
 209:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 20c:	c9                   	leave  
 20d:	c3                   	ret    
 20e:	66 90                	xchg   %ax,%ax

00000210 <strcmp_custom>:
int strcmp_custom(const char *s1, const char *s2) {
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	8b 4d 08             	mov    0x8(%ebp),%ecx
 217:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    while (*s1 != '\0' && *s2 != '\0' && *s1 == *s2) {
 21a:	0f be 01             	movsbl (%ecx),%eax
 21d:	84 c0                	test   %al,%al
 21f:	75 1b                	jne    23c <strcmp_custom+0x2c>
 221:	eb 3a                	jmp    25d <strcmp_custom+0x4d>
 223:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 227:	90                   	nop
 228:	84 d2                	test   %dl,%dl
 22a:	74 17                	je     243 <strcmp_custom+0x33>
 22c:	0f be 41 01          	movsbl 0x1(%ecx),%eax
        s1++;
 230:	83 c1 01             	add    $0x1,%ecx
        s2++;
 233:	8d 53 01             	lea    0x1(%ebx),%edx
    while (*s1 != '\0' && *s2 != '\0' && *s1 == *s2) {
 236:	84 c0                	test   %al,%al
 238:	74 16                	je     250 <strcmp_custom+0x40>
        s2++;
 23a:	89 d3                	mov    %edx,%ebx
    while (*s1 != '\0' && *s2 != '\0' && *s1 == *s2) {
 23c:	0f be 13             	movsbl (%ebx),%edx
 23f:	38 c2                	cmp    %al,%dl
 241:	74 e5                	je     228 <strcmp_custom+0x18>
}
 243:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return *s1 - *s2;
 246:	29 d0                	sub    %edx,%eax
}
 248:	c9                   	leave  
 249:	c3                   	ret    
 24a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return *s1 - *s2;
 250:	0f be 53 01          	movsbl 0x1(%ebx),%edx
 254:	31 c0                	xor    %eax,%eax
}
 256:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 259:	c9                   	leave  
    return *s1 - *s2;
 25a:	29 d0                	sub    %edx,%eax
}
 25c:	c3                   	ret    
    return *s1 - *s2;
 25d:	0f be 13             	movsbl (%ebx),%edx
 260:	31 c0                	xor    %eax,%eax
 262:	eb df                	jmp    243 <strcmp_custom+0x33>
 264:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 26f:	90                   	nop

00000270 <strncpy_custom>:
void strncpy_custom(char *dest, const char *src, int n) {
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	8b 4d 08             	mov    0x8(%ebp),%ecx
 277:	8b 7d 0c             	mov    0xc(%ebp),%edi
 27a:	56                   	push   %esi
 27b:	53                   	push   %ebx
 27c:	8b 5d 10             	mov    0x10(%ebp),%ebx
    for (i = 0; i < n && src[i] != '\0'; i++) {
 27f:	89 ce                	mov    %ecx,%esi
 281:	85 db                	test   %ebx,%ebx
 283:	7e 20                	jle    2a5 <strncpy_custom+0x35>
 285:	31 c0                	xor    %eax,%eax
 287:	eb 11                	jmp    29a <strncpy_custom+0x2a>
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        dest[i] = src[i];
 290:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    for (i = 0; i < n && src[i] != '\0'; i++) {
 293:	83 c0 01             	add    $0x1,%eax
 296:	39 c3                	cmp    %eax,%ebx
 298:	74 16                	je     2b0 <strncpy_custom+0x40>
 29a:	0f b6 14 07          	movzbl (%edi,%eax,1),%edx
 29e:	8d 34 01             	lea    (%ecx,%eax,1),%esi
 2a1:	84 d2                	test   %dl,%dl
 2a3:	75 eb                	jne    290 <strncpy_custom+0x20>
    dest[i] = '\0';
 2a5:	c6 06 00             	movb   $0x0,(%esi)
}
 2a8:	5b                   	pop    %ebx
 2a9:	5e                   	pop    %esi
 2aa:	5f                   	pop    %edi
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret    
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
    dest[i] = '\0';
 2b0:	8d 34 19             	lea    (%ecx,%ebx,1),%esi
 2b3:	c6 06 00             	movb   $0x0,(%esi)
}
 2b6:	5b                   	pop    %ebx
 2b7:	5e                   	pop    %esi
 2b8:	5f                   	pop    %edi
 2b9:	5d                   	pop    %ebp
 2ba:	c3                   	ret    
 2bb:	66 90                	xchg   %ax,%ax
 2bd:	66 90                	xchg   %ax,%ax
 2bf:	90                   	nop

000002c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 2c0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2c1:	31 c0                	xor    %eax,%eax
{
 2c3:	89 e5                	mov    %esp,%ebp
 2c5:	53                   	push   %ebx
 2c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 2cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 2d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 2d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 2d7:	83 c0 01             	add    $0x1,%eax
 2da:	84 d2                	test   %dl,%dl
 2dc:	75 f2                	jne    2d0 <strcpy+0x10>
    ;
  return os;
}
 2de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2e1:	89 c8                	mov    %ecx,%eax
 2e3:	c9                   	leave  
 2e4:	c3                   	ret    
 2e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	8b 55 08             	mov    0x8(%ebp),%edx
 2f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 2fa:	0f b6 02             	movzbl (%edx),%eax
 2fd:	84 c0                	test   %al,%al
 2ff:	75 17                	jne    318 <strcmp+0x28>
 301:	eb 3a                	jmp    33d <strcmp+0x4d>
 303:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 307:	90                   	nop
 308:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 30c:	83 c2 01             	add    $0x1,%edx
 30f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 312:	84 c0                	test   %al,%al
 314:	74 1a                	je     330 <strcmp+0x40>
    p++, q++;
 316:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 318:	0f b6 19             	movzbl (%ecx),%ebx
 31b:	38 c3                	cmp    %al,%bl
 31d:	74 e9                	je     308 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 31f:	29 d8                	sub    %ebx,%eax
}
 321:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 324:	c9                   	leave  
 325:	c3                   	ret    
 326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 330:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 334:	31 c0                	xor    %eax,%eax
 336:	29 d8                	sub    %ebx,%eax
}
 338:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 33b:	c9                   	leave  
 33c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 33d:	0f b6 19             	movzbl (%ecx),%ebx
 340:	31 c0                	xor    %eax,%eax
 342:	eb db                	jmp    31f <strcmp+0x2f>
 344:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop

00000350 <strlen>:

uint
strlen(const char *s)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 356:	80 3a 00             	cmpb   $0x0,(%edx)
 359:	74 15                	je     370 <strlen+0x20>
 35b:	31 c0                	xor    %eax,%eax
 35d:	8d 76 00             	lea    0x0(%esi),%esi
 360:	83 c0 01             	add    $0x1,%eax
 363:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 367:	89 c1                	mov    %eax,%ecx
 369:	75 f5                	jne    360 <strlen+0x10>
    ;
  return n;
}
 36b:	89 c8                	mov    %ecx,%eax
 36d:	5d                   	pop    %ebp
 36e:	c3                   	ret    
 36f:	90                   	nop
  for(n = 0; s[n]; n++)
 370:	31 c9                	xor    %ecx,%ecx
}
 372:	5d                   	pop    %ebp
 373:	89 c8                	mov    %ecx,%eax
 375:	c3                   	ret    
 376:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37d:	8d 76 00             	lea    0x0(%esi),%esi

00000380 <memset>:

void*
memset(void *dst, int c, uint n)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 387:	8b 4d 10             	mov    0x10(%ebp),%ecx
 38a:	8b 45 0c             	mov    0xc(%ebp),%eax
 38d:	89 d7                	mov    %edx,%edi
 38f:	fc                   	cld    
 390:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 392:	8b 7d fc             	mov    -0x4(%ebp),%edi
 395:	89 d0                	mov    %edx,%eax
 397:	c9                   	leave  
 398:	c3                   	ret    
 399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003a0 <strchr>:

char*
strchr(const char *s, char c)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	8b 45 08             	mov    0x8(%ebp),%eax
 3a6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3aa:	0f b6 10             	movzbl (%eax),%edx
 3ad:	84 d2                	test   %dl,%dl
 3af:	75 12                	jne    3c3 <strchr+0x23>
 3b1:	eb 1d                	jmp    3d0 <strchr+0x30>
 3b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3b7:	90                   	nop
 3b8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 3bc:	83 c0 01             	add    $0x1,%eax
 3bf:	84 d2                	test   %dl,%dl
 3c1:	74 0d                	je     3d0 <strchr+0x30>
    if(*s == c)
 3c3:	38 d1                	cmp    %dl,%cl
 3c5:	75 f1                	jne    3b8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 3c7:	5d                   	pop    %ebp
 3c8:	c3                   	ret    
 3c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 3d0:	31 c0                	xor    %eax,%eax
}
 3d2:	5d                   	pop    %ebp
 3d3:	c3                   	ret    
 3d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3df:	90                   	nop

000003e0 <gets>:

char*
gets(char *buf, int max)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 3e5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 3e8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 3e9:	31 db                	xor    %ebx,%ebx
{
 3eb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 3ee:	eb 27                	jmp    417 <gets+0x37>
    cc = read(0, &c, 1);
 3f0:	83 ec 04             	sub    $0x4,%esp
 3f3:	6a 01                	push   $0x1
 3f5:	57                   	push   %edi
 3f6:	6a 00                	push   $0x0
 3f8:	e8 2e 01 00 00       	call   52b <read>
    if(cc < 1)
 3fd:	83 c4 10             	add    $0x10,%esp
 400:	85 c0                	test   %eax,%eax
 402:	7e 1d                	jle    421 <gets+0x41>
      break;
    buf[i++] = c;
 404:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 408:	8b 55 08             	mov    0x8(%ebp),%edx
 40b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 40f:	3c 0a                	cmp    $0xa,%al
 411:	74 1d                	je     430 <gets+0x50>
 413:	3c 0d                	cmp    $0xd,%al
 415:	74 19                	je     430 <gets+0x50>
  for(i=0; i+1 < max; ){
 417:	89 de                	mov    %ebx,%esi
 419:	83 c3 01             	add    $0x1,%ebx
 41c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 41f:	7c cf                	jl     3f0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 421:	8b 45 08             	mov    0x8(%ebp),%eax
 424:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 428:	8d 65 f4             	lea    -0xc(%ebp),%esp
 42b:	5b                   	pop    %ebx
 42c:	5e                   	pop    %esi
 42d:	5f                   	pop    %edi
 42e:	5d                   	pop    %ebp
 42f:	c3                   	ret    
  buf[i] = '\0';
 430:	8b 45 08             	mov    0x8(%ebp),%eax
 433:	89 de                	mov    %ebx,%esi
 435:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 439:	8d 65 f4             	lea    -0xc(%ebp),%esp
 43c:	5b                   	pop    %ebx
 43d:	5e                   	pop    %esi
 43e:	5f                   	pop    %edi
 43f:	5d                   	pop    %ebp
 440:	c3                   	ret    
 441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 448:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44f:	90                   	nop

00000450 <stat>:

int
stat(const char *n, struct stat *st)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	56                   	push   %esi
 454:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 455:	83 ec 08             	sub    $0x8,%esp
 458:	6a 00                	push   $0x0
 45a:	ff 75 08             	push   0x8(%ebp)
 45d:	e8 f1 00 00 00       	call   553 <open>
  if(fd < 0)
 462:	83 c4 10             	add    $0x10,%esp
 465:	85 c0                	test   %eax,%eax
 467:	78 27                	js     490 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 469:	83 ec 08             	sub    $0x8,%esp
 46c:	ff 75 0c             	push   0xc(%ebp)
 46f:	89 c3                	mov    %eax,%ebx
 471:	50                   	push   %eax
 472:	e8 f4 00 00 00       	call   56b <fstat>
  close(fd);
 477:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 47a:	89 c6                	mov    %eax,%esi
  close(fd);
 47c:	e8 ba 00 00 00       	call   53b <close>
  return r;
 481:	83 c4 10             	add    $0x10,%esp
}
 484:	8d 65 f8             	lea    -0x8(%ebp),%esp
 487:	89 f0                	mov    %esi,%eax
 489:	5b                   	pop    %ebx
 48a:	5e                   	pop    %esi
 48b:	5d                   	pop    %ebp
 48c:	c3                   	ret    
 48d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 490:	be ff ff ff ff       	mov    $0xffffffff,%esi
 495:	eb ed                	jmp    484 <stat+0x34>
 497:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49e:	66 90                	xchg   %ax,%ax

000004a0 <atoi>:

int
atoi(const char *s)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	53                   	push   %ebx
 4a4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4a7:	0f be 02             	movsbl (%edx),%eax
 4aa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 4ad:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 4b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 4b5:	77 1e                	ja     4d5 <atoi+0x35>
 4b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4be:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 4c0:	83 c2 01             	add    $0x1,%edx
 4c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 4c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 4ca:	0f be 02             	movsbl (%edx),%eax
 4cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4d0:	80 fb 09             	cmp    $0x9,%bl
 4d3:	76 eb                	jbe    4c0 <atoi+0x20>
  return n;
}
 4d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4d8:	89 c8                	mov    %ecx,%eax
 4da:	c9                   	leave  
 4db:	c3                   	ret    
 4dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	8b 45 10             	mov    0x10(%ebp),%eax
 4e7:	8b 55 08             	mov    0x8(%ebp),%edx
 4ea:	56                   	push   %esi
 4eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4ee:	85 c0                	test   %eax,%eax
 4f0:	7e 13                	jle    505 <memmove+0x25>
 4f2:	01 d0                	add    %edx,%eax
  dst = vdst;
 4f4:	89 d7                	mov    %edx,%edi
 4f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 500:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 501:	39 f8                	cmp    %edi,%eax
 503:	75 fb                	jne    500 <memmove+0x20>
  return vdst;
}
 505:	5e                   	pop    %esi
 506:	89 d0                	mov    %edx,%eax
 508:	5f                   	pop    %edi
 509:	5d                   	pop    %ebp
 50a:	c3                   	ret    

0000050b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 50b:	b8 01 00 00 00       	mov    $0x1,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <exit>:
SYSCALL(exit)
 513:	b8 02 00 00 00       	mov    $0x2,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <wait>:
SYSCALL(wait)
 51b:	b8 03 00 00 00       	mov    $0x3,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <pipe>:
SYSCALL(pipe)
 523:	b8 04 00 00 00       	mov    $0x4,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <read>:
SYSCALL(read)
 52b:	b8 05 00 00 00       	mov    $0x5,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <write>:
SYSCALL(write)
 533:	b8 10 00 00 00       	mov    $0x10,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <close>:
SYSCALL(close)
 53b:	b8 15 00 00 00       	mov    $0x15,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <kill>:
SYSCALL(kill)
 543:	b8 06 00 00 00       	mov    $0x6,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <exec>:
SYSCALL(exec)
 54b:	b8 07 00 00 00       	mov    $0x7,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <open>:
SYSCALL(open)
 553:	b8 0f 00 00 00       	mov    $0xf,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <mknod>:
SYSCALL(mknod)
 55b:	b8 11 00 00 00       	mov    $0x11,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <unlink>:
SYSCALL(unlink)
 563:	b8 12 00 00 00       	mov    $0x12,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <fstat>:
SYSCALL(fstat)
 56b:	b8 08 00 00 00       	mov    $0x8,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <link>:
SYSCALL(link)
 573:	b8 13 00 00 00       	mov    $0x13,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <mkdir>:
SYSCALL(mkdir)
 57b:	b8 14 00 00 00       	mov    $0x14,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <chdir>:
SYSCALL(chdir)
 583:	b8 09 00 00 00       	mov    $0x9,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <dup>:
SYSCALL(dup)
 58b:	b8 0a 00 00 00       	mov    $0xa,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <getpid>:
SYSCALL(getpid)
 593:	b8 0b 00 00 00       	mov    $0xb,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <sbrk>:
SYSCALL(sbrk)
 59b:	b8 0c 00 00 00       	mov    $0xc,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <sleep>:
SYSCALL(sleep)
 5a3:	b8 0d 00 00 00       	mov    $0xd,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <uptime>:
SYSCALL(uptime)
 5ab:	b8 0e 00 00 00       	mov    $0xe,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <uniq>:
SYSCALL(uniq)
 5b3:	b8 16 00 00 00       	mov    $0x16,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <head>:
SYSCALL(head)
 5bb:	b8 17 00 00 00       	mov    $0x17,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    
 5c3:	66 90                	xchg   %ax,%ax
 5c5:	66 90                	xchg   %ax,%ax
 5c7:	66 90                	xchg   %ax,%ax
 5c9:	66 90                	xchg   %ax,%ax
 5cb:	66 90                	xchg   %ax,%ax
 5cd:	66 90                	xchg   %ax,%ax
 5cf:	90                   	nop

000005d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	57                   	push   %edi
 5d4:	56                   	push   %esi
 5d5:	53                   	push   %ebx
 5d6:	83 ec 3c             	sub    $0x3c,%esp
 5d9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5dc:	89 d1                	mov    %edx,%ecx
{
 5de:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5e1:	85 d2                	test   %edx,%edx
 5e3:	0f 89 7f 00 00 00    	jns    668 <printint+0x98>
 5e9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5ed:	74 79                	je     668 <printint+0x98>
    neg = 1;
 5ef:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 5f6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 5f8:	31 db                	xor    %ebx,%ebx
 5fa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 600:	89 c8                	mov    %ecx,%eax
 602:	31 d2                	xor    %edx,%edx
 604:	89 cf                	mov    %ecx,%edi
 606:	f7 75 c4             	divl   -0x3c(%ebp)
 609:	0f b6 92 60 0a 00 00 	movzbl 0xa60(%edx),%edx
 610:	89 45 c0             	mov    %eax,-0x40(%ebp)
 613:	89 d8                	mov    %ebx,%eax
 615:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 618:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 61b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 61e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 621:	76 dd                	jbe    600 <printint+0x30>
  if(neg)
 623:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 626:	85 c9                	test   %ecx,%ecx
 628:	74 0c                	je     636 <printint+0x66>
    buf[i++] = '-';
 62a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 62f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 631:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 636:	8b 7d b8             	mov    -0x48(%ebp),%edi
 639:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 63d:	eb 07                	jmp    646 <printint+0x76>
 63f:	90                   	nop
    putc(fd, buf[i]);
 640:	0f b6 13             	movzbl (%ebx),%edx
 643:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 646:	83 ec 04             	sub    $0x4,%esp
 649:	88 55 d7             	mov    %dl,-0x29(%ebp)
 64c:	6a 01                	push   $0x1
 64e:	56                   	push   %esi
 64f:	57                   	push   %edi
 650:	e8 de fe ff ff       	call   533 <write>
  while(--i >= 0)
 655:	83 c4 10             	add    $0x10,%esp
 658:	39 de                	cmp    %ebx,%esi
 65a:	75 e4                	jne    640 <printint+0x70>
}
 65c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 65f:	5b                   	pop    %ebx
 660:	5e                   	pop    %esi
 661:	5f                   	pop    %edi
 662:	5d                   	pop    %ebp
 663:	c3                   	ret    
 664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 668:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 66f:	eb 87                	jmp    5f8 <printint+0x28>
 671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 678:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67f:	90                   	nop

00000680 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	57                   	push   %edi
 684:	56                   	push   %esi
 685:	53                   	push   %ebx
 686:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 689:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 68c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 68f:	0f b6 13             	movzbl (%ebx),%edx
 692:	84 d2                	test   %dl,%dl
 694:	74 6a                	je     700 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 696:	8d 45 10             	lea    0x10(%ebp),%eax
 699:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 69c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 69f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 6a1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6a4:	eb 36                	jmp    6dc <printf+0x5c>
 6a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ad:	8d 76 00             	lea    0x0(%esi),%esi
 6b0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6b3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 6b8:	83 f8 25             	cmp    $0x25,%eax
 6bb:	74 15                	je     6d2 <printf+0x52>
  write(fd, &c, 1);
 6bd:	83 ec 04             	sub    $0x4,%esp
 6c0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6c3:	6a 01                	push   $0x1
 6c5:	57                   	push   %edi
 6c6:	56                   	push   %esi
 6c7:	e8 67 fe ff ff       	call   533 <write>
 6cc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 6cf:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6d2:	0f b6 13             	movzbl (%ebx),%edx
 6d5:	83 c3 01             	add    $0x1,%ebx
 6d8:	84 d2                	test   %dl,%dl
 6da:	74 24                	je     700 <printf+0x80>
    c = fmt[i] & 0xff;
 6dc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 6df:	85 c9                	test   %ecx,%ecx
 6e1:	74 cd                	je     6b0 <printf+0x30>
      }
    } else if(state == '%'){
 6e3:	83 f9 25             	cmp    $0x25,%ecx
 6e6:	75 ea                	jne    6d2 <printf+0x52>
      if(c == 'd'){
 6e8:	83 f8 25             	cmp    $0x25,%eax
 6eb:	0f 84 07 01 00 00    	je     7f8 <printf+0x178>
 6f1:	83 e8 63             	sub    $0x63,%eax
 6f4:	83 f8 15             	cmp    $0x15,%eax
 6f7:	77 17                	ja     710 <printf+0x90>
 6f9:	ff 24 85 08 0a 00 00 	jmp    *0xa08(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 700:	8d 65 f4             	lea    -0xc(%ebp),%esp
 703:	5b                   	pop    %ebx
 704:	5e                   	pop    %esi
 705:	5f                   	pop    %edi
 706:	5d                   	pop    %ebp
 707:	c3                   	ret    
 708:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 70f:	90                   	nop
  write(fd, &c, 1);
 710:	83 ec 04             	sub    $0x4,%esp
 713:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 716:	6a 01                	push   $0x1
 718:	57                   	push   %edi
 719:	56                   	push   %esi
 71a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 71e:	e8 10 fe ff ff       	call   533 <write>
        putc(fd, c);
 723:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 727:	83 c4 0c             	add    $0xc,%esp
 72a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 72d:	6a 01                	push   $0x1
 72f:	57                   	push   %edi
 730:	56                   	push   %esi
 731:	e8 fd fd ff ff       	call   533 <write>
        putc(fd, c);
 736:	83 c4 10             	add    $0x10,%esp
      state = 0;
 739:	31 c9                	xor    %ecx,%ecx
 73b:	eb 95                	jmp    6d2 <printf+0x52>
 73d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 740:	83 ec 0c             	sub    $0xc,%esp
 743:	b9 10 00 00 00       	mov    $0x10,%ecx
 748:	6a 00                	push   $0x0
 74a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 74d:	8b 10                	mov    (%eax),%edx
 74f:	89 f0                	mov    %esi,%eax
 751:	e8 7a fe ff ff       	call   5d0 <printint>
        ap++;
 756:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 75a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 75d:	31 c9                	xor    %ecx,%ecx
 75f:	e9 6e ff ff ff       	jmp    6d2 <printf+0x52>
 764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 768:	8b 45 d0             	mov    -0x30(%ebp),%eax
 76b:	8b 10                	mov    (%eax),%edx
        ap++;
 76d:	83 c0 04             	add    $0x4,%eax
 770:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 773:	85 d2                	test   %edx,%edx
 775:	0f 84 8d 00 00 00    	je     808 <printf+0x188>
        while(*s != 0){
 77b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 77e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 780:	84 c0                	test   %al,%al
 782:	0f 84 4a ff ff ff    	je     6d2 <printf+0x52>
 788:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 78b:	89 d3                	mov    %edx,%ebx
 78d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 790:	83 ec 04             	sub    $0x4,%esp
          s++;
 793:	83 c3 01             	add    $0x1,%ebx
 796:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 799:	6a 01                	push   $0x1
 79b:	57                   	push   %edi
 79c:	56                   	push   %esi
 79d:	e8 91 fd ff ff       	call   533 <write>
        while(*s != 0){
 7a2:	0f b6 03             	movzbl (%ebx),%eax
 7a5:	83 c4 10             	add    $0x10,%esp
 7a8:	84 c0                	test   %al,%al
 7aa:	75 e4                	jne    790 <printf+0x110>
      state = 0;
 7ac:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 7af:	31 c9                	xor    %ecx,%ecx
 7b1:	e9 1c ff ff ff       	jmp    6d2 <printf+0x52>
 7b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 7c0:	83 ec 0c             	sub    $0xc,%esp
 7c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7c8:	6a 01                	push   $0x1
 7ca:	e9 7b ff ff ff       	jmp    74a <printf+0xca>
 7cf:	90                   	nop
        putc(fd, *ap);
 7d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 7d3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 7d6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 7d8:	6a 01                	push   $0x1
 7da:	57                   	push   %edi
 7db:	56                   	push   %esi
        putc(fd, *ap);
 7dc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7df:	e8 4f fd ff ff       	call   533 <write>
        ap++;
 7e4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 7e8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7eb:	31 c9                	xor    %ecx,%ecx
 7ed:	e9 e0 fe ff ff       	jmp    6d2 <printf+0x52>
 7f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 7f8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 7fb:	83 ec 04             	sub    $0x4,%esp
 7fe:	e9 2a ff ff ff       	jmp    72d <printf+0xad>
 803:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 807:	90                   	nop
          s = "(null)";
 808:	ba 00 0a 00 00       	mov    $0xa00,%edx
        while(*s != 0){
 80d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 810:	b8 28 00 00 00       	mov    $0x28,%eax
 815:	89 d3                	mov    %edx,%ebx
 817:	e9 74 ff ff ff       	jmp    790 <printf+0x110>
 81c:	66 90                	xchg   %ax,%ax
 81e:	66 90                	xchg   %ax,%ax

00000820 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 820:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 821:	a1 cc 0d 00 00       	mov    0xdcc,%eax
{
 826:	89 e5                	mov    %esp,%ebp
 828:	57                   	push   %edi
 829:	56                   	push   %esi
 82a:	53                   	push   %ebx
 82b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 82e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 831:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 838:	89 c2                	mov    %eax,%edx
 83a:	8b 00                	mov    (%eax),%eax
 83c:	39 ca                	cmp    %ecx,%edx
 83e:	73 30                	jae    870 <free+0x50>
 840:	39 c1                	cmp    %eax,%ecx
 842:	72 04                	jb     848 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 844:	39 c2                	cmp    %eax,%edx
 846:	72 f0                	jb     838 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 848:	8b 73 fc             	mov    -0x4(%ebx),%esi
 84b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 84e:	39 f8                	cmp    %edi,%eax
 850:	74 30                	je     882 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 852:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 855:	8b 42 04             	mov    0x4(%edx),%eax
 858:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 85b:	39 f1                	cmp    %esi,%ecx
 85d:	74 3a                	je     899 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 85f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 861:	5b                   	pop    %ebx
  freep = p;
 862:	89 15 cc 0d 00 00    	mov    %edx,0xdcc
}
 868:	5e                   	pop    %esi
 869:	5f                   	pop    %edi
 86a:	5d                   	pop    %ebp
 86b:	c3                   	ret    
 86c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 870:	39 c2                	cmp    %eax,%edx
 872:	72 c4                	jb     838 <free+0x18>
 874:	39 c1                	cmp    %eax,%ecx
 876:	73 c0                	jae    838 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 878:	8b 73 fc             	mov    -0x4(%ebx),%esi
 87b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 87e:	39 f8                	cmp    %edi,%eax
 880:	75 d0                	jne    852 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 882:	03 70 04             	add    0x4(%eax),%esi
 885:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 888:	8b 02                	mov    (%edx),%eax
 88a:	8b 00                	mov    (%eax),%eax
 88c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 88f:	8b 42 04             	mov    0x4(%edx),%eax
 892:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 895:	39 f1                	cmp    %esi,%ecx
 897:	75 c6                	jne    85f <free+0x3f>
    p->s.size += bp->s.size;
 899:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 89c:	89 15 cc 0d 00 00    	mov    %edx,0xdcc
    p->s.size += bp->s.size;
 8a2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 8a5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 8a8:	89 0a                	mov    %ecx,(%edx)
}
 8aa:	5b                   	pop    %ebx
 8ab:	5e                   	pop    %esi
 8ac:	5f                   	pop    %edi
 8ad:	5d                   	pop    %ebp
 8ae:	c3                   	ret    
 8af:	90                   	nop

000008b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8b0:	55                   	push   %ebp
 8b1:	89 e5                	mov    %esp,%ebp
 8b3:	57                   	push   %edi
 8b4:	56                   	push   %esi
 8b5:	53                   	push   %ebx
 8b6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8bc:	8b 3d cc 0d 00 00    	mov    0xdcc,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8c2:	8d 70 07             	lea    0x7(%eax),%esi
 8c5:	c1 ee 03             	shr    $0x3,%esi
 8c8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 8cb:	85 ff                	test   %edi,%edi
 8cd:	0f 84 9d 00 00 00    	je     970 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 8d5:	8b 4a 04             	mov    0x4(%edx),%ecx
 8d8:	39 f1                	cmp    %esi,%ecx
 8da:	73 6a                	jae    946 <malloc+0x96>
 8dc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8e1:	39 de                	cmp    %ebx,%esi
 8e3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 8e6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8f0:	eb 17                	jmp    909 <malloc+0x59>
 8f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8fa:	8b 48 04             	mov    0x4(%eax),%ecx
 8fd:	39 f1                	cmp    %esi,%ecx
 8ff:	73 4f                	jae    950 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 901:	8b 3d cc 0d 00 00    	mov    0xdcc,%edi
 907:	89 c2                	mov    %eax,%edx
 909:	39 d7                	cmp    %edx,%edi
 90b:	75 eb                	jne    8f8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 90d:	83 ec 0c             	sub    $0xc,%esp
 910:	ff 75 e4             	push   -0x1c(%ebp)
 913:	e8 83 fc ff ff       	call   59b <sbrk>
  if(p == (char*)-1)
 918:	83 c4 10             	add    $0x10,%esp
 91b:	83 f8 ff             	cmp    $0xffffffff,%eax
 91e:	74 1c                	je     93c <malloc+0x8c>
  hp->s.size = nu;
 920:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 923:	83 ec 0c             	sub    $0xc,%esp
 926:	83 c0 08             	add    $0x8,%eax
 929:	50                   	push   %eax
 92a:	e8 f1 fe ff ff       	call   820 <free>
  return freep;
 92f:	8b 15 cc 0d 00 00    	mov    0xdcc,%edx
      if((p = morecore(nunits)) == 0)
 935:	83 c4 10             	add    $0x10,%esp
 938:	85 d2                	test   %edx,%edx
 93a:	75 bc                	jne    8f8 <malloc+0x48>
        return 0;
  }
}
 93c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 93f:	31 c0                	xor    %eax,%eax
}
 941:	5b                   	pop    %ebx
 942:	5e                   	pop    %esi
 943:	5f                   	pop    %edi
 944:	5d                   	pop    %ebp
 945:	c3                   	ret    
    if(p->s.size >= nunits){
 946:	89 d0                	mov    %edx,%eax
 948:	89 fa                	mov    %edi,%edx
 94a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 950:	39 ce                	cmp    %ecx,%esi
 952:	74 4c                	je     9a0 <malloc+0xf0>
        p->s.size -= nunits;
 954:	29 f1                	sub    %esi,%ecx
 956:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 959:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 95c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 95f:	89 15 cc 0d 00 00    	mov    %edx,0xdcc
}
 965:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 968:	83 c0 08             	add    $0x8,%eax
}
 96b:	5b                   	pop    %ebx
 96c:	5e                   	pop    %esi
 96d:	5f                   	pop    %edi
 96e:	5d                   	pop    %ebp
 96f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 970:	c7 05 cc 0d 00 00 d0 	movl   $0xdd0,0xdcc
 977:	0d 00 00 
    base.s.size = 0;
 97a:	bf d0 0d 00 00       	mov    $0xdd0,%edi
    base.s.ptr = freep = prevp = &base;
 97f:	c7 05 d0 0d 00 00 d0 	movl   $0xdd0,0xdd0
 986:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 989:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 98b:	c7 05 d4 0d 00 00 00 	movl   $0x0,0xdd4
 992:	00 00 00 
    if(p->s.size >= nunits){
 995:	e9 42 ff ff ff       	jmp    8dc <malloc+0x2c>
 99a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 9a0:	8b 08                	mov    (%eax),%ecx
 9a2:	89 0a                	mov    %ecx,(%edx)
 9a4:	eb b9                	jmp    95f <malloc+0xaf>
