CC = gcc
CFLAGS = -Wall -Wextra -Iinclude -std=c11

TARGET = assistant
SOURCES = src/main.c src/process_manager.c
HEADERS = include/assistant.h

all: $(TARGET)

$(TARGET): $(SOURCES) $(HEADERS)
	$(CC) $(CFLAGS) $(SOURCES) -o $(TARGET)

clean:
	rm -f $(TARGET)

.PHONY: all clean
