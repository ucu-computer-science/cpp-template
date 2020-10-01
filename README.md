# Lab 2 Option 3: Adder

## Team

 - [Volodymyr Chernetskyi](https://github.com/chernetskyi)

## Prerequisites

 - **C++ compiler** - needs to support **C++17** standard
 - **CMake** 3.15+
 
The rest prerequisites (such as development libraries) can be found in the [packages file](./apt_packages.txt) in the form of the apt package manager package names.

## Installing

1. Clone the project.
    ```bash
    git clone git@github.com:chernetskyi/cpp-template.git
    ```
2. Install required packages. On Ubuntu:
   ```bash
   [[ -r apt_packages.txt ]] && sed 's/\r$//' apt_packages.txt | sed 's/#.*//' | xargs sudo apt-get install -y
   ```
3. Build.
    ```bash
    cmake -Bbuild
    cmake --build build
    ```

## Usage

```bash
add [a] [b]
```

If less than two numbers provided, zeroes are used instead. If more - an error occurs.

Help flags `-h`/`--help` support is available.
