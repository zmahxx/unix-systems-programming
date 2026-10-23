// assign4.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>
#include "assign4.h"

// Maximize clarity, minimize clutter
static void launch_command(const char *cmd_str, pid_t *pid_list, int index);
static void tokenize(char *line, char **args);

// Trim leading/trailing spaces in-place
void trim_whitespace(char *str) {
    if (!str) return;

    // Trim leading
    while (*str == ' ') str++;

    // Shift left
    size_t len = strlen(str);
    memmove(str - (str - str), str, len + 1);

    // Trim trailing
    char *end = str + strlen(str) - 1;
    while (end > str && *end == ' ') end--;
    *(end + 1) = '\0';
}

// Main driver
int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s \"cmd1 , cmd2 , ...\"\n", argv[0]);
        return EXIT_FAILURE;
    }

    char *commands[MAX_COMMANDS] = { NULL };
    int total_cmds = 0;

    char *input = strtok(argv[1], ",");
    while (input && total_cmds < MAX_COMMANDS) {
        trim_whitespace(input);
        commands[total_cmds++] = input;
        input = strtok(NULL, ",");
    }

    pid_t pids[MAX_COMMANDS];

    for (int i = 0; i < total_cmds; ++i) {
        launch_command(commands[i], pids, i);
    }

    for (int i = 0; i < total_cmds; ++i) {
        waitpid(pids[i], NULL, 0);
    }

    return EXIT_SUCCESS;
}

// Fork and exec one command
static void launch_command(const char *cmd_str, pid_t *pid_list, int index) {
    char cmd_buf[256];
    strncpy(cmd_buf, cmd_str, sizeof(cmd_buf) - 1);
    cmd_buf[255] = '\0';

    char *args[MAX_ARGS];
    tokenize(cmd_buf, args);

    pid_t pid = fork();
    if (pid < 0) {
        perror("fork failed");
        exit(EXIT_FAILURE);
    } else if (pid == 0) {
        fprintf(stderr, "PID: %d, PPID: %d, CMD: %s\n", getpid(), getppid(), args[0]);
        execvp(args[0], args);
        perror("execvp failed");
        exit(EXIT_FAILURE);
    } else {
        pid_list[index] = pid;
    }
}

// Split command string into arguments
static void tokenize(char *line, char **args) {
    int i = 0;
    char *token = strtok(line, " ");
    while (token && i < MAX_ARGS - 1) {
        args[i++] = token;
        token = strtok(NULL, " ");
    }
    args[i] = NULL;
}

