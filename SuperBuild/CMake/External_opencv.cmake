if(NOT __EXTERNAL_OPENCV__)
set(__EXTERNAL_OPENCV__ 1)

if(USE_SYSTEM_OPENCV)
  message(STATUS "  Using OpenCV system version")
else()
  SETUP_SUPERBUILD(PROJECT OPENCV)
  message(STATUS "  Using OpenCV SuperBuild version")

  # declare dependencies
  ADDTO_DEPENDENCIES_IF_NOT_SYSTEM(OPENCV ZLIB TIFF PNG)

  ADD_SUPERBUILD_CMAKE_VAR(OPENCV ZLIB_INCLUDE_DIR)
  ADD_SUPERBUILD_CMAKE_VAR(OPENCV ZLIB_LIBRARY)
  ADD_SUPERBUILD_CMAKE_VAR(OPENCV TIFF_INCLUDE_DIR)
  ADD_SUPERBUILD_CMAKE_VAR(OPENCV TIFF_LIBRARY)
  ADD_SUPERBUILD_CMAKE_VAR(OPENCV PNG_INCLUDE_DIR)
  ADD_SUPERBUILD_CMAKE_VAR(OPENCV PNG_LIBRARY)

  ExternalProject_Add(OPENCV
    PREFIX OPENCV
    URL "http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.4.11/opencv-2.4.11.zip/download"
    URL_MD5 32f498451bff1817a60e1aabc2939575
    BINARY_DIR ${OPENCV_SB_BUILD_DIR}
    INSTALL_DIR ${SB_INSTALL_PREFIX}
      DOWNLOAD_DIR ${DOWNLOAD_LOCATION}
    CMAKE_CACHE_ARGS
      -DBUILD_DOCS:BOOL=OFF
      -DBUILD_EXAMPLES:BOOL=OFF
      -DBUILD_JASPER:BOOL=OFF
      -DWITH_JASPER:BOOL=OFF
      -DBUILD_JPEG:BOOL=OFF
      -DWITH_JPEG:BOOL=OFF
      -DWITH_FFMPEG:BOOL=OFF
      -DWITH_VFW:BOOL=OFF
      -DBUILD_OPENEXR:BOOL=OFF
      -DBUILD_PACKAGE:BOOL=ON
      -DBUILD_PERF_TESTS:BOOL=OFF
      -DBUILD_PNG:BOOL=OFF
      -DBUILD_TBB:BOOL=OFF
      -DBUILD_TESTS:BOOL=OFF
      -DBUILD_TIFF:BOOL=OFF
      -DBUILD_ZLIB:BOOL=OFF
      -DBUILD_opencv_apps:BOOL=OFF
      -DBUILD_opencv_calib3d:BOOL=OFF
      -DBUILD_opencv_contrib:BOOL=OFF
      -DBUILD_opencv_core:BOOL=ON
      -DBUILD_opencv_features2d:BOOL=OFF
      -DBUILD_opencv_flann:BOOL=OFF
      -DBUILD_opencv_gpu:BOOL=OFF
      -DBUILD_opencv_highgui:BOOL=OFF
      -DBUILD_opencv_imgproc:BOOL=OFF
      -DBUILD_opencv_java:BOOL=OFF
      -DBUILD_opencv_legacy:BOOL=OFF
      -DBUILD_opencv_ml:BOOL=ON
      -DBUILD_opencv_nonfree:BOOL=OFF
      -DBUILD_opencv_objdetect:BOOL=OFF
      -DBUILD_opencv_ocl:BOOL=OFF
      -DBUILD_opencv_photo:BOOL=OFF
      -DBUILD_opencv_python:BOOL=OFF
      -DBUILD_opencv_stitching:BOOL=OFF
      -DBUILD_opencv_superres:BOOL=OFF
      -DBUILD_opencv_ts:BOOL=OFF
      -DBUILD_opencv_video:BOOL=OFF
      -DBUILD_opencv_videostab:BOOL=OFF
      -DBUILD_opencv_world:BOOL=OFF
      -DWITH_CUDA:BOOL=OFF
      -DWITH_OPENCL:BOOL=OFF
      ${OPENCV_SB_CONFIG}
      DEPENDS ${OPENCV_DEPENDENCIES}
      CMAKE_COMMAND ${SB_CMAKE_COMMAND}
    )

  if(APPLE)
    SUPERBUILD_PATCH_SOURCE(OPENCV)
  endif()

  set(_SB_OpenCV_DIR ${SB_INSTALL_PREFIX}/share/OpenCV)
endif()
endif()
