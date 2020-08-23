# Adder
> adding two integers never was this easy

## Getting started

### Prerequisites

 - **C++ compiler** - needs to support **C++20** standard
 - **CMake** 3.15+

The rest prerequisites (such as development libraries) can be found in the [requirements file](./requirements.txt)

### Installing

1. Clone the project.
    ```bash
    git clone git@github.com:chernetskyi/cpp-template.git
    ```
2. Install required libraries. On Ubuntu:
    ```bash
    sed 's/\r$//' requirements.txt | sed 's/#.*//' | xargs sudo apt-get install -y
    ```
3. Build.
    ```bash
    mkdir build && cd build
    cmake -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=Release .. && make
    ```

### Usage

```bash
add [a] [b]
```

If less than two numbers provided, zeroes are used instead. If more - an error occurs.

Help flags `-h`/`--help` support is available.

## Team

 - [Volodymyr Chernetskyi](https://github.com/chernetskyi)
