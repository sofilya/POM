// --- C++ Standard Library Headers ---
#include <iostream>   // For std::cout, std::cerr
#include <vector>     // For std::vector
#include <string>     // For std::string
#include <memory>     // For std::unique_ptr, std::shared_ptr

// --- Standard C Library Headers (musl) ---
#include <cstdio>     // Standard I/O
#include <cstdlib>    // EXIT_SUCCESS, EXIT_FAILURE, malloc/free
#include <cstring>    // memset, memcpy
#include <cerrno>     // System error codes (errno)

// --- POSIX & Linux System Headers (Kernel 6.6) ---
#include <unistd.h>   // read, write, close, sleep, usleep
#include <fcntl.h>    // open, O_RDWR, O_NONBLOCK
#include <sys/types.h>// POSIX data types (pid_t, size_t)
#include <sys/ioctl.h>// Device control (I/O control)


// libdrm — writeback capture
// Mesa (EGL/GBM) — GPU-side format conversion if you go that route
// GStreamer (with gst-plugins-bad, x264enc, rtph264pay) — pipeline glue + encode + RTP packetization
