include(CheckIncludeFile)
include(CheckIncludeFiles)
check_include_file("arpa/inet.h" HAVE_ARPA_INET_H)
check_include_file("dlfcn.h" HAVE_DLFCN_H)
check_include_file("fcntl.h" HAVE_FCNTL_H)
if (ENABLE_GSSAPI)
check_include_file("gssapi/gssapi.h" HAVE_GSSAPI_GSSAPI_H)
endif()
if (ENABLE_LIBKRB5)
check_include_file("krb5/krb5.h" HAVE_LIBKRB5)
endif()
check_include_file("inttypes.h" HAVE_INTTYPES_H)
check_include_file("netdb.h" HAVE_NETDB_H)
check_include_file("netinet/in.h" HAVE_NETINET_IN_H)
check_include_files("sys/types.h;netinet/tcp.h" HAVE_NETINET_TCP_H)
check_include_file("poll.h" HAVE_POLL_H)
check_include_file("stdint.h" HAVE_STDINT_H)
check_include_file("stdio.h" HAVE_STDIO_H)
check_include_file("stdlib.h" HAVE_STDLIB_H)
check_include_file("strings.h" HAVE_STRINGS_H)
check_include_file("string.h" HAVE_STRING_H)
check_include_file("sys/ioctl.h" HAVE_SYS_IOCTL_H)
if(NOT PS4)
check_include_file("sys/poll.h" HAVE_SYS_POLL_H)
endif()
check_include_file("sys/socket.h" HAVE_SYS_SOCKET_H)
check_include_file("sys/stat.h" HAVE_SYS_STAT_H)
check_include_file("sys/types.h" HAVE_SYS_TYPES_H)
check_include_file("sys/uio.h" HAVE_SYS_UIO_H)
check_include_file("sys/_iovec.h" HAVE_SYS__IOVEC_H)
check_include_file("sys/time.h" HAVE_SYS_TIME_H)
check_include_file("sys/unistd.h" HAVE_SYS_UNISTD_H)
if(NOT PS4)
check_include_file("sys/errno.h" HAVE_SYS_ERRNO_H)
endif()
check_include_file("time.h" HAVE_TIME_H)
check_include_file("unistd.h" HAVE_UNISTD_H)
check_include_file("errno.h" HAVE_ERRNO_H)
check_include_file("stddef.h" STDC_HEADERS)

include(CheckStructHasMember)
check_struct_has_member("struct sockaddr" sa_len sys/socket.h HAVE_SOCKADDR_LEN)
check_struct_has_member("struct sockaddr_storage" ss_family sys/socket.h HAVE_SOCKADDR_STORAGE)
if(CMAKE_SYSTEM_NAME MATCHES NintendoGameCube OR CMAKE_SYSTEM_NAME MATCHES NintendoWii)
check_struct_has_member("struct linger" l_linger network.h HAVE_LINGER)
else()
check_struct_has_member("struct linger" l_linger sys/socket.h HAVE_LINGER)
endif()

include(CheckCCompilerFlag)
if(CMAKE_COMPILER_IS_GNUCC)
  check_c_compiler_flag(-Wall C_ACCEPTS_WALL)

  if(C_ACCEPTS_WALL)
    add_definitions(-Wall)
  endif()
endif()

# We always want 64 bit file offsets
add_definitions(-D_FILE_OFFSET_BITS=64)

configure_file(cmake/config.h.cmake ${CMAKE_CURRENT_BINARY_DIR}/config.h)
add_definitions(-DHAVE_CONFIG_H)
