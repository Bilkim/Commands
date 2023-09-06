#include "types.h"
#include "user.h"
#include "fcntl.h"

#define DEFAULT_LINES 14
#define BUF_SIZE 512

void print_head(int fd, int lines_to_read) {
    char buf[BUF_SIZE];
    int line_count = 0;
    int i, start;

    int bytes_read;
    while ((bytes_read = read(fd, buf, sizeof(buf))) > 0) {
        start = 0;
        for (i = 0; i < bytes_read; i++) {
            if (buf[i] == '\n') {
                line_count++;
                if (line_count == lines_to_read) {
                    write(1, buf + start, i - start + 1);
                    return;
                }
            }
            if (i == bytes_read - 1) {
                write(1, buf + start, i - start + 1);
            }
        }
    }
}

int main(int argc, char *argv[]) {
    int lines_to_read = DEFAULT_LINES;

    printf(1, "Head command is getting executed in user mode.\n");

    if (argc > 1) {
        if (argv[1][0] == '-') {
            lines_to_read = atoi(argv[1] + 1);
            if(argc == 2){
                printf(1, "Enter text (CTRL-D to end):\n");
                print_head(0, lines_to_read); 
            } else {
                for (int j = 2; j < argc && j < 4; j++) {
                    if (j > 2) {
                        printf(1, "\n");
                    }
                    int fd = open(argv[j], O_RDONLY);
                    if (fd < 0) {
                        printf(2, "head: cannot open file %s\n", argv[j]);
                        exit();
                    }
                    printf(1, "==> %s <==\n", argv[j]);
                    print_head(fd, lines_to_read);
                    close(fd);
                }
            }
        } else {
            for (int j = 1; j < argc && j < 3; j++) {
                if (j > 1) {
                    printf(1, "\n");
                }
                int fd = open(argv[j], O_RDONLY);
                if (fd < 0) {
                    printf(2, "head: cannot open file %s\n", argv[j]);
                    exit();
                }
                printf(1, "==> %s <==\n", argv[j]);
                print_head(fd, lines_to_read);
                close(fd);
            }
        }
    } else {
        printf(1, "Enter text (CTRL-D to end):\n");
        print_head(0, lines_to_read); 
    }

    // Execute the kernel mode head
    if (argc > 1) {
        head(argv[1], O_RDONLY);  // Assuming the syscall is named "head" and takes a file path as an argument
    } else {
        printf(2, "Please provide a file path for kernel mode execution.\n");
    }

    exit();
}

