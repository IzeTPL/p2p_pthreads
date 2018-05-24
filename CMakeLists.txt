cmake_minimum_required(VERSION 3.10)
project(p2p)
find_package(Threads)

add_executable(p2p p2p.c)
target_link_libraries (p2p ${CMAKE_THREAD_LIBS_INIT})