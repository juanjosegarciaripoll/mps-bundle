/* config_aux/config.h.in.  Generated from configure.ac by autoheader.  */

/* Define if building universal (internal helper macro) */
/*#undef AC_APPLE_UNIVERSAL_BUILD*/

/* Define to dummy `main' function (if any) required to link to the Fortran
   libraries. */
/*#undef F77_DUMMY_MAIN*/

/* Define to a macro mangling the given C identifier (in lower and upper
   case), which must not contain underscores, for linking with Fortran. */
#define F77_FUNC(x) x##_

/* As F77_FUNC, but for C identifiers containing underscores. */
#define F77_FUNC_(x) x##_

/* Define if F77 and FC dummy `main' functions are identical. */
/*#undef FC_DUMMY_MAIN_EQ_F77*/

/* Define to 1 if you have the <atlas/cblas.h> header file. */
/*#undef HAVE_ATLAS_CBLAS_H*/

/* Define to 1 if you have the `backtrace' function. */
/*#undef HAVE_BACKTRACE*/

/* Define to 1 if you have the `backtrace_symbols' function. */
/*#undef HAVE_BACKTRACE_SYMBOLS*/

/* Define to 1 if you have the <cblas.h> header file. */
#undef HAVE_CBLAS_H

/* Define to 1 if you have the `dladdr' function. */
/*#undef HAVE_DLADDR*/

/* Define to 1 if you have the <dlfcn.h> header file. */
/*#undef HAVE_DLFCN_H*/

/* Define to 1 if you have the <dlfnc.h> header file. */
/*#undef HAVE_DLFNC_H*/

/* Define to 1 if you have the `gettimeofday' function. */
/*#undef HAVE_GETTIMEOFDAY*/

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* F77 init code */
#define HAVE_LIBF2C_INIT 1

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
/*#undef HAVE_STRINGS_H*/

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
/*#undef HAVE_SYS_STAT_H*/

/* Define to 1 if you have the <sys/types.h> header file. */
/*#undef HAVE_SYS_TYPES_H*/

/* Define to 1 if you have the <unistd.h> header file. */
/*#undef HAVE_UNISTD_H*/

/* Define to 1 if you have the <vecLib/cblas.h> header file. */
/*#undef HAVE_VECLIB_CBLAS_H*/

/* GCC builtin return address */
/*#undef HAVE___BUILTIN_RETURN_ADDRESS*/

/* Define to the sub-directory in which libtool stores uninstalled libraries.
   */
/*#undef LT_OBJDIR*/

/* Name of package */
#define PACKAGE "tensor"

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "jjgarcia@users.sf.net"

/* Define to the full name of this package. */
#define PACKAGE_NAME "tensor"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "tensor"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "tensor"

/* Define to the home page for this package. */
#define PACKAGE_URL "https://github.com/juanjosegarciaripoll/tensor"

/* Define to the version of this package. */
#define PACKAGE_VERSION "0.1"

/* The size of `long', as computed by sizeof. */
#define SIZEOF_LONG 4

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Words are 64-bits */
/*#undef TENSOR_64BITS*/

/* Machine is big endian */
/*#define TENSOR_BIGENDIAN*/

/* Use AMD AMCL for matrix operations */
/*#undef TENSOR_USE_ACML*/

/* Use Atlas for matrix operations */
/*#undef TENSOR_USE_ATLAS*/

/* Use CBLAPACK for matrix operations */
#define TENSOR_USE_CBLAPACK

/* Use ESSL for matrix operations */
/*#undef TENSOR_USE_ESSL*/

/* Use FFTW3 library */
/*#undef TENSOR_USE_FFTW3*/

/* Use Intel MKL for matrix operations */
/*#undef TENSOR_USE_MKL*/

/* Use VecLib for matrix operations */
/*#undef TENSOR_USE_VECLIB*/

/* Version number of package */
#define VERSION 0.1

/* Define WORDS_BIGENDIAN to 1 if your processor stores words with the most
   significant byte first (like Motorola and SPARC, unlike Intel). */
#if defined AC_APPLE_UNIVERSAL_BUILD
# if defined __BIG_ENDIAN__
#  define WORDS_BIGENDIAN 1
# endif
#else
# ifndef WORDS_BIGENDIAN
#  undef WORDS_BIGENDIAN
# endif
#endif
