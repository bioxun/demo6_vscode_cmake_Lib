
# C++ CMake Demo Project

A complete C++ project demonstrating modern CMake usage with executable and library targets.

## Project Structure
```
cpp-cmake-demo/
├── CMakeLists.txt
├── README.md
├── .gitignore
├── src/
│   └── main.cpp
├── include/
│   └── math_utils.h
└── lib/
    └── math_utils.cpp
```

## Features
- **MathUtils Library**: Static library providing mathematical functions
- **Main Application**: Executable demonstrating library usage
- **Modern CMake**: Clean, target-based CMake configuration
- **Cross-platform**: Compatible with Windows, Linux, and macOS

## Build Instructions

### Prerequisites
- CMake 3.10 or higher
- C++17 compatible compiler

### Build Steps
```bash
# Configure project
cmake -B build -S .

# Build project
cmake --build build

# Run executable
./build/main_app
```

## License
MIT License
