## hdf5-110 is built with Autotools and does not install HDF5Config.cmake.
## CGNS 4.5.1's CMake build expects that config package.
set(HDF5_FOUND TRUE)
set(HDF5_VERSION 1.10.11)
set(HDF5_C_FOUND TRUE)
set(HDF5_shared_FOUND TRUE)
set(HDF5_shared_C_FOUND TRUE)
set(HDF5_BUILD_SHARED_LIBS TRUE)
set(HDF5_INCLUDE_DIRS "${LOCALBASE}/include/hdf5-110")
set(HDF5_C_SHARED_LIBRARY "${LOCALBASE}/lib/libhdf5-110.so")
