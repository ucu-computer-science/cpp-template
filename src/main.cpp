// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com

// Remember to include ALL the necessary headers!
#include <iostream>
#include <boost/program_options.hpp>

// By convention, C++ header files use the `.hpp` extension. `.h` is OK too.
#include "arithmetic/arithmetic.hpp"

int main(int argc, char **argv) {
    int variable_a, variable_b;

    namespace po = boost::program_options;

    po::options_description visible("Supported options");
    visible.add_options()
            ("help,h", "Print this help message.");

    po::options_description hidden("Hidden options");
    hidden.add_options()
            ("a", po::value<int>(&variable_a)->default_value(0), "Variable A.")
            ("b", po::value<int>(&variable_b)->default_value(0), "Variable B.");

    po::positional_options_description p;
    p.add("a", 1);
    p.add("b", 1);

    po::options_description all("All options");
    all.add(visible).add(hidden);

    po::variables_map vm;
    po::store(po::command_line_parser(argc, argv).options(all).positional(p).run(), vm);
    po::notify(vm);

    if (vm.count("help")) {
        std::cout << "Usage:\n  add [a] [b]\n" << visible << std::endl;
        return EXIT_SUCCESS;
    }

    int result = arithmetic::add(variable_a, variable_b);
    std::cout << result << std::endl;
    return EXIT_SUCCESS;
}
