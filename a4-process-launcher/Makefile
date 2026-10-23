# Makefile for assign4
CC = gcc
CFLAGS = -g -Wall
TARGET = assign4
OBJS = assign4.o

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

assign4.o: assign4.c assign4.h

clean:
	rm -f $(OBJS) $(TARGET)

