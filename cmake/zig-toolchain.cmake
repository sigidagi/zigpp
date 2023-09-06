#set(CPU_ARCH "aarch64" CACHE STRING "cpu architecture")
#set(MACHINE "linux" CACHE STRING "system machine name")
#set(CLIB "gnu" CACHE STRING "c library")

set(CMAKE_SYSTEM_NAME "Linux")
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR ${CPU_ARCH})
set(BIN ${CMAKE_SOURCE_DIR}/bin)

find_program(ZIG_EXE NAMES zig 
    PATHS ${CMAKE_SOURCE_DIR}/bin
    )

set(BIN $ENV{HOME}/.local/bin)
message(STATUS "home bin dir: ${BIN}")

if(NOT ZIG_EXE)
    #message(FATAL_ERROR "zig not found! Download from: https://ziglang.org/download/")
    message(STATUS "zig not found - downloading from: 'https://ziglang.org/download/'")
    set(ZIG "zig")

    include(FetchContent)
    FetchContent_Declare(
        ${ZIG} 
        URL https://ziglang.org/download/0.11.0/zig-linux-x86_64-0.11.0.tar.xz
        URL_HASH MD5=7cc7421bc69470eea31c5f15dba37850
        OVERRIDE_FIND_PACKAGE
    )

    FetchContent_MakeAvailable(${ZIG})
    message(STATUS "zig source: ${zig_SOURCE_DIR}")
    
    #file(MAKE_DIRECTORY ${BIN})

    file(COPY ${zig_SOURCE_DIR}/zig DESTINATION ${BIN})
    file(COPY ${zig_SOURCE_DIR}/lib DESTINATION ${BIN})
    file(COPY ${zig_SOURCE_DIR}/doc DESTINATION ${BIN})
    file(COPY ${CMAKE_CURRENT_LIST_DIR}/zig-cc DESTINATION ${BIN})
    file(COPY ${CMAKE_CURRENT_LIST_DIR}/zig-c++ DESTINATION ${BIN})
    file(COPY ${CMAKE_CURRENT_LIST_DIR}/zig-ar DESTINATION ${BIN})
    file(COPY ${CMAKE_CURRENT_LIST_DIR}/zig-ranlib DESTINATION ${BIN})

    execute_process (COMMAND bash -c "export PATH=${PATH}:" OUTPUT_VARIABLE outVar)

endif()

message(STATUS "Build for target: ${CPU_ARCH}-${MACHINE}-${CLIB}")

if (CLIB) 
    set(CMAKE_C_COMPILER "${BIN}/zig-cc" -target ${CPU_ARCH}-${MACHINE}-${CLIB})
    set(CMAKE_CXX_COMPILER "${BIN}/zig-c++" -target ${CPU_ARCH}-${MACHINE}-${CLIB})
else()
    set(CMAKE_C_COMPILER "${BIN}/zig-cc" -target ${CPU_ARCH}-${MACHINE})
    set(CMAKE_CXX_COMPILER "${BIN}/zig-c++" -target ${CPU_ARCH}-${MACHINE})
endif(CLIB)

#set(CMAKE_AR "${CMAKE_CURRENT_LIST_DIR}/zig-ar")
set(CMAKE_AR "${BIN}/zig-ar")
set(CMAKE_RANLIB "${BIN}/zig-ranlib")
