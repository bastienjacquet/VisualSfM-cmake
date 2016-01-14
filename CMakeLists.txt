cmake_minimum_required(VERSION 2.8)
# ExternalProject required cmake version 2.8
# Author : Bastien Jacquet bastien.jacquet@kitware.com
# Date : Jan 2016.
# README : gcc version >= 4.7 required for SparseBundleCPU
#          gcc version < 4.9 required for CUDA 6.0 nvcc

# Handle superbuild first
option (USE_SUPERBUILD "Whether a superbuild should be invoked" ON)
set(PBA_SOURCE_DIR parallelBA)

if (USE_SUPERBUILD)
  project (SUPERBUILD NONE)
  include(ExternalProject)
  # execute the superbuild (this script will be invoked again without the
  # USE_SUPERBUILD option this time)
  include (cmake/SiftGPU.cmake)
  include (cmake/ParallelBA.cmake)
  include (cmake/VisualSFM.cmake)
  include (cmake/SuperBuild.cmake)
  return()                      # stop processing this file further
else()
  ADD_SUBDIRECTORY(${PBA_SOURCE_DIR}/src)
  #ADD_SUBDIRECTORY(vsfm)
  #ADD_SUBDIRECTORY(SiftGPU)
endif()


