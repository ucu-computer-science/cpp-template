# Lab 2 Option 3: Adder

## Team

 - [Volodymyr Chernetskyi](https://github.com/chernetskyi)

## Prerequisites

 - **C++ compiler** - needs to support **C++17** standard
 - **CMake** 3.15+
 
Dependencies (such as development libraries) can be found in the [dependencies folder](./dependencies) in the form of the text files with package names for different package managers.

## Installing

1. Clone the project.
    ```bash
    git clone git@github.com:chernetskyi/cpp-template.git
    ```
2. Install required packages.

   On Ubuntu:
   ```bash
   [[ -r dependencies/apt.txt ]] && sed 's/#.*//' dependencies/apt.txt | xargs sudo apt-get install -y
   ```
   On MacOS:
   ```bash
   [[ -r dependencies/homebrew.txt ]] && sed 's/#.*//' dependencies/homebrew.txt | xargs brew install
   ```
   Use Conan on Windows.
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
