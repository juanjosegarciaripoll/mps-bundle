/* config_aux/config.h.in.  Generated from configure.ac by autoheader.  */

/* Bit size of 'int' */
#define F2C_INT_BITS 32

/* Bit size of 'long' */
#define F2C_LONG_BITS 64

/* Bit sizze of long long */
#undef F2C_LONG_LONG_BITS

/* Define to 1 if you have the `atexit' function. */
#define HAVE_ATEXIT 1

/* Define to 1 if you have the <dlfcn.h> header file. */
#undef HAVE_DLFCN_H

/* Define to 1 if you have the <fenv.h> header file. */
#define HAVE_FENV_H

/* Define to 1 if you have the `floor' function. */
#define HAVE_FLOOR

/* Define to 1 if you have the `fork' function. */
/*#undef HAVE_FORK*/

/* Define to 1 if fseeko (and presumably ftello) exists and is declared. */
/*#undef HAVE_FSEEKO*/

/* Define to 1 if you have the `ftruncate' function. */
/*#undef HAVE_FTRUNCATE*/

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define to 1 if you have the `isascii' function. */
#define HAVE_ISASCII 1

/* Define to 1 if you have the `isatty' function. */
#define HAVE_ISATTY 1

/* Define to 1 if your system has a GNU libc compatible `malloc' function, and
   to 0 otherwise. */
#define HAVE_MALLOC 1

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define to 1 if you have the `memset' function. */
#define HAVE_MEMSET 1

/* Define to 1 if you have the `mkdir' function. */
#define HAVE_MKDIR 1

/* Define to 1 if you have the `mkdtemp' function. */
/*#undef HAVE_MKDTEMP*/

/* Define to 1 if you have the `mkstemp' function. */
/*#undef HAVE_MKSTEMP*/

/* Define to 1 if you have the `onexit' function. */
/*#undef HAVE_ONEXIT*/

/* Define to 1 if you have the `pow' function. */
#define HAVE_POW 1

/* Define to 1 if your system has a GNU libc compatible `realloc' function,
   and to 0 otherwise. */
#define HAVE_REALLOC 1

/* Define to 1 if you have the `rmdir' function. */
#define HAVE_RMDIR 1

/* Define to 1 if you have the `sqrt' function. */
#define HAVE_SQRT 1

/* Define to 1 if you have the <stddef.h> header file. */
#define HAVE_STDDEF_H 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the `strchr' function. */
#define HAVE_STRCHR 1

/* Define to 1 if you have the <strings.h> header file. */
/*#undef HAVE_STRINGS_H */

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
/*#undef HAVE_SYS_STAT_H*/

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the `tmpfile' function. */
#define HAVE_TMPFILE 1

/* Define to 1 if you have the <unistd.h> header file. */
/*#undef HAVE_UNISTD_H*/

/* Define to 1 if you have the `vfork' function. */
/*#undef HAVE_VFORK*/

/* Define to 1 if you have the <vfork.h> header file. */
/*#undef HAVE_VFORK_H*/

/* Define to 1 if `fork' works. */
/*#undef HAVE_WORKING_FORK*/

/* Define to 1 if `vfork' works. */
/*#undef HAVE_WORKING_VFORK*/

/* Name of package */
#define PACKAGE "f2c"

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "jjgarcia@users.sf.net"

/* Define to the full name of this package. */
#define PACKAGE_NAME "f2c"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "f2c"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "f2c"

/* Define to the home page for this package. */
#define PACKAGE_URL "https://github.com/juanjosegarciaripoll/f2c"

/* Define to the version of this package. */
#define PACKAGE_VERSION "0.1"

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Version number of package */
#define VERSION 0.0

/* Enable large inode numbers on Mac OS X 10.5.  */
#ifndef _DARWIN_USE_64_BIT_INODE
# define _DARWIN_USE_64_BIT_INODE 1
#endif

/* Number of bits in a file offset, on hosts where this is settable. */
/*#undef _FILE_OFFSET_BITS*/

/* Define to 1 to make fseeko visible on some hosts (e.g. glibc 2.2). */
/*#undef _LARGEFILE_SOURCE*/

/* Define for large files, on AIX-style hosts. */
/*#undef _LARGE_FILES*/

/* Define to `__inline__' or `__inline' if that's what the C compiler
   calls it, or to nothing if 'inline' is not supported under any name.  */
#ifndef __cplusplus
#undef inline
#endif

/* Define to rpl_malloc if the replacement function should be used. */
/*#undef malloc*/

/* Define to `int' if <sys/types.h> does not define. */
/*#undef pid_t*/

/* Define to rpl_realloc if the replacement function should be used. */
/*#undef realloc*/

/* Define to `unsigned int' if <sys/types.h> does not define. */
/*#undef size_t*/

/* Define as `fork' if `vfork' does not work. */
/*#undef vfork*/

/* Define to avoid using Unix thingies from stdio.h */
#define NON_UNIX_STDIO
