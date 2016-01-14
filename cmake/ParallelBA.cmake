
#set (DEPENDENCIES)
#set (EXTRA_CMAKE_ARGS)

#set_property (DIRECTORY PROPERTY EP_BASE Dependencies)
set(PBA_CMAKE_DIR pba-cmake)
list (APPEND DEPENDENCIES pba-downloadcode)
# Download and patch pba code
ExternalProject_Add(pba-downloadcode
    PREFIX            ${CMAKE_SOURCE_DIR}
    TMP_DIR           ${CMAKE_SOURCE_DIR}/temp
    STAMP_DIR         ${CMAKE_SOURCE_DIR}/stamp
    #--Download step--------------
    DOWNLOAD_DIR      ${CMAKE_SOURCE_DIR}/download
    URL               http://grail.cs.washington.edu/projects/mcba/pba_v1.0.5.zip
    URL_HASH          MD5=672f5cd6c1b4c08517409809b819c547
    TIMEOUT 30
    #--Update/Patch step----------
    UPDATE_COMMAND    ""
    PATCH_COMMAND patch -p0 --binary -N -i ${CMAKE_CURRENT_SOURCE_DIR}/${PBA_CMAKE_DIR}/src/pba/SparseBundleCPU.patch
    #--Configure step-------------
    SOURCE_DIR        ${CMAKE_SOURCE_DIR}/${PBA_SOURCE_DIR}
    CONFIGURE_COMMAND ""
    BUILD_IN_SOURCE 1
    BUILD_COMMAND ""
    #--Install step---------------
    INSTALL_COMMAND   ""
)

ExternalProject_Add_Step(pba-downloadcode moving_files # Names of project and custom step
  COMMAND cp -r ${PBA_CMAKE_DIR}/src  ${PBA_SOURCE_DIR}
  #COMMAND rm -rf source
  COMMENT "Copying CMakeFiles to download sources ..."     # Text printed when step executes
  DEPENDEES install
  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR} # Working directory for command
  )

