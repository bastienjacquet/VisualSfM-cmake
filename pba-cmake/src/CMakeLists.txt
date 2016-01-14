CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
# FindCUDA required cmake version 2.8

# Author : Pierre Moulon pmoulon@gmail.com
# http://imagine.enpc.fr/~moulonp/
# Date : May 2011.
# README :

PROJECT(PBA)

set (DEPENDENCIES pba-downloadcode)
#Searching CUDA
FIND_PACKAGE(CUDA)
if (CUDA_FOUND) 
  MESSAGE("CUDA FOUND")
else (CUDA_FOUND)
  MESSAGE("CUDA NOT FOUND. Cuda MCBA will not be compiled")
endif (CUDA_FOUND)

set (CMAKE_CXX_FLAGS   "${CMAKE_CXX_FLAGS} -fpermissive")
IF(CMAKE_COMPILER_IS_GNUCXX)
  SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC -O2 -Wall -Wno-deprecated -pthread")
  #Setup here your compilation flags depending of your platform
  SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native -mfpmath=sse")
  #SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=core2 -mfpmath=sse")
ENDIF(CMAKE_COMPILER_IS_GNUCXX)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

include_directories(.
                    ./pba)
ADD_SUBDIRECTORY(driver)
ADD_SUBDIRECTORY(pba)
