cmake_minimum_required(VERSION 2.6)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake_modules")

project(ccl)
set(CMAKE_ECLIPSE_VERSION 4.5.2)

include(PlatformSpecificSupport)
#include(UseCppUTest)

# Export no symbols by default (if the compiler supports it).
# This makes e.g. GCC's "visibility behavior" consistent with MSVC's. 
# On Windows/MSVC this is a noop.
set(CMAKE_C_VISIBILITY_PRESET hidden)
set(CMAKE_CXX_VISIBILITY_PRESET hidden)

if(CMAKE_COMPILER_IS_GNUCXX)
    set(CMAKE_C_FLAGS "-Wall -Wno-pointer-sign -Werror")
endif()

if(UNIX)
    add_definitions(-DUNIX)
endif()

enable_language(C)

#enable_unit_testing()

# The version number
set(project_name_VERSION_MAJOR 0)
set(project_name_VERSION_MINOR 1)

# output directories
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)

include_directories(include)
include_directories(${PROJECT_BINARY_DIR}) # for generated headers

set(CCL_SOURCES
    src/bitstrings.c
    src/bloom.c
    src/buffer.c
    src/deque.c
    src/dictionary.c
    src/dlist.c
    src/doubledlist.c
    src/doublelist.c
    src/error.c
    src/fgetline.c
    src/generic.c
    src/hashtable.c
    src/heap.c
    src/iMask.c
    src/intdlist.c
    src/intlist.c
    src/list.c
    src/longlongdlist.c
    src/longlonglist.c
    src/malloc_debug.c
    src/memorymanager.c
    src/observer.c
    src/pool.c
    src/pooldebug.c
    src/priorityqueue.c
    src/qsortex.c
    src/qsort_r.c
    src/queue.c
    src/redblacktree.c
    src/scapegoat.c
    src/searchtree.c
    src/sequential.c
    src/smallpool.c
    src/strcollection.c
    src/stringlist.c
    src/SuffixTree.c
    src/valarraydouble.c
    src/valarrayfloat.c
    src/valarrayint.c
    src/valarraylongdouble.c
    src/valarraylonglong.c
    src/valarrayshort.c
    src/valarraysize_t.c
    src/valarrayuint.c
    src/valarrayulonglong.c
    src/vector.c
    src/vectorsize_t.c
    src/wdictionary.c
    src/wstrcollection.c
    src/wstringlist.c
    )

set(CCL_HEADERS
    include/containers.h
    )

include(GenerateExportHeader)

add_library(ccl SHARED ${CCL_SOURCES})
GENERATE_EXPORT_HEADER(ccl)
set_target_properties(ccl PROPERTIES SOVERSION ${VERSION_MAJOR} VERSION ${VERSION_STRING})

add_executable(dotest tests/test.c)
target_link_libraries(dotest ccl)
if (UNIX)
    target_link_libraries(dotest m)
endif()

install(FILES ${CCL_HEADERS} ${PROJECT_BINARY_DIR}/ccl_export.h DESTINATION include/ccl)
install(TARGETS ccl DESTINATION lib)
install(TARGETS dotest DESTINATION bin)
