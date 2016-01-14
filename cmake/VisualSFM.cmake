
#set (DEPENDENCIES)
#set (EXTRA_CMAKE_ARGS)

#set_property (DIRECTORY PROPERTY EP_BASE Dependencies)

list (APPEND DEPENDENCIES vsfm-downloadcode)

# Download and patch pba code
ExternalProject_Add(vsfm-downloadcode
    PREFIX            ${CMAKE_SOURCE_DIR}
    TMP_DIR           ${CMAKE_SOURCE_DIR}/temp
    STAMP_DIR         ${CMAKE_SOURCE_DIR}/stamp
    #--Download step--------------
    DOWNLOAD_DIR      ${CMAKE_SOURCE_DIR}/download
    URL               http://ccwu.me/vsfm/download/VisualSFM_linux_64bit.zip
    URL_HASH          MD5=25fcca5e320a9e97131e87abdf3b7f61
    TIMEOUT 30
    #--Update/Patch step----------
    UPDATE_COMMAND    ""
    #PATCH_COMMAND patch -p0 --binary -N -i ${CMAKE_CURRENT_SOURCE_DIR}/src/pba/SparseBundleCPU.patch
    #--Configure step-------------
    SOURCE_DIR        ${CMAKE_SOURCE_DIR}/vsfm
    CONFIGURE_COMMAND ""
    BUILD_IN_SOURCE 1
    BUILD_COMMAND "make"
    #--Install step---------------
    INSTALL_COMMAND   ""
)
#941ce8f06c83b31d40291dcf782776f7  ../VisualSFM_linux_32bit.zip
#25fcca5e320a9e97131e87abdf3b7f61  ../VisualSFM_linux_64bit.zip
#c76e52d1538acc46247b19d20947a8a1  ../VisualSFM_osx_32bit.zip
#8368fb5cd586b5820768f192cb438f60  ../VisualSFM_osx_64bit.zip
#c67c201f71524f4908358840e2b4da3d  ../VisualSFM_windows_32bit.zip
#072afc6e7d73caaa0290e3031e52a016  ../VisualSFM_windows_64bit.zip
#9622df55d3aa06421833df35afc21707  ../VisualSFM_windows_cuda_32bit.zip
#09b64a9b8d6d88d881fc2b647c81b425  ../VisualSFM_windows_cuda_64bit.zip

