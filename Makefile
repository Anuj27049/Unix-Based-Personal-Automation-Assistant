
CC = gcc
CXX = g++

CFLAGS = -Wall -Wextra -Iinclude -std=c11
CXXFLAGS = -Wall -Wextra -Iinclude -std=c++17

TARGET = assistant

C_OBJECTS = src/process_manager.o
CPP_OBJECTS = src/main.o src/modules.o

all: $(TARGET)

$(TARGET): $(C_OBJECTS) $(CPP_OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o $@

src/process_manager.o: src/process_manager.c include/assistant.h
	$(CC) $(CFLAGS) -c $< -o $@

src/main.o: src/main.cpp include/modules.hpp include/automation_module.hpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

src/modules.o: src/modules.cpp include/modules.hpp include/automation_module.hpp include/assistant.h
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) src/*.o

.PHONY: all clean

