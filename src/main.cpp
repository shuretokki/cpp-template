#include <string>
#include <print>
#include "spdlog/spdlog.h"

int main() {
    std::string compiler =
#ifdef __clang__
            "Clang " __clang_version__;
#else
            "GCC " __VERSION__;
#endif

    spdlog::info("{}", compiler);
    return 0;
}
