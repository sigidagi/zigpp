find_program(ZIG_EXE NAMES zig 
    PATHS 
    /usr/local/bin
    $ENV(HOME)/bin
    )

#$ENV(${HOME})/.local/bin 
#    $ENV(${HOME}) 

if(NOT ZIG_EXE)
    message(FATAL_ERROR "zig not found! Download from: https://ziglang.org/download/")
endif()
