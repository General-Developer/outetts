# /* <!-- START LICENSE -->


# This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
# Social Media:

#    - Youtube: https://youtube.com/@Global_Corporation 
#    - Github: https://github.com/globalcorporation
#    - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

# All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

# If you wan't edit you must add credit me (don't change)

# If this Software / Program / Source Code has you

# Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

# Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

# Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
# Karena jika ada negosiasi harga kemungkinan

# 1. Software Ada yang di kurangin
# 2. Informasi tidak lengkap
# 3. Bantuan Tidak Bisa remote / full time (Ada jeda)

# Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

# jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
# Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


# <!-- END LICENSE --> */

cmake_minimum_required(VERSION 3.16)

project(
  general_developer_llama_shared_library
)

set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -s")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -s")


set(LLAMA_LIBRARY_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/lib/llama.cpp")

if(ANDROID)
  set(GGML_OPENMP OFF)
endif()

set(GGML_CCACHE OFF)

if(UNIX)
  set(CMAKE_BUILD_RPATH "$ORIGIN")
endif()

if(ANDROID)
  set(LIBRARY_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../package/outetts_flutter/android/jniLibs/${ANDROID_ABI})
elseif(UNIX)
  set(LIBRARY_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../package/outetts_flutter/linux)
endif()


add_subdirectory(${LLAMA_LIBRARY_DIRECTORY} "llama")


# outetts

add_subdirectory("${LLAMA_LIBRARY_DIRECTORY}/common" "common")
include_directories("${LLAMA_LIBRARY_DIRECTORY}/common")
include_directories("${LLAMA_LIBRARY_DIRECTORY}/include")
include_directories("${LLAMA_LIBRARY_DIRECTORY}/ggml/include")

set(OUTETTS_LIBRARY_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/lib/outetts")
include_directories("${OUTETTS_LIBRARY_DIRECTORY}/include")


add_executable(outetts_executable "${OUTETTS_LIBRARY_DIRECTORY}/lib/outetts.cpp")

set_target_properties(
  outetts_executable PROPERTIES
  OUTPUT_NAME "outetts"
  RUNTIME_OUTPUT_DIRECTORY "bin"
  BUILD_WITH_INSTALL_RPATH TRUE
  INSTALL_RPATH "$ORIGIN"
)

install(TARGETS outetts_executable RUNTIME)
target_link_libraries(outetts_executable PRIVATE llama common ${CMAKE_THREAD_LIBS_INIT})
target_compile_features(outetts_executable PRIVATE cxx_std_17)

set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -s")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -s")

add_library(outetts_shared_library SHARED
  "${OUTETTS_LIBRARY_DIRECTORY}/lib/outetts.cpp"
  "${OUTETTS_LIBRARY_DIRECTORY}/include/outetts.h"
)

set_target_properties(
  outetts_shared_library PROPERTIES
  PUBLIC_HEADER "${OUTETTS_LIBRARY_DIRECTORY}/include/outetts.h"
  LIBRARY_OUTPUT_NAME "outetts"

  BUILD_WITH_INSTALL_RPATH TRUE
  INSTALL_RPATH "$ORIGIN"
)

install(TARGETS outetts_shared_library RUNTIME)
target_link_libraries(outetts_shared_library PRIVATE llama common ${CMAKE_THREAD_LIBS_INIT})
target_compile_features(outetts_shared_library PRIVATE cxx_std_17)
