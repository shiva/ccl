# libccl : A container library for C

[![Travis Build Status](https://travis-ci.org/shiva/ccl.svg?branch=cmake-support)](https://travis-ci.org/shiva/ccl)
[![Appveyor Build status](https://ci.appveyor.com/api/projects/status/as58vdw92g1ka6gf?svg=true)](https://ci.appveyor.com/project/shiva/ccl)
[![Gitter](https://badges.gitter.im/shiva/ccl.svg)](https://gitter.im/shiva/ccl?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

Jacob Navia created a [container library for C][0]. The library provides a framework for containers in C, and implements several common and some uncommon container types.  This repo is forked from Jacob Navia's [repo][0] to continue implementing a portable build system using CMake and to write cpputest based tests. There is extensive documentation provided to describe the [design of libccl][1].

This branch contains a version of libccl built using cmake. The goal is to provide a set of unit-tests and a build system that is cross-platform capable of compiling libccl to multiple platforms. 
A git submodule is used to provide some useful cmake modules. Currently only *nix variants and MacOSX is supported.

## Compiling

To compile ccl, checkout this repo, initialize submodules and build, by executing the following commands

    # git submodule update --init --recursive
    # mkdir build
    # cd build
    # cmake ../

Currently, compilation works on Linux and OSX. Support for windows is underway.

#### Generating Eclipse project

Note: build directory should be a sibling of where ccl is checked out. Eclipse doesn't like out-of-source builds that is a child of the source directory

    # git clone https://github.com/shiva/ccl.git ccl
    # cd ccl && git submodule update --init --recursive
    # cd ..
    # mkdir build && cd build
    # cmake -G"Eclipse CDT4 - Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug ../ccl/

## Contributing

If you would like to provide support, please reach out to me. There are several next steps I have in mind, and would like to have a conversation.

[0]: https://github.com/jacob-navia/ccl
[1]: https://www.cs.virginia.edu/~lcc-win32/ccl/ccl.html

