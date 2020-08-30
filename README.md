# Lab 2 Option 3: Adder

## Team

 - [Volodymyr Chernetskyi](https://github.com/chernetskyi)

## Prerequisites

 - **C++ compiler** - needs to support **C++17** standard
 - **CMake** 3.15+
 - **Conan** package manager

## Installing

1. Clone the project.
    ```bash
    git clone git@github.com:chernetskyi/cpp-template.git
    ```
3. Build.
    ```bash
    cmake -G"Unix Makefiles" -Bbuild
    cmake --build build
    ```

## Usage

```bash
add [a] [b]
```

If less than two numbers provided, zeroes are used instead. If more - an error occurs.

Help flags `-h`/`--help` support is available.
