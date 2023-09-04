set(CPU_ARCH "aarch64" CACHE STRING "cpu architecture")
set(MACHINE "linux" CACHE STRING "system machine name")
set(CLIB "gnu" CACHE STRING "c library")

set(CMAKE_SYSTEM_NAME "Linux")
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR ${CPU_ARCH})

if (CLIB) 
    set(CMAKE_C_COMPILER "zig" cc -target ${CPU_ARCH}-${MACHINE}-${CLIB})
    set(CMAKE_CXX_COMPILER "zig" c++ -target ${CPU_ARCH}-${MACHINE}-${CLIB})
else()
    set(CMAKE_C_COMPILER "zig" cc -target ${CPU_ARCH}-${MACHINE})
    set(CMAKE_CXX_COMPILER "zig" c++ -target ${CPU_ARCH}-${MACHINE})
endif(CLIB)

set(SCRIPT_SUFFIX ".sh")

set(CMAKE_AR "${CMAKE_CURRENT_LIST_DIR}/zig-ar${SCRIPT_SUFFIX}")
set(CMAKE_RANLIB "${CMAKE_CURRENT_LIST_DIR}/zig-ranlib${SCRIPT_SUFFIX}")
