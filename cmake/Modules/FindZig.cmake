find_program(ZIG_EXE NAMES zig 
    PATHS ${CMAKE_SOURCE_DIR}/bin
    )

if(NOT ZIG_EXE)
    message(FATAL_ERROR "zig not found! Download from: https://ziglang.org/download/")
endif()
