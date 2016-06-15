# 1 "../source/R_RTOS/R_RTOS_timer.c"
# 1 "C:\\Users\\Christian\\Documents\\OHM\\MAPR\\Projekt\\WRKSPC\\R_RTOS\\build//"
# 1 "<built-in>"
#define __STDC__ 1
#define __STDC_VERSION__ 199901L
#define __STDC_HOSTED__ 1
#define __GNUC__ 4
#define __GNUC_MINOR__ 8
#define __GNUC_PATCHLEVEL__ 4
#define __VERSION__ "4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
#define __ATOMIC_RELAXED 0
#define __ATOMIC_SEQ_CST 5
#define __ATOMIC_ACQUIRE 2
#define __ATOMIC_RELEASE 3
#define __ATOMIC_ACQ_REL 4
#define __ATOMIC_CONSUME 1
#define __FINITE_MATH_ONLY__ 0
#define __SIZEOF_INT__ 4
#define __SIZEOF_LONG__ 4
#define __SIZEOF_LONG_LONG__ 8
#define __SIZEOF_SHORT__ 2
#define __SIZEOF_FLOAT__ 4
#define __SIZEOF_DOUBLE__ 8
#define __SIZEOF_LONG_DOUBLE__ 8
#define __SIZEOF_SIZE_T__ 4
#define __CHAR_BIT__ 8
#define __BIGGEST_ALIGNMENT__ 8
#define __ORDER_LITTLE_ENDIAN__ 1234
#define __ORDER_BIG_ENDIAN__ 4321
#define __ORDER_PDP_ENDIAN__ 3412
#define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
#define __FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__
#define __SIZEOF_POINTER__ 4
#define __SIZE_TYPE__ unsigned int
#define __PTRDIFF_TYPE__ int
#define __WCHAR_TYPE__ unsigned int
#define __WINT_TYPE__ unsigned int
#define __INTMAX_TYPE__ long long int
#define __UINTMAX_TYPE__ long long unsigned int
#define __CHAR16_TYPE__ short unsigned int
#define __CHAR32_TYPE__ long unsigned int
#define __SIG_ATOMIC_TYPE__ int
#define __INT8_TYPE__ signed char
#define __INT16_TYPE__ short int
#define __INT32_TYPE__ long int
#define __INT64_TYPE__ long long int
#define __UINT8_TYPE__ unsigned char
#define __UINT16_TYPE__ short unsigned int
#define __UINT32_TYPE__ long unsigned int
#define __UINT64_TYPE__ long long unsigned int
#define __INT_LEAST8_TYPE__ signed char
#define __INT_LEAST16_TYPE__ short int
#define __INT_LEAST32_TYPE__ long int
#define __INT_LEAST64_TYPE__ long long int
#define __UINT_LEAST8_TYPE__ unsigned char
#define __UINT_LEAST16_TYPE__ short unsigned int
#define __UINT_LEAST32_TYPE__ long unsigned int
#define __UINT_LEAST64_TYPE__ long long unsigned int
#define __INT_FAST8_TYPE__ int
#define __INT_FAST16_TYPE__ int
#define __INT_FAST32_TYPE__ int
#define __INT_FAST64_TYPE__ long long int
#define __UINT_FAST8_TYPE__ unsigned int
#define __UINT_FAST16_TYPE__ unsigned int
#define __UINT_FAST32_TYPE__ unsigned int
#define __UINT_FAST64_TYPE__ long long unsigned int
#define __INTPTR_TYPE__ int
#define __UINTPTR_TYPE__ unsigned int
#define __GXX_ABI_VERSION 1002
#define __SCHAR_MAX__ 127
#define __SHRT_MAX__ 32767
#define __INT_MAX__ 2147483647
#define __LONG_MAX__ 2147483647L
#define __LONG_LONG_MAX__ 9223372036854775807LL
#define __WCHAR_MAX__ 4294967295U
#define __WCHAR_MIN__ 0U
#define __WINT_MAX__ 4294967295U
#define __WINT_MIN__ 0U
#define __PTRDIFF_MAX__ 2147483647
#define __SIZE_MAX__ 4294967295U
#define __INTMAX_MAX__ 9223372036854775807LL
#define __INTMAX_C(c) c ## LL
#define __UINTMAX_MAX__ 18446744073709551615ULL
#define __UINTMAX_C(c) c ## ULL
#define __SIG_ATOMIC_MAX__ 2147483647
#define __SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)
#define __INT8_MAX__ 127
#define __INT16_MAX__ 32767
#define __INT32_MAX__ 2147483647L
#define __INT64_MAX__ 9223372036854775807LL
#define __UINT8_MAX__ 255
#define __UINT16_MAX__ 65535
#define __UINT32_MAX__ 4294967295UL
#define __UINT64_MAX__ 18446744073709551615ULL
#define __INT_LEAST8_MAX__ 127
#define __INT8_C(c) c
#define __INT_LEAST16_MAX__ 32767
#define __INT16_C(c) c
#define __INT_LEAST32_MAX__ 2147483647L
#define __INT32_C(c) c ## L
#define __INT_LEAST64_MAX__ 9223372036854775807LL
#define __INT64_C(c) c ## LL
#define __UINT_LEAST8_MAX__ 255
#define __UINT8_C(c) c
#define __UINT_LEAST16_MAX__ 65535
#define __UINT16_C(c) c
#define __UINT_LEAST32_MAX__ 4294967295UL
#define __UINT32_C(c) c ## UL
#define __UINT_LEAST64_MAX__ 18446744073709551615ULL
#define __UINT64_C(c) c ## ULL
#define __INT_FAST8_MAX__ 2147483647
#define __INT_FAST16_MAX__ 2147483647
#define __INT_FAST32_MAX__ 2147483647
#define __INT_FAST64_MAX__ 9223372036854775807LL
#define __UINT_FAST8_MAX__ 4294967295U
#define __UINT_FAST16_MAX__ 4294967295U
#define __UINT_FAST32_MAX__ 4294967295U
#define __UINT_FAST64_MAX__ 18446744073709551615ULL
#define __INTPTR_MAX__ 2147483647
#define __UINTPTR_MAX__ 4294967295U
#define __FLT_EVAL_METHOD__ 0
#define __DEC_EVAL_METHOD__ 2
#define __FLT_RADIX__ 2
#define __FLT_MANT_DIG__ 24
#define __FLT_DIG__ 6
#define __FLT_MIN_EXP__ (-125)
#define __FLT_MIN_10_EXP__ (-37)
#define __FLT_MAX_EXP__ 128
#define __FLT_MAX_10_EXP__ 38
#define __FLT_DECIMAL_DIG__ 9
#define __FLT_MAX__ 3.4028234663852886e+38F
#define __FLT_MIN__ 1.1754943508222875e-38F
#define __FLT_EPSILON__ 1.1920928955078125e-7F
#define __FLT_DENORM_MIN__ 1.4012984643248171e-45F
#define __FLT_HAS_DENORM__ 1
#define __FLT_HAS_INFINITY__ 1
#define __FLT_HAS_QUIET_NAN__ 1
#define __DBL_MANT_DIG__ 53
#define __DBL_DIG__ 15
#define __DBL_MIN_EXP__ (-1021)
#define __DBL_MIN_10_EXP__ (-307)
#define __DBL_MAX_EXP__ 1024
#define __DBL_MAX_10_EXP__ 308
#define __DBL_DECIMAL_DIG__ 17
#define __DBL_MAX__ ((double)1.7976931348623157e+308L)
#define __DBL_MIN__ ((double)2.2250738585072014e-308L)
#define __DBL_EPSILON__ ((double)2.2204460492503131e-16L)
#define __DBL_DENORM_MIN__ ((double)4.9406564584124654e-324L)
#define __DBL_HAS_DENORM__ 1
#define __DBL_HAS_INFINITY__ 1
#define __DBL_HAS_QUIET_NAN__ 1
#define __LDBL_MANT_DIG__ 53
#define __LDBL_DIG__ 15
#define __LDBL_MIN_EXP__ (-1021)
#define __LDBL_MIN_10_EXP__ (-307)
#define __LDBL_MAX_EXP__ 1024
#define __LDBL_MAX_10_EXP__ 308
#define __DECIMAL_DIG__ 17
#define __LDBL_MAX__ 1.7976931348623157e+308L
#define __LDBL_MIN__ 2.2250738585072014e-308L
#define __LDBL_EPSILON__ 2.2204460492503131e-16L
#define __LDBL_DENORM_MIN__ 4.9406564584124654e-324L
#define __LDBL_HAS_DENORM__ 1
#define __LDBL_HAS_INFINITY__ 1
#define __LDBL_HAS_QUIET_NAN__ 1
#define __DEC32_MANT_DIG__ 7
#define __DEC32_MIN_EXP__ (-94)
#define __DEC32_MAX_EXP__ 97
#define __DEC32_MIN__ 1E-95DF
#define __DEC32_MAX__ 9.999999E96DF
#define __DEC32_EPSILON__ 1E-6DF
#define __DEC32_SUBNORMAL_MIN__ 0.000001E-95DF
#define __DEC64_MANT_DIG__ 16
#define __DEC64_MIN_EXP__ (-382)
#define __DEC64_MAX_EXP__ 385
#define __DEC64_MIN__ 1E-383DD
#define __DEC64_MAX__ 9.999999999999999E384DD
#define __DEC64_EPSILON__ 1E-15DD
#define __DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD
#define __DEC128_MANT_DIG__ 34
#define __DEC128_MIN_EXP__ (-6142)
#define __DEC128_MAX_EXP__ 6145
#define __DEC128_MIN__ 1E-6143DL
#define __DEC128_MAX__ 9.999999999999999999999999999999999E6144DL
#define __DEC128_EPSILON__ 1E-33DL
#define __DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL
#define __SFRACT_FBIT__ 7
#define __SFRACT_IBIT__ 0
#define __SFRACT_MIN__ (-0.5HR-0.5HR)
#define __SFRACT_MAX__ 0X7FP-7HR
#define __SFRACT_EPSILON__ 0x1P-7HR
#define __USFRACT_FBIT__ 8
#define __USFRACT_IBIT__ 0
#define __USFRACT_MIN__ 0.0UHR
#define __USFRACT_MAX__ 0XFFP-8UHR
#define __USFRACT_EPSILON__ 0x1P-8UHR
#define __FRACT_FBIT__ 15
#define __FRACT_IBIT__ 0
#define __FRACT_MIN__ (-0.5R-0.5R)
#define __FRACT_MAX__ 0X7FFFP-15R
#define __FRACT_EPSILON__ 0x1P-15R
#define __UFRACT_FBIT__ 16
#define __UFRACT_IBIT__ 0
#define __UFRACT_MIN__ 0.0UR
#define __UFRACT_MAX__ 0XFFFFP-16UR
#define __UFRACT_EPSILON__ 0x1P-16UR
#define __LFRACT_FBIT__ 31
#define __LFRACT_IBIT__ 0
#define __LFRACT_MIN__ (-0.5LR-0.5LR)
#define __LFRACT_MAX__ 0X7FFFFFFFP-31LR
#define __LFRACT_EPSILON__ 0x1P-31LR
#define __ULFRACT_FBIT__ 32
#define __ULFRACT_IBIT__ 0
#define __ULFRACT_MIN__ 0.0ULR
#define __ULFRACT_MAX__ 0XFFFFFFFFP-32ULR
#define __ULFRACT_EPSILON__ 0x1P-32ULR
#define __LLFRACT_FBIT__ 63
#define __LLFRACT_IBIT__ 0
#define __LLFRACT_MIN__ (-0.5LLR-0.5LLR)
#define __LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR
#define __LLFRACT_EPSILON__ 0x1P-63LLR
#define __ULLFRACT_FBIT__ 64
#define __ULLFRACT_IBIT__ 0
#define __ULLFRACT_MIN__ 0.0ULLR
#define __ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR
#define __ULLFRACT_EPSILON__ 0x1P-64ULLR
#define __SACCUM_FBIT__ 7
#define __SACCUM_IBIT__ 8
#define __SACCUM_MIN__ (-0X1P7HK-0X1P7HK)
#define __SACCUM_MAX__ 0X7FFFP-7HK
#define __SACCUM_EPSILON__ 0x1P-7HK
#define __USACCUM_FBIT__ 8
#define __USACCUM_IBIT__ 8
#define __USACCUM_MIN__ 0.0UHK
#define __USACCUM_MAX__ 0XFFFFP-8UHK
#define __USACCUM_EPSILON__ 0x1P-8UHK
#define __ACCUM_FBIT__ 15
#define __ACCUM_IBIT__ 16
#define __ACCUM_MIN__ (-0X1P15K-0X1P15K)
#define __ACCUM_MAX__ 0X7FFFFFFFP-15K
#define __ACCUM_EPSILON__ 0x1P-15K
#define __UACCUM_FBIT__ 16
#define __UACCUM_IBIT__ 16
#define __UACCUM_MIN__ 0.0UK
#define __UACCUM_MAX__ 0XFFFFFFFFP-16UK
#define __UACCUM_EPSILON__ 0x1P-16UK
#define __LACCUM_FBIT__ 31
#define __LACCUM_IBIT__ 32
#define __LACCUM_MIN__ (-0X1P31LK-0X1P31LK)
#define __LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK
#define __LACCUM_EPSILON__ 0x1P-31LK
#define __ULACCUM_FBIT__ 32
#define __ULACCUM_IBIT__ 32
#define __ULACCUM_MIN__ 0.0ULK
#define __ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK
#define __ULACCUM_EPSILON__ 0x1P-32ULK
#define __LLACCUM_FBIT__ 31
#define __LLACCUM_IBIT__ 32
#define __LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)
#define __LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK
#define __LLACCUM_EPSILON__ 0x1P-31LLK
#define __ULLACCUM_FBIT__ 32
#define __ULLACCUM_IBIT__ 32
#define __ULLACCUM_MIN__ 0.0ULLK
#define __ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK
#define __ULLACCUM_EPSILON__ 0x1P-32ULLK
#define __QQ_FBIT__ 7
#define __QQ_IBIT__ 0
#define __HQ_FBIT__ 15
#define __HQ_IBIT__ 0
#define __SQ_FBIT__ 31
#define __SQ_IBIT__ 0
#define __DQ_FBIT__ 63
#define __DQ_IBIT__ 0
#define __TQ_FBIT__ 127
#define __TQ_IBIT__ 0
#define __UQQ_FBIT__ 8
#define __UQQ_IBIT__ 0
#define __UHQ_FBIT__ 16
#define __UHQ_IBIT__ 0
#define __USQ_FBIT__ 32
#define __USQ_IBIT__ 0
#define __UDQ_FBIT__ 64
#define __UDQ_IBIT__ 0
#define __UTQ_FBIT__ 128
#define __UTQ_IBIT__ 0
#define __HA_FBIT__ 7
#define __HA_IBIT__ 8
#define __SA_FBIT__ 15
#define __SA_IBIT__ 16
#define __DA_FBIT__ 31
#define __DA_IBIT__ 32
#define __TA_FBIT__ 63
#define __TA_IBIT__ 64
#define __UHA_FBIT__ 8
#define __UHA_IBIT__ 8
#define __USA_FBIT__ 16
#define __USA_IBIT__ 16
#define __UDA_FBIT__ 32
#define __UDA_IBIT__ 32
#define __UTA_FBIT__ 64
#define __UTA_IBIT__ 64
#define __REGISTER_PREFIX__ 
#define __USER_LABEL_PREFIX__ 
#define __GNUC_STDC_INLINE__ 1
#define __NO_INLINE__ 1
#define __STRICT_ANSI__ 1
#define __GCC_ATOMIC_BOOL_LOCK_FREE 1
#define __GCC_ATOMIC_CHAR_LOCK_FREE 1
#define __GCC_ATOMIC_CHAR16_T_LOCK_FREE 1
#define __GCC_ATOMIC_CHAR32_T_LOCK_FREE 1
#define __GCC_ATOMIC_WCHAR_T_LOCK_FREE 1
#define __GCC_ATOMIC_SHORT_LOCK_FREE 1
#define __GCC_ATOMIC_INT_LOCK_FREE 1
#define __GCC_ATOMIC_LONG_LOCK_FREE 1
#define __GCC_ATOMIC_LLONG_LOCK_FREE 1
#define __GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1
#define __GCC_ATOMIC_POINTER_LOCK_FREE 1
#define __GCC_HAVE_DWARF2_CFI_ASM 1
#define __PRAGMA_REDEFINE_EXTNAME 1
#define __SIZEOF_WCHAR_T__ 4
#define __SIZEOF_WINT_T__ 4
#define __SIZEOF_PTRDIFF_T__ 4
#define __ARM_SIZEOF_MINIMAL_ENUM 1
#define __ARM_SIZEOF_WCHAR_T 32
#define __ARM_ARCH_PROFILE 77
#define __arm__ 1
#define __ARM_ARCH 6
#define __APCS_32__ 1
#define __thumb__ 1
#define __ARM_ARCH_ISA_THUMB 1
#define __ARMEL__ 1
#define __THUMBEL__ 1
#define __SOFTFP__ 1
#define __VFP_FP__ 1
#define __ARM_FP 12
#define __ARM_NEON_FP 4
#define __THUMB_INTERWORK__ 1
#define __ARM_ARCH_6M__ 1
#define __ARM_PCS 1
#define __ARM_EABI__ 1
#define __GXX_TYPEINFO_EQUALITY_INLINE 0
#define __ELF__ 1
# 1 "<command-line>"
#define __USES_INITFINI__ 1
# 1 "../source/R_RTOS/R_RTOS_timer.c"







# 1 "../hal/mcu/NXP_KL05/include/TimerFunc.h" 1
# 9 "../hal/mcu/NXP_KL05/include/TimerFunc.h"
#define HEADERS_TIMERFUNC_H_ 





# 1 "c:\\freescale\\kds_3.0.0\\toolchain\\lib\\gcc\\arm-none-eabi\\4.8.4\\include\\stdint.h" 1 3 4
# 9 "c:\\freescale\\kds_3.0.0\\toolchain\\lib\\gcc\\arm-none-eabi\\4.8.4\\include\\stdint.h" 3 4
# 1 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 1 3 4
# 10 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
#define _STDINT_H 

# 1 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\machine\\_default_types.h" 1 3 4





#define _MACHINE__DEFAULT_TYPES_H 

# 1 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\sys\\features.h" 1 3 4
# 22 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\sys\\features.h" 3 4
#define _SYS_FEATURES_H 
# 31 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\sys\\features.h" 3 4
#define __GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))






#define __GNUC_PREREQ__(ma,mi) __GNUC_PREREQ(ma, mi)
# 9 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\machine\\_default_types.h" 2 3 4






#define __EXP(x) __ ##x ##__
# 27 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\machine\\_default_types.h" 3 4
typedef signed char __int8_t;
typedef unsigned char __uint8_t;
#define ___int8_t_defined 1







typedef short int __int16_t;
typedef short unsigned int __uint16_t;
#define ___int16_t_defined 1
# 55 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\machine\\_default_types.h" 3 4
typedef long int __int32_t;
typedef long unsigned int __uint32_t;
#define ___int32_t_defined 1
# 77 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\machine\\_default_types.h" 3 4
typedef long long int __int64_t;
typedef long long unsigned int __uint64_t;
#define ___int64_t_defined 1
# 104 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\machine\\_default_types.h" 3 4
typedef signed char __int_least8_t;
typedef unsigned char __uint_least8_t;
#define ___int_least8_t_defined 1
# 126 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\machine\\_default_types.h" 3 4
typedef short int __int_least16_t;
typedef short unsigned int __uint_least16_t;
#define ___int_least16_t_defined 1
# 144 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\machine\\_default_types.h" 3 4
typedef long int __int_least32_t;
typedef long unsigned int __uint_least32_t;
#define ___int_least32_t_defined 1
# 158 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\machine\\_default_types.h" 3 4
typedef long long int __int_least64_t;
typedef long long unsigned int __uint_least64_t;
#define ___int_least64_t_defined 1







typedef int __intptr_t;
typedef unsigned int __uintptr_t;
# 178 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\machine\\_default_types.h" 3 4
#undef __EXP
# 13 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 2 3 4







#define __STDINT_EXP(x) __ ##x ##__
# 30 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
#define __have_longlong64 1






#define __have_long32 1



typedef __int8_t int8_t ;
typedef __uint8_t uint8_t ;
#define __int8_t_defined 1



typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;
#define __int_least8_t_defined 1



typedef __int16_t int16_t ;
typedef __uint16_t uint16_t ;
#define __int16_t_defined 1



typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;
#define __int_least16_t_defined 1



typedef __int32_t int32_t ;
typedef __uint32_t uint32_t ;
#define __int32_t_defined 1



typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;
#define __int_least32_t_defined 1



typedef __int64_t int64_t ;
typedef __uint64_t uint64_t ;
#define __int64_t_defined 1



typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
#define __int_least64_t_defined 1
# 95 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
#define __int_fast8_t_defined 1







  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
#define __int_fast16_t_defined 1







  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
#define __int_fast32_t_defined 1







  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
#define __int_fast64_t_defined 1
# 174 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef long long int intmax_t;
# 183 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef long long unsigned int uintmax_t;






typedef __intptr_t intptr_t;
typedef __uintptr_t uintptr_t;


#define INTPTR_MIN (-__INTPTR_MAX__ - 1)
#define INTPTR_MAX __INTPTR_MAX__
#define UINTPTR_MAX __UINTPTR_MAX__
# 218 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
#define INT8_MIN (-__INT8_MAX__ - 1)
#define INT8_MAX __INT8_MAX__
#define UINT8_MAX __UINT8_MAX__







#define INT_LEAST8_MIN (-__INT_LEAST8_MAX__ - 1)
#define INT_LEAST8_MAX __INT_LEAST8_MAX__
#define UINT_LEAST8_MAX __UINT_LEAST8_MAX__
# 240 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
#define INT16_MIN (-__INT16_MAX__ - 1)
#define INT16_MAX __INT16_MAX__
#define UINT16_MAX __UINT16_MAX__







#define INT_LEAST16_MIN (-__INT_LEAST16_MAX__ - 1)
#define INT_LEAST16_MAX __INT_LEAST16_MAX__
#define UINT_LEAST16_MAX __UINT_LEAST16_MAX__
# 262 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
#define INT32_MIN (-__INT32_MAX__ - 1)
#define INT32_MAX __INT32_MAX__
#define UINT32_MAX __UINT32_MAX__
# 278 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
#define INT_LEAST32_MIN (-__INT_LEAST32_MAX__ - 1)
#define INT_LEAST32_MAX __INT_LEAST32_MAX__
#define UINT_LEAST32_MAX __UINT_LEAST32_MAX__
# 296 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
#define INT64_MIN (-__INT64_MAX__ - 1)
#define INT64_MAX __INT64_MAX__
#define UINT64_MAX __UINT64_MAX__
# 312 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
#define INT_LEAST64_MIN (-__INT_LEAST64_MAX__ - 1)
#define INT_LEAST64_MAX __INT_LEAST64_MAX__
#define UINT_LEAST64_MAX __UINT_LEAST64_MAX__
# 328 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
#define INT_FAST8_MIN (-__INT_FAST8_MAX__ - 1)
#define INT_FAST8_MAX __INT_FAST8_MAX__
#define UINT_FAST8_MAX __UINT_FAST8_MAX__
# 344 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
#define INT_FAST16_MIN (-__INT_FAST16_MAX__ - 1)
#define INT_FAST16_MAX __INT_FAST16_MAX__
#define UINT_FAST16_MAX __UINT_FAST16_MAX__
# 360 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
#define INT_FAST32_MIN (-__INT_FAST32_MAX__ - 1)
#define INT_FAST32_MAX __INT_FAST32_MAX__
#define UINT_FAST32_MAX __UINT_FAST32_MAX__
# 376 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
#define INT_FAST64_MIN (-__INT_FAST64_MAX__ - 1)
#define INT_FAST64_MAX __INT_FAST64_MAX__
#define UINT_FAST64_MAX __UINT_FAST64_MAX__
# 392 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
#define INTMAX_MAX __INTMAX_MAX__
#define INTMAX_MIN (-INTMAX_MAX - 1)







#define UINTMAX_MAX __UINTMAX_MAX__







#define SIZE_MAX __SIZE_MAX__





#define SIG_ATOMIC_MIN (-__STDINT_EXP(INT_MAX) - 1)
#define SIG_ATOMIC_MAX __STDINT_EXP(INT_MAX)



#define PTRDIFF_MAX __PTRDIFF_MAX__



#define PTRDIFF_MIN (-PTRDIFF_MAX - 1)


#define WCHAR_MAX __WCHAR_MAX__


#define WCHAR_MIN __WCHAR_MIN__




#define WINT_MAX __WINT_MAX__




#define WINT_MIN __WINT_MIN__






#define INT8_C(x) __INT8_C(x)
#define UINT8_C(x) __UINT8_C(x)
# 459 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
#define INT16_C(x) __INT16_C(x)
#define UINT16_C(x) __UINT16_C(x)
# 471 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
#define INT32_C(x) __INT32_C(x)
#define UINT32_C(x) __UINT32_C(x)
# 484 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
#define INT64_C(x) __INT64_C(x)
#define UINT64_C(x) __UINT64_C(x)
# 500 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h" 3 4
#define INTMAX_C(x) __INTMAX_C(x)
#define UINTMAX_C(x) __UINTMAX_C(x)
# 10 "c:\\freescale\\kds_3.0.0\\toolchain\\lib\\gcc\\arm-none-eabi\\4.8.4\\include\\stdint.h" 2 3 4



#define _GCC_WRAP_STDINT_H 
# 16 "../hal/mcu/NXP_KL05/include/TimerFunc.h" 2
# 24 "../hal/mcu/NXP_KL05/include/TimerFunc.h"
typedef struct timerFlags
{
    volatile uint8_t g_calibrationOngoing:1;
    volatile uint8_t g_LMPTRtimerInitialized:1;
    volatile uint8_t g_PITtimerInitialized :1;
    volatile uint8_t g_TPM0TimerInitialized :1;
    volatile uint8_t g_TPM1TimerInitialized :1;
}TimerFlags;
# 44 "../hal/mcu/NXP_KL05/include/TimerFunc.h"
void __initTMRFlags( void );

#define READ_PIT() (uint32_t)(~( PIT_BASE_PTR->CHANNEL[1].CVAL ))
#define IS_WAIT_EXPIRED(start,msToWait) (uint8_t)(( READ_PIT() - ((uint32_t)(start)) ) > ( (uint32_t)(msToWait)))
#define IS_WAIT_STILL_ACTIVE(start,msToWait) (uint8_t)(( READ_PIT() - ((uint32_t)(start)) ) < ( (uint32_t)(msToWait)))
#define WAIT_MS(msToWait) do { uint32_t dummyStartTime = READ_PIT(); while( IS_WAIT_STILL_ACTIVE( dummyStartTime, msToWait ) ){__NOP();} }while((uint8_t)0x0u)





#define DISABLE_PIT() PIT_BASE_PTR->MCR = PIT_MCR_MDIS(0x1u) | PIT_MCR_FRZ( 0x1u );

#define ENABLE_PIT() PIT_BASE_PTR->MCR = PIT_MCR_MDIS(0x0u) | PIT_MCR_FRZ( 0x1u );
# 71 "../hal/mcu/NXP_KL05/include/TimerFunc.h"
void __init_PIT( void );
# 86 "../hal/mcu/NXP_KL05/include/TimerFunc.h"
void resetPIT( uint32_t currentPITVal );


void calibratePITWithTPM( uint8_t calibrationCycles );

void startPITCalibrationWithTPM( void );

void endPITCalibrationWithTPM( void );

void enablePITInterrupt( void );

void disablePITInterrupt( void );

void pitIntHandler( void );
# 114 "../hal/mcu/NXP_KL05/include/TimerFunc.h"
uint32_t readPIT( void );
# 129 "../hal/mcu/NXP_KL05/include/TimerFunc.h"
void wait_ms( const uint32_t ms );

void calibratePIT( uint8_t calibrationCycles );

void startPITCalibration( void );

void endPITCalibration( void );
# 149 "../hal/mcu/NXP_KL05/include/TimerFunc.h"
void __init_LPTMR( void );

void setLPTMR( const uint16_t timerVal );

#define WRITE_TO_LPTMR_CNR (LPTMR0_BASE_PTR->CNR = (uint32_t)0x1u;)
#define READ_LPTMR_CNR ((uint16_t)LPTMR0_BASE_PTR->CNR)

uint16_t readLPTMR( void );

void lptmrIntHandler( void );

void wait_ms_LP( uint16_t ms );

void calibrateLPTMR( uint8_t calibrationCycles );

void startLPTMRCalibration( void );

void endLPTMRCalibration( void );
# 180 "../hal/mcu/NXP_KL05/include/TimerFunc.h"
void __init_RTC( void );

void rtcIntHandler( void );

void enableRTCInterrupt( void );

void disableRTCInterrupt( void );

#define READ_RTC ((uint32_t)RTC_BASE_PTR->TSR)

uint32_t readRTC( void );

void setRTC( uint32_t tSec );

#define TPM0_CHANNELS (uint8_t)0x6u
#define TPM1_CHANNELS (uint8_t)0x2u

#define UPDATE_TPM_CH(tpm,ch,newTime) do { __init_TPMChannel((uint8_t)tpm,(uint8_t)ch,(uint16_t)newTime); startTPMChannel((uint8_t)tpm,(uint8_t)ch); }while((uint8_t)0x0u)






void __init_TPM( const uint8_t timer );

void __init_TPMChannel(
        const uint8_t timer,
        const uint8_t channelNr,
        const uint16_t timeInMs );

void startTPMChannel( const uint8_t timer, const uint8_t channelNr );

void stopTPMChannel( const uint8_t timer, const uint8_t channelNr );

void re_setTPMTimer( const uint8_t timer, const uint8_t channelNr );

uint16_t getTPMCHRemTime( const uint8_t timer, const uint8_t channelNr );
void correctTPMChannel(
        const uint8_t timer,
        const uint16_t chCorr );

void __disableTPMTimers( void );

void __enableTPMTimers( void );

uint16_t findShortesTPM( void );
# 9 "../source/R_RTOS/R_RTOS_timer.c" 2
# 1 "../hal/mcu/NXP_KL05/include/InterruptFunc.h" 1
# 9 "../hal/mcu/NXP_KL05/include/InterruptFunc.h"
#define HEADERS_INTERRUPTFUNC_H_ 





# 1 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h" 1
# 103 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define MKL05Z4_H_ 
#define MCU_MKL05Z4 





#define MCU_ACTIVE 





#define MCU_MEM_MAP_VERSION 0x0200u

#define MCU_MEM_MAP_VERSION_MINOR 0x0003u
# 131 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define NUMBER_OF_INT_VECTORS 48

typedef enum IRQn {

  NonMaskableInt_IRQn = -14,
  HardFault_IRQn = -13,
  SVCall_IRQn = -5,
  PendSV_IRQn = -2,
  SysTick_IRQn = -1,


  DMA0_IRQn = 0,
  DMA1_IRQn = 1,
  DMA2_IRQn = 2,
  DMA3_IRQn = 3,
  Reserved20_IRQn = 4,
  FTFA_IRQn = 5,
  LVD_LVW_IRQn = 6,
  LLWU_IRQn = 7,
  I2C0_IRQn = 8,
  Reserved25_IRQn = 9,
  SPI0_IRQn = 10,
  Reserved27_IRQn = 11,
  UART0_IRQn = 12,
  Reserved29_IRQn = 13,
  Reserved30_IRQn = 14,
  ADC0_IRQn = 15,
  CMP0_IRQn = 16,
  TPM0_IRQn = 17,
  TPM1_IRQn = 18,
  Reserved35_IRQn = 19,
  RTC_IRQn = 20,
  RTC_Seconds_IRQn = 21,
  PIT_IRQn = 22,
  Reserved39_IRQn = 23,
  Reserved40_IRQn = 24,
  DAC0_IRQn = 25,
  TSI0_IRQn = 26,
  MCG_IRQn = 27,
  LPTMR0_IRQn = 28,
  Reserved45_IRQn = 29,
  PORTA_IRQn = 30,
  PORTB_IRQn = 31
} IRQn_Type;
# 190 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define __CM0PLUS_REV 0x0000
#define __MPU_PRESENT 0
#define __VTOR_PRESENT 1
#define __NVIC_PRIO_BITS 2
#define __Vendor_SysTickConfig 0

# 1 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h" 1
# 43 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
#define __CORE_CM0PLUS_H_GENERIC 
# 71 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
#define __CM0PLUS_CMSIS_VERSION_MAIN (0x03)
#define __CM0PLUS_CMSIS_VERSION_SUB (0x20)
#define __CM0PLUS_CMSIS_VERSION ((__CM0PLUS_CMSIS_VERSION_MAIN << 16) | __CM0PLUS_CMSIS_VERSION_SUB)


#define __CORTEX_M (0x00)
# 85 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
#define __ASM __asm
#define __INLINE inline
#define __STATIC_INLINE static inline
# 113 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
#define __FPU_USED 0
# 147 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
# 1 "../hal/proc/ARM_cortex-m0plus/core_cmInstr.h" 1
# 39 "../hal/proc/ARM_cortex-m0plus/core_cmInstr.h"
#define __CORE_CMINSTR_H 
# 301 "../hal/proc/ARM_cortex-m0plus/core_cmInstr.h"
#define __CMSIS_GCC_OUT_REG(r) "=l" (r)
#define __CMSIS_GCC_USE_REG(r) "l" (r)
# 312 "../hal/proc/ARM_cortex-m0plus/core_cmInstr.h"
__attribute__( ( always_inline ) ) static inline void __NOP(void)
{
  __asm volatile ("nop");
}







__attribute__( ( always_inline ) ) static inline void __WFI(void)
{
  __asm volatile ("wfi");
}







__attribute__( ( always_inline ) ) static inline void __WFE(void)
{
  __asm volatile ("wfe");
}






__attribute__( ( always_inline ) ) static inline void __SEV(void)
{
  __asm volatile ("sev");
}
# 356 "../hal/proc/ARM_cortex-m0plus/core_cmInstr.h"
__attribute__( ( always_inline ) ) static inline void __ISB(void)
{
  __asm volatile ("isb");
}







__attribute__( ( always_inline ) ) static inline void __DSB(void)
{
  __asm volatile ("dsb");
}







__attribute__( ( always_inline ) ) static inline void __DMB(void)
{
  __asm volatile ("dmb");
}
# 391 "../hal/proc/ARM_cortex-m0plus/core_cmInstr.h"
__attribute__( ( always_inline ) ) static inline uint32_t __REV(uint32_t value)
{

  return __builtin_bswap32(value);






}
# 411 "../hal/proc/ARM_cortex-m0plus/core_cmInstr.h"
__attribute__( ( always_inline ) ) static inline uint32_t __REV16(uint32_t value)
{
  uint32_t result;

  __asm volatile ("rev16 %0, %1" : "=l" (result) : "l" (value) );
  return(result);
}
# 427 "../hal/proc/ARM_cortex-m0plus/core_cmInstr.h"
__attribute__( ( always_inline ) ) static inline int32_t __REVSH(int32_t value)
{

  return (short)__builtin_bswap16(value);






}
# 448 "../hal/proc/ARM_cortex-m0plus/core_cmInstr.h"
__attribute__( ( always_inline ) ) static inline uint32_t __ROR(uint32_t op1, uint32_t op2)
{
  return (op1 >> op2) | (op1 << (32 - op2));
}
# 462 "../hal/proc/ARM_cortex-m0plus/core_cmInstr.h"
#define __BKPT(value) __ASM volatile ("bkpt "#value)
# 148 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h" 2
# 1 "../hal/proc/ARM_cortex-m0plus/core_cmFunc.h" 1
# 39 "../hal/proc/ARM_cortex-m0plus/core_cmFunc.h"
#define __CORE_CMFUNC_H 
# 317 "../hal/proc/ARM_cortex-m0plus/core_cmFunc.h"
__attribute__( ( always_inline ) ) static inline void __enable_irq(void)
{
  __asm volatile ("cpsie i" : : : "memory");
}







__attribute__( ( always_inline ) ) static inline void __disable_irq(void)
{
  __asm volatile ("cpsid i" : : : "memory");
}
# 340 "../hal/proc/ARM_cortex-m0plus/core_cmFunc.h"
__attribute__( ( always_inline ) ) static inline uint32_t __get_CONTROL(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, control" : "=r" (result) );
  return(result);
}
# 355 "../hal/proc/ARM_cortex-m0plus/core_cmFunc.h"
__attribute__( ( always_inline ) ) static inline void __set_CONTROL(uint32_t control)
{
  __asm volatile ("MSR control, %0" : : "r" (control) : "memory");
}
# 367 "../hal/proc/ARM_cortex-m0plus/core_cmFunc.h"
__attribute__( ( always_inline ) ) static inline uint32_t __get_IPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, ipsr" : "=r" (result) );
  return(result);
}
# 382 "../hal/proc/ARM_cortex-m0plus/core_cmFunc.h"
__attribute__( ( always_inline ) ) static inline uint32_t __get_APSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, apsr" : "=r" (result) );
  return(result);
}
# 397 "../hal/proc/ARM_cortex-m0plus/core_cmFunc.h"
__attribute__( ( always_inline ) ) static inline uint32_t __get_xPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, xpsr" : "=r" (result) );
  return(result);
}
# 412 "../hal/proc/ARM_cortex-m0plus/core_cmFunc.h"
__attribute__( ( always_inline ) ) static inline uint32_t __get_PSP(void)
{
  register uint32_t result;

  __asm volatile ("MRS %0, psp\n" : "=r" (result) );
  return(result);
}
# 427 "../hal/proc/ARM_cortex-m0plus/core_cmFunc.h"
__attribute__( ( always_inline ) ) static inline void __set_PSP(uint32_t topOfProcStack)
{
  __asm volatile ("MSR psp, %0\n" : : "r" (topOfProcStack) : "sp");
}
# 439 "../hal/proc/ARM_cortex-m0plus/core_cmFunc.h"
__attribute__( ( always_inline ) ) static inline uint32_t __get_MSP(void)
{
  register uint32_t result;

  __asm volatile ("MRS %0, msp\n" : "=r" (result) );
  return(result);
}
# 454 "../hal/proc/ARM_cortex-m0plus/core_cmFunc.h"
__attribute__( ( always_inline ) ) static inline void __set_MSP(uint32_t topOfMainStack)
{
  __asm volatile ("MSR msp, %0\n" : : "r" (topOfMainStack) : "sp");
}
# 466 "../hal/proc/ARM_cortex-m0plus/core_cmFunc.h"
__attribute__( ( always_inline ) ) static inline uint32_t __get_PRIMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, primask" : "=r" (result) );
  return(result);
}
# 481 "../hal/proc/ARM_cortex-m0plus/core_cmFunc.h"
__attribute__( ( always_inline ) ) static inline void __set_PRIMASK(uint32_t priMask)
{
  __asm volatile ("MSR primask, %0" : : "r" (priMask) : "memory");
}
# 149 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h" 2






#define __CORE_CM0PLUS_H_DEPENDANT 
# 196 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
#define __I volatile const

#define __O volatile
#define __IO volatile
# 226 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
typedef union
{
  struct
  {

    uint32_t _reserved0:27;





    uint32_t Q:1;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} APSR_Type;




typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:23;
  } b;
  uint32_t w;
} IPSR_Type;




typedef union
{
  struct
  {
    uint32_t ISR:9;

    uint32_t _reserved0:15;





    uint32_t T:1;
    uint32_t IT:2;
    uint32_t Q:1;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} xPSR_Type;




typedef union
{
  struct
  {
    uint32_t nPRIV:1;
    uint32_t SPSEL:1;
    uint32_t FPCA:1;
    uint32_t _reserved0:29;
  } b;
  uint32_t w;
} CONTROL_Type;
# 311 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
typedef struct
{
  volatile uint32_t ISER[1];
       uint32_t RESERVED0[31];
  volatile uint32_t ICER[1];
       uint32_t RSERVED1[31];
  volatile uint32_t ISPR[1];
       uint32_t RESERVED2[31];
  volatile uint32_t ICPR[1];
       uint32_t RESERVED3[31];
       uint32_t RESERVED4[64];
  volatile uint32_t IP[8];
} NVIC_Type;
# 336 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
typedef struct
{
  volatile const uint32_t CPUID;
  volatile uint32_t ICSR;

  volatile uint32_t VTOR;



  volatile uint32_t AIRCR;
  volatile uint32_t SCR;
  volatile uint32_t CCR;
       uint32_t RESERVED1;
  volatile uint32_t SHP[2];
  volatile uint32_t SHCSR;
} SCB_Type;


#define SCB_CPUID_IMPLEMENTER_Pos 24
#define SCB_CPUID_IMPLEMENTER_Msk (0xFFUL << SCB_CPUID_IMPLEMENTER_Pos)

#define SCB_CPUID_VARIANT_Pos 20
#define SCB_CPUID_VARIANT_Msk (0xFUL << SCB_CPUID_VARIANT_Pos)

#define SCB_CPUID_ARCHITECTURE_Pos 16
#define SCB_CPUID_ARCHITECTURE_Msk (0xFUL << SCB_CPUID_ARCHITECTURE_Pos)

#define SCB_CPUID_PARTNO_Pos 4
#define SCB_CPUID_PARTNO_Msk (0xFFFUL << SCB_CPUID_PARTNO_Pos)

#define SCB_CPUID_REVISION_Pos 0
#define SCB_CPUID_REVISION_Msk (0xFUL << SCB_CPUID_REVISION_Pos)


#define SCB_ICSR_NMIPENDSET_Pos 31
#define SCB_ICSR_NMIPENDSET_Msk (1UL << SCB_ICSR_NMIPENDSET_Pos)

#define SCB_ICSR_PENDSVSET_Pos 28
#define SCB_ICSR_PENDSVSET_Msk (1UL << SCB_ICSR_PENDSVSET_Pos)

#define SCB_ICSR_PENDSVCLR_Pos 27
#define SCB_ICSR_PENDSVCLR_Msk (1UL << SCB_ICSR_PENDSVCLR_Pos)

#define SCB_ICSR_PENDSTSET_Pos 26
#define SCB_ICSR_PENDSTSET_Msk (1UL << SCB_ICSR_PENDSTSET_Pos)

#define SCB_ICSR_PENDSTCLR_Pos 25
#define SCB_ICSR_PENDSTCLR_Msk (1UL << SCB_ICSR_PENDSTCLR_Pos)

#define SCB_ICSR_ISRPREEMPT_Pos 23
#define SCB_ICSR_ISRPREEMPT_Msk (1UL << SCB_ICSR_ISRPREEMPT_Pos)

#define SCB_ICSR_ISRPENDING_Pos 22
#define SCB_ICSR_ISRPENDING_Msk (1UL << SCB_ICSR_ISRPENDING_Pos)

#define SCB_ICSR_VECTPENDING_Pos 12
#define SCB_ICSR_VECTPENDING_Msk (0x1FFUL << SCB_ICSR_VECTPENDING_Pos)

#define SCB_ICSR_VECTACTIVE_Pos 0
#define SCB_ICSR_VECTACTIVE_Msk (0x1FFUL << SCB_ICSR_VECTACTIVE_Pos)



#define SCB_VTOR_TBLOFF_Pos 8
#define SCB_VTOR_TBLOFF_Msk (0xFFFFFFUL << SCB_VTOR_TBLOFF_Pos)



#define SCB_AIRCR_VECTKEY_Pos 16
#define SCB_AIRCR_VECTKEY_Msk (0xFFFFUL << SCB_AIRCR_VECTKEY_Pos)

#define SCB_AIRCR_VECTKEYSTAT_Pos 16
#define SCB_AIRCR_VECTKEYSTAT_Msk (0xFFFFUL << SCB_AIRCR_VECTKEYSTAT_Pos)

#define SCB_AIRCR_ENDIANESS_Pos 15
#define SCB_AIRCR_ENDIANESS_Msk (1UL << SCB_AIRCR_ENDIANESS_Pos)

#define SCB_AIRCR_SYSRESETREQ_Pos 2
#define SCB_AIRCR_SYSRESETREQ_Msk (1UL << SCB_AIRCR_SYSRESETREQ_Pos)

#define SCB_AIRCR_VECTCLRACTIVE_Pos 1
#define SCB_AIRCR_VECTCLRACTIVE_Msk (1UL << SCB_AIRCR_VECTCLRACTIVE_Pos)


#define SCB_SCR_SEVONPEND_Pos 4
#define SCB_SCR_SEVONPEND_Msk (1UL << SCB_SCR_SEVONPEND_Pos)

#define SCB_SCR_SLEEPDEEP_Pos 2
#define SCB_SCR_SLEEPDEEP_Msk (1UL << SCB_SCR_SLEEPDEEP_Pos)

#define SCB_SCR_SLEEPONEXIT_Pos 1
#define SCB_SCR_SLEEPONEXIT_Msk (1UL << SCB_SCR_SLEEPONEXIT_Pos)


#define SCB_CCR_STKALIGN_Pos 9
#define SCB_CCR_STKALIGN_Msk (1UL << SCB_CCR_STKALIGN_Pos)

#define SCB_CCR_UNALIGN_TRP_Pos 3
#define SCB_CCR_UNALIGN_TRP_Msk (1UL << SCB_CCR_UNALIGN_TRP_Pos)


#define SCB_SHCSR_SVCALLPENDED_Pos 15
#define SCB_SHCSR_SVCALLPENDED_Msk (1UL << SCB_SHCSR_SVCALLPENDED_Pos)
# 451 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
typedef struct
{
  volatile uint32_t CTRL;
  volatile uint32_t LOAD;
  volatile uint32_t VAL;
  volatile const uint32_t CALIB;
} SysTick_Type;


#define SysTick_CTRL_COUNTFLAG_Pos 16
#define SysTick_CTRL_COUNTFLAG_Msk (1UL << SysTick_CTRL_COUNTFLAG_Pos)

#define SysTick_CTRL_CLKSOURCE_Pos 2
#define SysTick_CTRL_CLKSOURCE_Msk (1UL << SysTick_CTRL_CLKSOURCE_Pos)

#define SysTick_CTRL_TICKINT_Pos 1
#define SysTick_CTRL_TICKINT_Msk (1UL << SysTick_CTRL_TICKINT_Pos)

#define SysTick_CTRL_ENABLE_Pos 0
#define SysTick_CTRL_ENABLE_Msk (1UL << SysTick_CTRL_ENABLE_Pos)


#define SysTick_LOAD_RELOAD_Pos 0
#define SysTick_LOAD_RELOAD_Msk (0xFFFFFFUL << SysTick_LOAD_RELOAD_Pos)


#define SysTick_VAL_CURRENT_Pos 0
#define SysTick_VAL_CURRENT_Msk (0xFFFFFFUL << SysTick_VAL_CURRENT_Pos)


#define SysTick_CALIB_NOREF_Pos 31
#define SysTick_CALIB_NOREF_Msk (1UL << SysTick_CALIB_NOREF_Pos)

#define SysTick_CALIB_SKEW_Pos 30
#define SysTick_CALIB_SKEW_Msk (1UL << SysTick_CALIB_SKEW_Pos)

#define SysTick_CALIB_TENMS_Pos 0
#define SysTick_CALIB_TENMS_Msk (0xFFFFFFUL << SysTick_VAL_CURRENT_Pos)
# 596 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
#define SCS_BASE (0xE000E000UL)
#define SysTick_BASE (SCS_BASE + 0x0010UL)
#define NVIC_BASE (SCS_BASE + 0x0100UL)
#define SCB_BASE (SCS_BASE + 0x0D00UL)

#define SCB ((SCB_Type *) SCB_BASE )
#define SysTick ((SysTick_Type *) SysTick_BASE )
#define NVIC ((NVIC_Type *) NVIC_BASE )
# 635 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
#define _BIT_SHIFT(IRQn) ( (((uint32_t)(IRQn) ) & 0x03) * 8 )
#define _SHP_IDX(IRQn) ( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )
#define _IP_IDX(IRQn) ( ((uint32_t)(IRQn) >> 2) )
# 646 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
static inline void NVIC_EnableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[0] = (1 << ((uint32_t)(IRQn) & 0x1F));
}
# 658 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
static inline void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[0] = (1 << ((uint32_t)(IRQn) & 0x1F));
}
# 674 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
static inline uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  return((uint32_t) ((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[0] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));
}
# 686 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
static inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[0] = (1 << ((uint32_t)(IRQn) & 0x1F));
}
# 698 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
static inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[0] = (1 << ((uint32_t)(IRQn) & 0x1F));
}
# 713 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
static inline void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if(IRQn < 0) {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] = (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] & ~(0xFF << ( (((uint32_t)(IRQn) ) & 0x03) * 8 ))) |
        (((priority << (8 - 2)) & 0xFF) << ( (((uint32_t)(IRQn) ) & 0x03) * 8 )); }
  else {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[( ((uint32_t)(IRQn) >> 2) )] = (((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[( ((uint32_t)(IRQn) >> 2) )] & ~(0xFF << ( (((uint32_t)(IRQn) ) & 0x03) * 8 ))) |
        (((priority << (8 - 2)) & 0xFF) << ( (((uint32_t)(IRQn) ) & 0x03) * 8 )); }
}
# 735 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
static inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

  if(IRQn < 0) {
    return((uint32_t)(((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] >> ( (((uint32_t)(IRQn) ) & 0x03) * 8 ) ) & 0xFF) >> (8 - 2))); }
  else {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[ ( ((uint32_t)(IRQn) >> 2) )] >> ( (((uint32_t)(IRQn) ) & 0x03) * 8 ) ) & 0xFF) >> (8 - 2))); }
}






static inline void NVIC_SystemReset(void)
{
  __DSB();

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = ((0x5FA << 16) |
                 (1UL << 2));
  __DSB();
  while(1);
}
# 787 "../hal/proc/ARM_cortex-m0plus/core_cm0plus.h"
static inline uint32_t SysTick_Config(uint32_t ticks)
{
  if ((ticks - 1) > (0xFFFFFFUL << 0)) return (1);

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD = ticks - 1;
  NVIC_SetPriority (SysTick_IRQn, (1<<2) - 1);
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL = 0;
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL = (1UL << 2) |
                   (1UL << 1) |
                   (1UL << 0);
  return (0);
}
# 197 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h" 2
# 1 "../hal/mcu/NXP_KL05/BSP/include/system_MKL05Z4.h" 1
# 101 "../hal/mcu/NXP_KL05/BSP/include/system_MKL05Z4.h"
#define SYSTEM_MKL05Z4_H_ 
# 111 "../hal/mcu/NXP_KL05/BSP/include/system_MKL05Z4.h"
#define DISABLE_WDOG 1




#define MCG_MODE_FEI 0U
#define MCG_MODE_FBI 1U
#define MCG_MODE_BLPI 2U
#define MCG_MODE_FEE 3U
#define MCG_MODE_FBE 4U
#define MCG_MODE_BLPE 5U
# 148 "../hal/mcu/NXP_KL05/BSP/include/system_MKL05Z4.h"
#define CPU_XTAL_CLK_HZ 32768U
#define CPU_INT_SLOW_CLK_HZ 32768U
#define CPU_INT_FAST_CLK_HZ 4000000U





#define SYSTEM_SMC_PMPROT_VALUE 0x2AU
# 268 "../hal/mcu/NXP_KL05/BSP/include/system_MKL05Z4.h"
#define DEFAULT_SYSTEM_CLOCK 20971520U
# 280 "../hal/mcu/NXP_KL05/BSP/include/system_MKL05Z4.h"
extern uint32_t SystemCoreClock;
# 289 "../hal/mcu/NXP_KL05/BSP/include/system_MKL05Z4.h"
void SystemInit (void);
# 298 "../hal/mcu/NXP_KL05/BSP/include/system_MKL05Z4.h"
void SystemCoreClockUpdate (void);
# 198 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h" 2
# 242 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint32_t SC1[2];
  volatile uint32_t CFG1;
  volatile uint32_t CFG2;
  volatile const uint32_t R[2];
  volatile uint32_t CV1;
  volatile uint32_t CV2;
  volatile uint32_t SC2;
  volatile uint32_t SC3;
  volatile uint32_t OFS;
  volatile uint32_t PG;
       uint8_t RESERVED_0[4];
  volatile uint32_t CLPD;
  volatile uint32_t CLPS;
  volatile uint32_t CLP4;
  volatile uint32_t CLP3;
  volatile uint32_t CLP2;
  volatile uint32_t CLP1;
  volatile uint32_t CLP0;
} ADC_Type, *ADC_MemMapPtr;
# 274 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define ADC_SC1_REG(base,index) ((base)->SC1[index])
#define ADC_SC1_COUNT 2
#define ADC_CFG1_REG(base) ((base)->CFG1)
#define ADC_CFG2_REG(base) ((base)->CFG2)
#define ADC_R_REG(base,index) ((base)->R[index])
#define ADC_R_COUNT 2
#define ADC_CV1_REG(base) ((base)->CV1)
#define ADC_CV2_REG(base) ((base)->CV2)
#define ADC_SC2_REG(base) ((base)->SC2)
#define ADC_SC3_REG(base) ((base)->SC3)
#define ADC_OFS_REG(base) ((base)->OFS)
#define ADC_PG_REG(base) ((base)->PG)
#define ADC_CLPD_REG(base) ((base)->CLPD)
#define ADC_CLPS_REG(base) ((base)->CLPS)
#define ADC_CLP4_REG(base) ((base)->CLP4)
#define ADC_CLP3_REG(base) ((base)->CLP3)
#define ADC_CLP2_REG(base) ((base)->CLP2)
#define ADC_CLP1_REG(base) ((base)->CLP1)
#define ADC_CLP0_REG(base) ((base)->CLP0)
# 309 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define ADC_SC1_ADCH_MASK 0x1Fu
#define ADC_SC1_ADCH_SHIFT 0
#define ADC_SC1_ADCH_WIDTH 5
#define ADC_SC1_ADCH(x) (((uint32_t)(((uint32_t)(x))<<ADC_SC1_ADCH_SHIFT))&ADC_SC1_ADCH_MASK)
#define ADC_SC1_AIEN_MASK 0x40u
#define ADC_SC1_AIEN_SHIFT 6
#define ADC_SC1_AIEN_WIDTH 1
#define ADC_SC1_AIEN(x) (((uint32_t)(((uint32_t)(x))<<ADC_SC1_AIEN_SHIFT))&ADC_SC1_AIEN_MASK)
#define ADC_SC1_COCO_MASK 0x80u
#define ADC_SC1_COCO_SHIFT 7
#define ADC_SC1_COCO_WIDTH 1
#define ADC_SC1_COCO(x) (((uint32_t)(((uint32_t)(x))<<ADC_SC1_COCO_SHIFT))&ADC_SC1_COCO_MASK)

#define ADC_CFG1_ADICLK_MASK 0x3u
#define ADC_CFG1_ADICLK_SHIFT 0
#define ADC_CFG1_ADICLK_WIDTH 2
#define ADC_CFG1_ADICLK(x) (((uint32_t)(((uint32_t)(x))<<ADC_CFG1_ADICLK_SHIFT))&ADC_CFG1_ADICLK_MASK)
#define ADC_CFG1_MODE_MASK 0xCu
#define ADC_CFG1_MODE_SHIFT 2
#define ADC_CFG1_MODE_WIDTH 2
#define ADC_CFG1_MODE(x) (((uint32_t)(((uint32_t)(x))<<ADC_CFG1_MODE_SHIFT))&ADC_CFG1_MODE_MASK)
#define ADC_CFG1_ADLSMP_MASK 0x10u
#define ADC_CFG1_ADLSMP_SHIFT 4
#define ADC_CFG1_ADLSMP_WIDTH 1
#define ADC_CFG1_ADLSMP(x) (((uint32_t)(((uint32_t)(x))<<ADC_CFG1_ADLSMP_SHIFT))&ADC_CFG1_ADLSMP_MASK)
#define ADC_CFG1_ADIV_MASK 0x60u
#define ADC_CFG1_ADIV_SHIFT 5
#define ADC_CFG1_ADIV_WIDTH 2
#define ADC_CFG1_ADIV(x) (((uint32_t)(((uint32_t)(x))<<ADC_CFG1_ADIV_SHIFT))&ADC_CFG1_ADIV_MASK)
#define ADC_CFG1_ADLPC_MASK 0x80u
#define ADC_CFG1_ADLPC_SHIFT 7
#define ADC_CFG1_ADLPC_WIDTH 1
#define ADC_CFG1_ADLPC(x) (((uint32_t)(((uint32_t)(x))<<ADC_CFG1_ADLPC_SHIFT))&ADC_CFG1_ADLPC_MASK)

#define ADC_CFG2_ADLSTS_MASK 0x3u
#define ADC_CFG2_ADLSTS_SHIFT 0
#define ADC_CFG2_ADLSTS_WIDTH 2
#define ADC_CFG2_ADLSTS(x) (((uint32_t)(((uint32_t)(x))<<ADC_CFG2_ADLSTS_SHIFT))&ADC_CFG2_ADLSTS_MASK)
#define ADC_CFG2_ADHSC_MASK 0x4u
#define ADC_CFG2_ADHSC_SHIFT 2
#define ADC_CFG2_ADHSC_WIDTH 1
#define ADC_CFG2_ADHSC(x) (((uint32_t)(((uint32_t)(x))<<ADC_CFG2_ADHSC_SHIFT))&ADC_CFG2_ADHSC_MASK)
#define ADC_CFG2_ADACKEN_MASK 0x8u
#define ADC_CFG2_ADACKEN_SHIFT 3
#define ADC_CFG2_ADACKEN_WIDTH 1
#define ADC_CFG2_ADACKEN(x) (((uint32_t)(((uint32_t)(x))<<ADC_CFG2_ADACKEN_SHIFT))&ADC_CFG2_ADACKEN_MASK)
#define ADC_CFG2_MUXSEL_MASK 0x10u
#define ADC_CFG2_MUXSEL_SHIFT 4
#define ADC_CFG2_MUXSEL_WIDTH 1
#define ADC_CFG2_MUXSEL(x) (((uint32_t)(((uint32_t)(x))<<ADC_CFG2_MUXSEL_SHIFT))&ADC_CFG2_MUXSEL_MASK)

#define ADC_R_D_MASK 0xFFFFu
#define ADC_R_D_SHIFT 0
#define ADC_R_D_WIDTH 16
#define ADC_R_D(x) (((uint32_t)(((uint32_t)(x))<<ADC_R_D_SHIFT))&ADC_R_D_MASK)

#define ADC_CV1_CV_MASK 0xFFFFu
#define ADC_CV1_CV_SHIFT 0
#define ADC_CV1_CV_WIDTH 16
#define ADC_CV1_CV(x) (((uint32_t)(((uint32_t)(x))<<ADC_CV1_CV_SHIFT))&ADC_CV1_CV_MASK)

#define ADC_CV2_CV_MASK 0xFFFFu
#define ADC_CV2_CV_SHIFT 0
#define ADC_CV2_CV_WIDTH 16
#define ADC_CV2_CV(x) (((uint32_t)(((uint32_t)(x))<<ADC_CV2_CV_SHIFT))&ADC_CV2_CV_MASK)

#define ADC_SC2_REFSEL_MASK 0x3u
#define ADC_SC2_REFSEL_SHIFT 0
#define ADC_SC2_REFSEL_WIDTH 2
#define ADC_SC2_REFSEL(x) (((uint32_t)(((uint32_t)(x))<<ADC_SC2_REFSEL_SHIFT))&ADC_SC2_REFSEL_MASK)
#define ADC_SC2_DMAEN_MASK 0x4u
#define ADC_SC2_DMAEN_SHIFT 2
#define ADC_SC2_DMAEN_WIDTH 1
#define ADC_SC2_DMAEN(x) (((uint32_t)(((uint32_t)(x))<<ADC_SC2_DMAEN_SHIFT))&ADC_SC2_DMAEN_MASK)
#define ADC_SC2_ACREN_MASK 0x8u
#define ADC_SC2_ACREN_SHIFT 3
#define ADC_SC2_ACREN_WIDTH 1
#define ADC_SC2_ACREN(x) (((uint32_t)(((uint32_t)(x))<<ADC_SC2_ACREN_SHIFT))&ADC_SC2_ACREN_MASK)
#define ADC_SC2_ACFGT_MASK 0x10u
#define ADC_SC2_ACFGT_SHIFT 4
#define ADC_SC2_ACFGT_WIDTH 1
#define ADC_SC2_ACFGT(x) (((uint32_t)(((uint32_t)(x))<<ADC_SC2_ACFGT_SHIFT))&ADC_SC2_ACFGT_MASK)
#define ADC_SC2_ACFE_MASK 0x20u
#define ADC_SC2_ACFE_SHIFT 5
#define ADC_SC2_ACFE_WIDTH 1
#define ADC_SC2_ACFE(x) (((uint32_t)(((uint32_t)(x))<<ADC_SC2_ACFE_SHIFT))&ADC_SC2_ACFE_MASK)
#define ADC_SC2_ADTRG_MASK 0x40u
#define ADC_SC2_ADTRG_SHIFT 6
#define ADC_SC2_ADTRG_WIDTH 1
#define ADC_SC2_ADTRG(x) (((uint32_t)(((uint32_t)(x))<<ADC_SC2_ADTRG_SHIFT))&ADC_SC2_ADTRG_MASK)
#define ADC_SC2_ADACT_MASK 0x80u
#define ADC_SC2_ADACT_SHIFT 7
#define ADC_SC2_ADACT_WIDTH 1
#define ADC_SC2_ADACT(x) (((uint32_t)(((uint32_t)(x))<<ADC_SC2_ADACT_SHIFT))&ADC_SC2_ADACT_MASK)

#define ADC_SC3_AVGS_MASK 0x3u
#define ADC_SC3_AVGS_SHIFT 0
#define ADC_SC3_AVGS_WIDTH 2
#define ADC_SC3_AVGS(x) (((uint32_t)(((uint32_t)(x))<<ADC_SC3_AVGS_SHIFT))&ADC_SC3_AVGS_MASK)
#define ADC_SC3_AVGE_MASK 0x4u
#define ADC_SC3_AVGE_SHIFT 2
#define ADC_SC3_AVGE_WIDTH 1
#define ADC_SC3_AVGE(x) (((uint32_t)(((uint32_t)(x))<<ADC_SC3_AVGE_SHIFT))&ADC_SC3_AVGE_MASK)
#define ADC_SC3_ADCO_MASK 0x8u
#define ADC_SC3_ADCO_SHIFT 3
#define ADC_SC3_ADCO_WIDTH 1
#define ADC_SC3_ADCO(x) (((uint32_t)(((uint32_t)(x))<<ADC_SC3_ADCO_SHIFT))&ADC_SC3_ADCO_MASK)
#define ADC_SC3_CALF_MASK 0x40u
#define ADC_SC3_CALF_SHIFT 6
#define ADC_SC3_CALF_WIDTH 1
#define ADC_SC3_CALF(x) (((uint32_t)(((uint32_t)(x))<<ADC_SC3_CALF_SHIFT))&ADC_SC3_CALF_MASK)
#define ADC_SC3_CAL_MASK 0x80u
#define ADC_SC3_CAL_SHIFT 7
#define ADC_SC3_CAL_WIDTH 1
#define ADC_SC3_CAL(x) (((uint32_t)(((uint32_t)(x))<<ADC_SC3_CAL_SHIFT))&ADC_SC3_CAL_MASK)

#define ADC_OFS_OFS_MASK 0xFFFFu
#define ADC_OFS_OFS_SHIFT 0
#define ADC_OFS_OFS_WIDTH 16
#define ADC_OFS_OFS(x) (((uint32_t)(((uint32_t)(x))<<ADC_OFS_OFS_SHIFT))&ADC_OFS_OFS_MASK)

#define ADC_PG_PG_MASK 0xFFFFu
#define ADC_PG_PG_SHIFT 0
#define ADC_PG_PG_WIDTH 16
#define ADC_PG_PG(x) (((uint32_t)(((uint32_t)(x))<<ADC_PG_PG_SHIFT))&ADC_PG_PG_MASK)

#define ADC_CLPD_CLPD_MASK 0x3Fu
#define ADC_CLPD_CLPD_SHIFT 0
#define ADC_CLPD_CLPD_WIDTH 6
#define ADC_CLPD_CLPD(x) (((uint32_t)(((uint32_t)(x))<<ADC_CLPD_CLPD_SHIFT))&ADC_CLPD_CLPD_MASK)

#define ADC_CLPS_CLPS_MASK 0x3Fu
#define ADC_CLPS_CLPS_SHIFT 0
#define ADC_CLPS_CLPS_WIDTH 6
#define ADC_CLPS_CLPS(x) (((uint32_t)(((uint32_t)(x))<<ADC_CLPS_CLPS_SHIFT))&ADC_CLPS_CLPS_MASK)

#define ADC_CLP4_CLP4_MASK 0x3FFu
#define ADC_CLP4_CLP4_SHIFT 0
#define ADC_CLP4_CLP4_WIDTH 10
#define ADC_CLP4_CLP4(x) (((uint32_t)(((uint32_t)(x))<<ADC_CLP4_CLP4_SHIFT))&ADC_CLP4_CLP4_MASK)

#define ADC_CLP3_CLP3_MASK 0x1FFu
#define ADC_CLP3_CLP3_SHIFT 0
#define ADC_CLP3_CLP3_WIDTH 9
#define ADC_CLP3_CLP3(x) (((uint32_t)(((uint32_t)(x))<<ADC_CLP3_CLP3_SHIFT))&ADC_CLP3_CLP3_MASK)

#define ADC_CLP2_CLP2_MASK 0xFFu
#define ADC_CLP2_CLP2_SHIFT 0
#define ADC_CLP2_CLP2_WIDTH 8
#define ADC_CLP2_CLP2(x) (((uint32_t)(((uint32_t)(x))<<ADC_CLP2_CLP2_SHIFT))&ADC_CLP2_CLP2_MASK)

#define ADC_CLP1_CLP1_MASK 0x7Fu
#define ADC_CLP1_CLP1_SHIFT 0
#define ADC_CLP1_CLP1_WIDTH 7
#define ADC_CLP1_CLP1(x) (((uint32_t)(((uint32_t)(x))<<ADC_CLP1_CLP1_SHIFT))&ADC_CLP1_CLP1_MASK)

#define ADC_CLP0_CLP0_MASK 0x3Fu
#define ADC_CLP0_CLP0_SHIFT 0
#define ADC_CLP0_CLP0_WIDTH 6
#define ADC_CLP0_CLP0(x) (((uint32_t)(((uint32_t)(x))<<ADC_CLP0_CLP0_SHIFT))&ADC_CLP0_CLP0_MASK)
# 477 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define ADC0_BASE (0x4003B000u)

#define ADC0 ((ADC_Type *)ADC0_BASE)
#define ADC0_BASE_PTR (ADC0)

#define ADC_BASE_ADDRS { ADC0_BASE }

#define ADC_BASE_PTRS { ADC0 }
# 498 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define ADC0_SC1A ADC_SC1_REG(ADC0,0)
#define ADC0_SC1B ADC_SC1_REG(ADC0,1)
#define ADC0_CFG1 ADC_CFG1_REG(ADC0)
#define ADC0_CFG2 ADC_CFG2_REG(ADC0)
#define ADC0_RA ADC_R_REG(ADC0,0)
#define ADC0_RB ADC_R_REG(ADC0,1)
#define ADC0_CV1 ADC_CV1_REG(ADC0)
#define ADC0_CV2 ADC_CV2_REG(ADC0)
#define ADC0_SC2 ADC_SC2_REG(ADC0)
#define ADC0_SC3 ADC_SC3_REG(ADC0)
#define ADC0_OFS ADC_OFS_REG(ADC0)
#define ADC0_PG ADC_PG_REG(ADC0)
#define ADC0_CLPD ADC_CLPD_REG(ADC0)
#define ADC0_CLPS ADC_CLPS_REG(ADC0)
#define ADC0_CLP4 ADC_CLP4_REG(ADC0)
#define ADC0_CLP3 ADC_CLP3_REG(ADC0)
#define ADC0_CLP2 ADC_CLP2_REG(ADC0)
#define ADC0_CLP1 ADC_CLP1_REG(ADC0)
#define ADC0_CLP0 ADC_CLP0_REG(ADC0)


#define ADC0_SC1(index) ADC_SC1_REG(ADC0,index)
#define ADC0_R(index) ADC_R_REG(ADC0,index)
# 542 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint8_t CR0;
  volatile uint8_t CR1;
  volatile uint8_t FPR;
  volatile uint8_t SCR;
  volatile uint8_t DACCR;
  volatile uint8_t MUXCR;
} CMP_Type, *CMP_MemMapPtr;
# 562 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define CMP_CR0_REG(base) ((base)->CR0)
#define CMP_CR1_REG(base) ((base)->CR1)
#define CMP_FPR_REG(base) ((base)->FPR)
#define CMP_SCR_REG(base) ((base)->SCR)
#define CMP_DACCR_REG(base) ((base)->DACCR)
#define CMP_MUXCR_REG(base) ((base)->MUXCR)
# 584 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define CMP_CR0_HYSTCTR_MASK 0x3u
#define CMP_CR0_HYSTCTR_SHIFT 0
#define CMP_CR0_HYSTCTR_WIDTH 2
#define CMP_CR0_HYSTCTR(x) (((uint8_t)(((uint8_t)(x))<<CMP_CR0_HYSTCTR_SHIFT))&CMP_CR0_HYSTCTR_MASK)
#define CMP_CR0_FILTER_CNT_MASK 0x70u
#define CMP_CR0_FILTER_CNT_SHIFT 4
#define CMP_CR0_FILTER_CNT_WIDTH 3
#define CMP_CR0_FILTER_CNT(x) (((uint8_t)(((uint8_t)(x))<<CMP_CR0_FILTER_CNT_SHIFT))&CMP_CR0_FILTER_CNT_MASK)

#define CMP_CR1_EN_MASK 0x1u
#define CMP_CR1_EN_SHIFT 0
#define CMP_CR1_EN_WIDTH 1
#define CMP_CR1_EN(x) (((uint8_t)(((uint8_t)(x))<<CMP_CR1_EN_SHIFT))&CMP_CR1_EN_MASK)
#define CMP_CR1_OPE_MASK 0x2u
#define CMP_CR1_OPE_SHIFT 1
#define CMP_CR1_OPE_WIDTH 1
#define CMP_CR1_OPE(x) (((uint8_t)(((uint8_t)(x))<<CMP_CR1_OPE_SHIFT))&CMP_CR1_OPE_MASK)
#define CMP_CR1_COS_MASK 0x4u
#define CMP_CR1_COS_SHIFT 2
#define CMP_CR1_COS_WIDTH 1
#define CMP_CR1_COS(x) (((uint8_t)(((uint8_t)(x))<<CMP_CR1_COS_SHIFT))&CMP_CR1_COS_MASK)
#define CMP_CR1_INV_MASK 0x8u
#define CMP_CR1_INV_SHIFT 3
#define CMP_CR1_INV_WIDTH 1
#define CMP_CR1_INV(x) (((uint8_t)(((uint8_t)(x))<<CMP_CR1_INV_SHIFT))&CMP_CR1_INV_MASK)
#define CMP_CR1_PMODE_MASK 0x10u
#define CMP_CR1_PMODE_SHIFT 4
#define CMP_CR1_PMODE_WIDTH 1
#define CMP_CR1_PMODE(x) (((uint8_t)(((uint8_t)(x))<<CMP_CR1_PMODE_SHIFT))&CMP_CR1_PMODE_MASK)
#define CMP_CR1_TRIGM_MASK 0x20u
#define CMP_CR1_TRIGM_SHIFT 5
#define CMP_CR1_TRIGM_WIDTH 1
#define CMP_CR1_TRIGM(x) (((uint8_t)(((uint8_t)(x))<<CMP_CR1_TRIGM_SHIFT))&CMP_CR1_TRIGM_MASK)
#define CMP_CR1_WE_MASK 0x40u
#define CMP_CR1_WE_SHIFT 6
#define CMP_CR1_WE_WIDTH 1
#define CMP_CR1_WE(x) (((uint8_t)(((uint8_t)(x))<<CMP_CR1_WE_SHIFT))&CMP_CR1_WE_MASK)
#define CMP_CR1_SE_MASK 0x80u
#define CMP_CR1_SE_SHIFT 7
#define CMP_CR1_SE_WIDTH 1
#define CMP_CR1_SE(x) (((uint8_t)(((uint8_t)(x))<<CMP_CR1_SE_SHIFT))&CMP_CR1_SE_MASK)

#define CMP_FPR_FILT_PER_MASK 0xFFu
#define CMP_FPR_FILT_PER_SHIFT 0
#define CMP_FPR_FILT_PER_WIDTH 8
#define CMP_FPR_FILT_PER(x) (((uint8_t)(((uint8_t)(x))<<CMP_FPR_FILT_PER_SHIFT))&CMP_FPR_FILT_PER_MASK)

#define CMP_SCR_COUT_MASK 0x1u
#define CMP_SCR_COUT_SHIFT 0
#define CMP_SCR_COUT_WIDTH 1
#define CMP_SCR_COUT(x) (((uint8_t)(((uint8_t)(x))<<CMP_SCR_COUT_SHIFT))&CMP_SCR_COUT_MASK)
#define CMP_SCR_CFF_MASK 0x2u
#define CMP_SCR_CFF_SHIFT 1
#define CMP_SCR_CFF_WIDTH 1
#define CMP_SCR_CFF(x) (((uint8_t)(((uint8_t)(x))<<CMP_SCR_CFF_SHIFT))&CMP_SCR_CFF_MASK)
#define CMP_SCR_CFR_MASK 0x4u
#define CMP_SCR_CFR_SHIFT 2
#define CMP_SCR_CFR_WIDTH 1
#define CMP_SCR_CFR(x) (((uint8_t)(((uint8_t)(x))<<CMP_SCR_CFR_SHIFT))&CMP_SCR_CFR_MASK)
#define CMP_SCR_IEF_MASK 0x8u
#define CMP_SCR_IEF_SHIFT 3
#define CMP_SCR_IEF_WIDTH 1
#define CMP_SCR_IEF(x) (((uint8_t)(((uint8_t)(x))<<CMP_SCR_IEF_SHIFT))&CMP_SCR_IEF_MASK)
#define CMP_SCR_IER_MASK 0x10u
#define CMP_SCR_IER_SHIFT 4
#define CMP_SCR_IER_WIDTH 1
#define CMP_SCR_IER(x) (((uint8_t)(((uint8_t)(x))<<CMP_SCR_IER_SHIFT))&CMP_SCR_IER_MASK)
#define CMP_SCR_DMAEN_MASK 0x40u
#define CMP_SCR_DMAEN_SHIFT 6
#define CMP_SCR_DMAEN_WIDTH 1
#define CMP_SCR_DMAEN(x) (((uint8_t)(((uint8_t)(x))<<CMP_SCR_DMAEN_SHIFT))&CMP_SCR_DMAEN_MASK)

#define CMP_DACCR_VOSEL_MASK 0x3Fu
#define CMP_DACCR_VOSEL_SHIFT 0
#define CMP_DACCR_VOSEL_WIDTH 6
#define CMP_DACCR_VOSEL(x) (((uint8_t)(((uint8_t)(x))<<CMP_DACCR_VOSEL_SHIFT))&CMP_DACCR_VOSEL_MASK)
#define CMP_DACCR_VRSEL_MASK 0x40u
#define CMP_DACCR_VRSEL_SHIFT 6
#define CMP_DACCR_VRSEL_WIDTH 1
#define CMP_DACCR_VRSEL(x) (((uint8_t)(((uint8_t)(x))<<CMP_DACCR_VRSEL_SHIFT))&CMP_DACCR_VRSEL_MASK)
#define CMP_DACCR_DACEN_MASK 0x80u
#define CMP_DACCR_DACEN_SHIFT 7
#define CMP_DACCR_DACEN_WIDTH 1
#define CMP_DACCR_DACEN(x) (((uint8_t)(((uint8_t)(x))<<CMP_DACCR_DACEN_SHIFT))&CMP_DACCR_DACEN_MASK)

#define CMP_MUXCR_MSEL_MASK 0x7u
#define CMP_MUXCR_MSEL_SHIFT 0
#define CMP_MUXCR_MSEL_WIDTH 3
#define CMP_MUXCR_MSEL(x) (((uint8_t)(((uint8_t)(x))<<CMP_MUXCR_MSEL_SHIFT))&CMP_MUXCR_MSEL_MASK)
#define CMP_MUXCR_PSEL_MASK 0x38u
#define CMP_MUXCR_PSEL_SHIFT 3
#define CMP_MUXCR_PSEL_WIDTH 3
#define CMP_MUXCR_PSEL(x) (((uint8_t)(((uint8_t)(x))<<CMP_MUXCR_PSEL_SHIFT))&CMP_MUXCR_PSEL_MASK)
#define CMP_MUXCR_PSTM_MASK 0x80u
#define CMP_MUXCR_PSTM_SHIFT 7
#define CMP_MUXCR_PSTM_WIDTH 1
#define CMP_MUXCR_PSTM(x) (((uint8_t)(((uint8_t)(x))<<CMP_MUXCR_PSTM_SHIFT))&CMP_MUXCR_PSTM_MASK)
# 689 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define CMP0_BASE (0x40073000u)

#define CMP0 ((CMP_Type *)CMP0_BASE)
#define CMP0_BASE_PTR (CMP0)

#define CMP_BASE_ADDRS { CMP0_BASE }

#define CMP_BASE_PTRS { CMP0 }
# 710 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define CMP0_CR0 CMP_CR0_REG(CMP0)
#define CMP0_CR1 CMP_CR1_REG(CMP0)
#define CMP0_FPR CMP_FPR_REG(CMP0)
#define CMP0_SCR CMP_SCR_REG(CMP0)
#define CMP0_DACCR CMP_DACCR_REG(CMP0)
#define CMP0_MUXCR CMP_MUXCR_REG(CMP0)
# 737 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  struct {
    volatile uint8_t DATL;
    volatile uint8_t DATH;
  } DAT[2];
       uint8_t RESERVED_0[28];
  volatile uint8_t SR;
  volatile uint8_t C0;
  volatile uint8_t C1;
  volatile uint8_t C2;
} DAC_Type, *DAC_MemMapPtr;
# 760 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define DAC_DATL_REG(base,index) ((base)->DAT[index].DATL)
#define DAC_DATL_COUNT 2
#define DAC_DATH_REG(base,index) ((base)->DAT[index].DATH)
#define DAC_DATH_COUNT 2
#define DAC_SR_REG(base) ((base)->SR)
#define DAC_C0_REG(base) ((base)->C0)
#define DAC_C1_REG(base) ((base)->C1)
#define DAC_C2_REG(base) ((base)->C2)
# 784 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define DAC_DATL_DATA0_MASK 0xFFu
#define DAC_DATL_DATA0_SHIFT 0
#define DAC_DATL_DATA0_WIDTH 8
#define DAC_DATL_DATA0(x) (((uint8_t)(((uint8_t)(x))<<DAC_DATL_DATA0_SHIFT))&DAC_DATL_DATA0_MASK)

#define DAC_DATH_DATA1_MASK 0xFu
#define DAC_DATH_DATA1_SHIFT 0
#define DAC_DATH_DATA1_WIDTH 4
#define DAC_DATH_DATA1(x) (((uint8_t)(((uint8_t)(x))<<DAC_DATH_DATA1_SHIFT))&DAC_DATH_DATA1_MASK)

#define DAC_SR_DACBFRPBF_MASK 0x1u
#define DAC_SR_DACBFRPBF_SHIFT 0
#define DAC_SR_DACBFRPBF_WIDTH 1
#define DAC_SR_DACBFRPBF(x) (((uint8_t)(((uint8_t)(x))<<DAC_SR_DACBFRPBF_SHIFT))&DAC_SR_DACBFRPBF_MASK)
#define DAC_SR_DACBFRPTF_MASK 0x2u
#define DAC_SR_DACBFRPTF_SHIFT 1
#define DAC_SR_DACBFRPTF_WIDTH 1
#define DAC_SR_DACBFRPTF(x) (((uint8_t)(((uint8_t)(x))<<DAC_SR_DACBFRPTF_SHIFT))&DAC_SR_DACBFRPTF_MASK)

#define DAC_C0_DACBBIEN_MASK 0x1u
#define DAC_C0_DACBBIEN_SHIFT 0
#define DAC_C0_DACBBIEN_WIDTH 1
#define DAC_C0_DACBBIEN(x) (((uint8_t)(((uint8_t)(x))<<DAC_C0_DACBBIEN_SHIFT))&DAC_C0_DACBBIEN_MASK)
#define DAC_C0_DACBTIEN_MASK 0x2u
#define DAC_C0_DACBTIEN_SHIFT 1
#define DAC_C0_DACBTIEN_WIDTH 1
#define DAC_C0_DACBTIEN(x) (((uint8_t)(((uint8_t)(x))<<DAC_C0_DACBTIEN_SHIFT))&DAC_C0_DACBTIEN_MASK)
#define DAC_C0_LPEN_MASK 0x8u
#define DAC_C0_LPEN_SHIFT 3
#define DAC_C0_LPEN_WIDTH 1
#define DAC_C0_LPEN(x) (((uint8_t)(((uint8_t)(x))<<DAC_C0_LPEN_SHIFT))&DAC_C0_LPEN_MASK)
#define DAC_C0_DACSWTRG_MASK 0x10u
#define DAC_C0_DACSWTRG_SHIFT 4
#define DAC_C0_DACSWTRG_WIDTH 1
#define DAC_C0_DACSWTRG(x) (((uint8_t)(((uint8_t)(x))<<DAC_C0_DACSWTRG_SHIFT))&DAC_C0_DACSWTRG_MASK)
#define DAC_C0_DACTRGSEL_MASK 0x20u
#define DAC_C0_DACTRGSEL_SHIFT 5
#define DAC_C0_DACTRGSEL_WIDTH 1
#define DAC_C0_DACTRGSEL(x) (((uint8_t)(((uint8_t)(x))<<DAC_C0_DACTRGSEL_SHIFT))&DAC_C0_DACTRGSEL_MASK)
#define DAC_C0_DACRFS_MASK 0x40u
#define DAC_C0_DACRFS_SHIFT 6
#define DAC_C0_DACRFS_WIDTH 1
#define DAC_C0_DACRFS(x) (((uint8_t)(((uint8_t)(x))<<DAC_C0_DACRFS_SHIFT))&DAC_C0_DACRFS_MASK)
#define DAC_C0_DACEN_MASK 0x80u
#define DAC_C0_DACEN_SHIFT 7
#define DAC_C0_DACEN_WIDTH 1
#define DAC_C0_DACEN(x) (((uint8_t)(((uint8_t)(x))<<DAC_C0_DACEN_SHIFT))&DAC_C0_DACEN_MASK)

#define DAC_C1_DACBFEN_MASK 0x1u
#define DAC_C1_DACBFEN_SHIFT 0
#define DAC_C1_DACBFEN_WIDTH 1
#define DAC_C1_DACBFEN(x) (((uint8_t)(((uint8_t)(x))<<DAC_C1_DACBFEN_SHIFT))&DAC_C1_DACBFEN_MASK)
#define DAC_C1_DACBFMD_MASK 0x4u
#define DAC_C1_DACBFMD_SHIFT 2
#define DAC_C1_DACBFMD_WIDTH 1
#define DAC_C1_DACBFMD(x) (((uint8_t)(((uint8_t)(x))<<DAC_C1_DACBFMD_SHIFT))&DAC_C1_DACBFMD_MASK)
#define DAC_C1_DMAEN_MASK 0x80u
#define DAC_C1_DMAEN_SHIFT 7
#define DAC_C1_DMAEN_WIDTH 1
#define DAC_C1_DMAEN(x) (((uint8_t)(((uint8_t)(x))<<DAC_C1_DMAEN_SHIFT))&DAC_C1_DMAEN_MASK)

#define DAC_C2_DACBFUP_MASK 0x1u
#define DAC_C2_DACBFUP_SHIFT 0
#define DAC_C2_DACBFUP_WIDTH 1
#define DAC_C2_DACBFUP(x) (((uint8_t)(((uint8_t)(x))<<DAC_C2_DACBFUP_SHIFT))&DAC_C2_DACBFUP_MASK)
#define DAC_C2_DACBFRP_MASK 0x10u
#define DAC_C2_DACBFRP_SHIFT 4
#define DAC_C2_DACBFRP_WIDTH 1
#define DAC_C2_DACBFRP(x) (((uint8_t)(((uint8_t)(x))<<DAC_C2_DACBFRP_SHIFT))&DAC_C2_DACBFRP_MASK)
# 861 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define DAC0_BASE (0x4003F000u)

#define DAC0 ((DAC_Type *)DAC0_BASE)
#define DAC0_BASE_PTR (DAC0)

#define DAC_BASE_ADDRS { DAC0_BASE }

#define DAC_BASE_PTRS { DAC0 }
# 882 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define DAC0_DAT0L DAC_DATL_REG(DAC0,0)
#define DAC0_DAT0H DAC_DATH_REG(DAC0,0)
#define DAC0_DAT1L DAC_DATL_REG(DAC0,1)
#define DAC0_DAT1H DAC_DATH_REG(DAC0,1)
#define DAC0_SR DAC_SR_REG(DAC0)
#define DAC0_C0 DAC_C0_REG(DAC0)
#define DAC0_C1 DAC_C1_REG(DAC0)
#define DAC0_C2 DAC_C2_REG(DAC0)


#define DAC0_DATL(index) DAC_DATL_REG(DAC0,index)
#define DAC0_DATH(index) DAC_DATH_REG(DAC0,index)
# 915 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
       uint8_t RESERVED_0[256];
  struct {
    volatile uint32_t SAR;
    volatile uint32_t DAR;
    union {
      volatile uint32_t DSR_BCR;
      struct {
             uint8_t RESERVED_0[3];
        volatile uint8_t DSR;
      } DMA_DSR_ACCESS8BIT;
    };
    volatile uint32_t DCR;
  } DMA[4];
} DMA_Type, *DMA_MemMapPtr;
# 942 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define DMA_SAR_REG(base,index) ((base)->DMA[index].SAR)
#define DMA_SAR_COUNT 4
#define DMA_DAR_REG(base,index) ((base)->DMA[index].DAR)
#define DMA_DAR_COUNT 4
#define DMA_DSR_BCR_REG(base,index) ((base)->DMA[index].DSR_BCR)
#define DMA_DSR_BCR_COUNT 4
#define DMA_DSR_REG(base,index) ((base)->DMA[index].DMA_DSR_ACCESS8BIT.DSR)
#define DMA_DSR_COUNT 4
#define DMA_DCR_REG(base,index) ((base)->DMA[index].DCR)
#define DMA_DCR_COUNT 4
# 968 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define DMA_SAR_SAR_MASK 0xFFFFFFFFu
#define DMA_SAR_SAR_SHIFT 0
#define DMA_SAR_SAR_WIDTH 32
#define DMA_SAR_SAR(x) (((uint32_t)(((uint32_t)(x))<<DMA_SAR_SAR_SHIFT))&DMA_SAR_SAR_MASK)

#define DMA_DAR_DAR_MASK 0xFFFFFFFFu
#define DMA_DAR_DAR_SHIFT 0
#define DMA_DAR_DAR_WIDTH 32
#define DMA_DAR_DAR(x) (((uint32_t)(((uint32_t)(x))<<DMA_DAR_DAR_SHIFT))&DMA_DAR_DAR_MASK)

#define DMA_DSR_BCR_BCR_MASK 0xFFFFFFu
#define DMA_DSR_BCR_BCR_SHIFT 0
#define DMA_DSR_BCR_BCR_WIDTH 24
#define DMA_DSR_BCR_BCR(x) (((uint32_t)(((uint32_t)(x))<<DMA_DSR_BCR_BCR_SHIFT))&DMA_DSR_BCR_BCR_MASK)
#define DMA_DSR_BCR_DONE_MASK 0x1000000u
#define DMA_DSR_BCR_DONE_SHIFT 24
#define DMA_DSR_BCR_DONE_WIDTH 1
#define DMA_DSR_BCR_DONE(x) (((uint32_t)(((uint32_t)(x))<<DMA_DSR_BCR_DONE_SHIFT))&DMA_DSR_BCR_DONE_MASK)
#define DMA_DSR_BCR_BSY_MASK 0x2000000u
#define DMA_DSR_BCR_BSY_SHIFT 25
#define DMA_DSR_BCR_BSY_WIDTH 1
#define DMA_DSR_BCR_BSY(x) (((uint32_t)(((uint32_t)(x))<<DMA_DSR_BCR_BSY_SHIFT))&DMA_DSR_BCR_BSY_MASK)
#define DMA_DSR_BCR_REQ_MASK 0x4000000u
#define DMA_DSR_BCR_REQ_SHIFT 26
#define DMA_DSR_BCR_REQ_WIDTH 1
#define DMA_DSR_BCR_REQ(x) (((uint32_t)(((uint32_t)(x))<<DMA_DSR_BCR_REQ_SHIFT))&DMA_DSR_BCR_REQ_MASK)
#define DMA_DSR_BCR_BED_MASK 0x10000000u
#define DMA_DSR_BCR_BED_SHIFT 28
#define DMA_DSR_BCR_BED_WIDTH 1
#define DMA_DSR_BCR_BED(x) (((uint32_t)(((uint32_t)(x))<<DMA_DSR_BCR_BED_SHIFT))&DMA_DSR_BCR_BED_MASK)
#define DMA_DSR_BCR_BES_MASK 0x20000000u
#define DMA_DSR_BCR_BES_SHIFT 29
#define DMA_DSR_BCR_BES_WIDTH 1
#define DMA_DSR_BCR_BES(x) (((uint32_t)(((uint32_t)(x))<<DMA_DSR_BCR_BES_SHIFT))&DMA_DSR_BCR_BES_MASK)
#define DMA_DSR_BCR_CE_MASK 0x40000000u
#define DMA_DSR_BCR_CE_SHIFT 30
#define DMA_DSR_BCR_CE_WIDTH 1
#define DMA_DSR_BCR_CE(x) (((uint32_t)(((uint32_t)(x))<<DMA_DSR_BCR_CE_SHIFT))&DMA_DSR_BCR_CE_MASK)

#define DMA_DCR_LCH2_MASK 0x3u
#define DMA_DCR_LCH2_SHIFT 0
#define DMA_DCR_LCH2_WIDTH 2
#define DMA_DCR_LCH2(x) (((uint32_t)(((uint32_t)(x))<<DMA_DCR_LCH2_SHIFT))&DMA_DCR_LCH2_MASK)
#define DMA_DCR_LCH1_MASK 0xCu
#define DMA_DCR_LCH1_SHIFT 2
#define DMA_DCR_LCH1_WIDTH 2
#define DMA_DCR_LCH1(x) (((uint32_t)(((uint32_t)(x))<<DMA_DCR_LCH1_SHIFT))&DMA_DCR_LCH1_MASK)
#define DMA_DCR_LINKCC_MASK 0x30u
#define DMA_DCR_LINKCC_SHIFT 4
#define DMA_DCR_LINKCC_WIDTH 2
#define DMA_DCR_LINKCC(x) (((uint32_t)(((uint32_t)(x))<<DMA_DCR_LINKCC_SHIFT))&DMA_DCR_LINKCC_MASK)
#define DMA_DCR_D_REQ_MASK 0x80u
#define DMA_DCR_D_REQ_SHIFT 7
#define DMA_DCR_D_REQ_WIDTH 1
#define DMA_DCR_D_REQ(x) (((uint32_t)(((uint32_t)(x))<<DMA_DCR_D_REQ_SHIFT))&DMA_DCR_D_REQ_MASK)
#define DMA_DCR_DMOD_MASK 0xF00u
#define DMA_DCR_DMOD_SHIFT 8
#define DMA_DCR_DMOD_WIDTH 4
#define DMA_DCR_DMOD(x) (((uint32_t)(((uint32_t)(x))<<DMA_DCR_DMOD_SHIFT))&DMA_DCR_DMOD_MASK)
#define DMA_DCR_SMOD_MASK 0xF000u
#define DMA_DCR_SMOD_SHIFT 12
#define DMA_DCR_SMOD_WIDTH 4
#define DMA_DCR_SMOD(x) (((uint32_t)(((uint32_t)(x))<<DMA_DCR_SMOD_SHIFT))&DMA_DCR_SMOD_MASK)
#define DMA_DCR_START_MASK 0x10000u
#define DMA_DCR_START_SHIFT 16
#define DMA_DCR_START_WIDTH 1
#define DMA_DCR_START(x) (((uint32_t)(((uint32_t)(x))<<DMA_DCR_START_SHIFT))&DMA_DCR_START_MASK)
#define DMA_DCR_DSIZE_MASK 0x60000u
#define DMA_DCR_DSIZE_SHIFT 17
#define DMA_DCR_DSIZE_WIDTH 2
#define DMA_DCR_DSIZE(x) (((uint32_t)(((uint32_t)(x))<<DMA_DCR_DSIZE_SHIFT))&DMA_DCR_DSIZE_MASK)
#define DMA_DCR_DINC_MASK 0x80000u
#define DMA_DCR_DINC_SHIFT 19
#define DMA_DCR_DINC_WIDTH 1
#define DMA_DCR_DINC(x) (((uint32_t)(((uint32_t)(x))<<DMA_DCR_DINC_SHIFT))&DMA_DCR_DINC_MASK)
#define DMA_DCR_SSIZE_MASK 0x300000u
#define DMA_DCR_SSIZE_SHIFT 20
#define DMA_DCR_SSIZE_WIDTH 2
#define DMA_DCR_SSIZE(x) (((uint32_t)(((uint32_t)(x))<<DMA_DCR_SSIZE_SHIFT))&DMA_DCR_SSIZE_MASK)
#define DMA_DCR_SINC_MASK 0x400000u
#define DMA_DCR_SINC_SHIFT 22
#define DMA_DCR_SINC_WIDTH 1
#define DMA_DCR_SINC(x) (((uint32_t)(((uint32_t)(x))<<DMA_DCR_SINC_SHIFT))&DMA_DCR_SINC_MASK)
#define DMA_DCR_EADREQ_MASK 0x800000u
#define DMA_DCR_EADREQ_SHIFT 23
#define DMA_DCR_EADREQ_WIDTH 1
#define DMA_DCR_EADREQ(x) (((uint32_t)(((uint32_t)(x))<<DMA_DCR_EADREQ_SHIFT))&DMA_DCR_EADREQ_MASK)
#define DMA_DCR_AA_MASK 0x10000000u
#define DMA_DCR_AA_SHIFT 28
#define DMA_DCR_AA_WIDTH 1
#define DMA_DCR_AA(x) (((uint32_t)(((uint32_t)(x))<<DMA_DCR_AA_SHIFT))&DMA_DCR_AA_MASK)
#define DMA_DCR_CS_MASK 0x20000000u
#define DMA_DCR_CS_SHIFT 29
#define DMA_DCR_CS_WIDTH 1
#define DMA_DCR_CS(x) (((uint32_t)(((uint32_t)(x))<<DMA_DCR_CS_SHIFT))&DMA_DCR_CS_MASK)
#define DMA_DCR_ERQ_MASK 0x40000000u
#define DMA_DCR_ERQ_SHIFT 30
#define DMA_DCR_ERQ_WIDTH 1
#define DMA_DCR_ERQ(x) (((uint32_t)(((uint32_t)(x))<<DMA_DCR_ERQ_SHIFT))&DMA_DCR_ERQ_MASK)
#define DMA_DCR_EINT_MASK 0x80000000u
#define DMA_DCR_EINT_SHIFT 31
#define DMA_DCR_EINT_WIDTH 1
#define DMA_DCR_EINT(x) (((uint32_t)(((uint32_t)(x))<<DMA_DCR_EINT_SHIFT))&DMA_DCR_EINT_MASK)
# 1079 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define DMA_BASE (0x40008000u)

#define DMA0 ((DMA_Type *)DMA_BASE)
#define DMA_BASE_PTR (DMA0)

#define DMA_BASE_ADDRS { DMA_BASE }

#define DMA_BASE_PTRS { DMA0 }
# 1100 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define DMA_SAR0 DMA_SAR_REG(DMA0,0)
#define DMA_DAR0 DMA_DAR_REG(DMA0,0)
#define DMA_DSR_BCR0 DMA_DSR_BCR_REG(DMA0,0)
#define DMA_DSR0 DMA_DSR_REG(DMA0,0)
#define DMA_DCR0 DMA_DCR_REG(DMA0,0)
#define DMA_SAR1 DMA_SAR_REG(DMA0,1)
#define DMA_DAR1 DMA_DAR_REG(DMA0,1)
#define DMA_DSR_BCR1 DMA_DSR_BCR_REG(DMA0,1)
#define DMA_DSR1 DMA_DSR_REG(DMA0,1)
#define DMA_DCR1 DMA_DCR_REG(DMA0,1)
#define DMA_SAR2 DMA_SAR_REG(DMA0,2)
#define DMA_DAR2 DMA_DAR_REG(DMA0,2)
#define DMA_DSR_BCR2 DMA_DSR_BCR_REG(DMA0,2)
#define DMA_DSR2 DMA_DSR_REG(DMA0,2)
#define DMA_DCR2 DMA_DCR_REG(DMA0,2)
#define DMA_SAR3 DMA_SAR_REG(DMA0,3)
#define DMA_DAR3 DMA_DAR_REG(DMA0,3)
#define DMA_DSR_BCR3 DMA_DSR_BCR_REG(DMA0,3)
#define DMA_DSR3 DMA_DSR_REG(DMA0,3)
#define DMA_DCR3 DMA_DCR_REG(DMA0,3)


#define DMA_SAR(index) DMA_SAR_REG(DMA0,index)
#define DMA_DAR(index) DMA_DAR_REG(DMA0,index)
#define DMA_DSR_BCR(index) DMA_DSR_BCR_REG(DMA0,index)
#define DMA_DSR(index) DMA_DSR_REG(DMA0,index)
#define DMA_DCR(index) DMA_DCR_REG(DMA0,index)
# 1148 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint8_t CHCFG[4];
} DMAMUX_Type, *DMAMUX_MemMapPtr;
# 1163 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define DMAMUX_CHCFG_REG(base,index) ((base)->CHCFG[index])
#define DMAMUX_CHCFG_COUNT 4
# 1181 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define DMAMUX_CHCFG_SOURCE_MASK 0x3Fu
#define DMAMUX_CHCFG_SOURCE_SHIFT 0
#define DMAMUX_CHCFG_SOURCE_WIDTH 6
#define DMAMUX_CHCFG_SOURCE(x) (((uint8_t)(((uint8_t)(x))<<DMAMUX_CHCFG_SOURCE_SHIFT))&DMAMUX_CHCFG_SOURCE_MASK)
#define DMAMUX_CHCFG_TRIG_MASK 0x40u
#define DMAMUX_CHCFG_TRIG_SHIFT 6
#define DMAMUX_CHCFG_TRIG_WIDTH 1
#define DMAMUX_CHCFG_TRIG(x) (((uint8_t)(((uint8_t)(x))<<DMAMUX_CHCFG_TRIG_SHIFT))&DMAMUX_CHCFG_TRIG_MASK)
#define DMAMUX_CHCFG_ENBL_MASK 0x80u
#define DMAMUX_CHCFG_ENBL_SHIFT 7
#define DMAMUX_CHCFG_ENBL_WIDTH 1
#define DMAMUX_CHCFG_ENBL(x) (((uint8_t)(((uint8_t)(x))<<DMAMUX_CHCFG_ENBL_SHIFT))&DMAMUX_CHCFG_ENBL_MASK)
# 1201 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define DMAMUX0_BASE (0x40021000u)

#define DMAMUX0 ((DMAMUX_Type *)DMAMUX0_BASE)
#define DMAMUX0_BASE_PTR (DMAMUX0)

#define DMAMUX_BASE_ADDRS { DMAMUX0_BASE }

#define DMAMUX_BASE_PTRS { DMAMUX0 }
# 1222 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define DMAMUX0_CHCFG0 DMAMUX_CHCFG_REG(DMAMUX0,0)
#define DMAMUX0_CHCFG1 DMAMUX_CHCFG_REG(DMAMUX0,1)
#define DMAMUX0_CHCFG2 DMAMUX_CHCFG_REG(DMAMUX0,2)
#define DMAMUX0_CHCFG3 DMAMUX_CHCFG_REG(DMAMUX0,3)


#define DMAMUX0_CHCFG(index) DMAMUX_CHCFG_REG(DMAMUX0,index)
# 1250 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint32_t PDOR;
  volatile uint32_t PSOR;
  volatile uint32_t PCOR;
  volatile uint32_t PTOR;
  volatile const uint32_t PDIR;
  volatile uint32_t PDDR;
} FGPIO_Type, *FGPIO_MemMapPtr;
# 1270 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define FGPIO_PDOR_REG(base) ((base)->PDOR)
#define FGPIO_PSOR_REG(base) ((base)->PSOR)
#define FGPIO_PCOR_REG(base) ((base)->PCOR)
#define FGPIO_PTOR_REG(base) ((base)->PTOR)
#define FGPIO_PDIR_REG(base) ((base)->PDIR)
#define FGPIO_PDDR_REG(base) ((base)->PDDR)
# 1292 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define FGPIO_PDOR_PDO_MASK 0xFFFFFFFFu
#define FGPIO_PDOR_PDO_SHIFT 0
#define FGPIO_PDOR_PDO_WIDTH 32
#define FGPIO_PDOR_PDO(x) (((uint32_t)(((uint32_t)(x))<<FGPIO_PDOR_PDO_SHIFT))&FGPIO_PDOR_PDO_MASK)

#define FGPIO_PSOR_PTSO_MASK 0xFFFFFFFFu
#define FGPIO_PSOR_PTSO_SHIFT 0
#define FGPIO_PSOR_PTSO_WIDTH 32
#define FGPIO_PSOR_PTSO(x) (((uint32_t)(((uint32_t)(x))<<FGPIO_PSOR_PTSO_SHIFT))&FGPIO_PSOR_PTSO_MASK)

#define FGPIO_PCOR_PTCO_MASK 0xFFFFFFFFu
#define FGPIO_PCOR_PTCO_SHIFT 0
#define FGPIO_PCOR_PTCO_WIDTH 32
#define FGPIO_PCOR_PTCO(x) (((uint32_t)(((uint32_t)(x))<<FGPIO_PCOR_PTCO_SHIFT))&FGPIO_PCOR_PTCO_MASK)

#define FGPIO_PTOR_PTTO_MASK 0xFFFFFFFFu
#define FGPIO_PTOR_PTTO_SHIFT 0
#define FGPIO_PTOR_PTTO_WIDTH 32
#define FGPIO_PTOR_PTTO(x) (((uint32_t)(((uint32_t)(x))<<FGPIO_PTOR_PTTO_SHIFT))&FGPIO_PTOR_PTTO_MASK)

#define FGPIO_PDIR_PDI_MASK 0xFFFFFFFFu
#define FGPIO_PDIR_PDI_SHIFT 0
#define FGPIO_PDIR_PDI_WIDTH 32
#define FGPIO_PDIR_PDI(x) (((uint32_t)(((uint32_t)(x))<<FGPIO_PDIR_PDI_SHIFT))&FGPIO_PDIR_PDI_MASK)

#define FGPIO_PDDR_PDD_MASK 0xFFFFFFFFu
#define FGPIO_PDDR_PDD_SHIFT 0
#define FGPIO_PDDR_PDD_WIDTH 32
#define FGPIO_PDDR_PDD(x) (((uint32_t)(((uint32_t)(x))<<FGPIO_PDDR_PDD_SHIFT))&FGPIO_PDDR_PDD_MASK)
# 1329 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define FGPIOA_BASE (0xF80FF000u)

#define FGPIOA ((FGPIO_Type *)FGPIOA_BASE)
#define FGPIOA_BASE_PTR (FGPIOA)

#define FGPIOB_BASE (0xF80FF040u)

#define FGPIOB ((FGPIO_Type *)FGPIOB_BASE)
#define FGPIOB_BASE_PTR (FGPIOB)

#define FGPIO_BASE_ADDRS { FGPIOA_BASE, FGPIOB_BASE }

#define FGPIO_BASE_PTRS { FGPIOA, FGPIOB }
# 1355 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define FGPIOA_PDOR FGPIO_PDOR_REG(FGPIOA)
#define FGPIOA_PSOR FGPIO_PSOR_REG(FGPIOA)
#define FGPIOA_PCOR FGPIO_PCOR_REG(FGPIOA)
#define FGPIOA_PTOR FGPIO_PTOR_REG(FGPIOA)
#define FGPIOA_PDIR FGPIO_PDIR_REG(FGPIOA)
#define FGPIOA_PDDR FGPIO_PDDR_REG(FGPIOA)

#define FGPIOB_PDOR FGPIO_PDOR_REG(FGPIOB)
#define FGPIOB_PSOR FGPIO_PSOR_REG(FGPIOB)
#define FGPIOB_PCOR FGPIO_PCOR_REG(FGPIOB)
#define FGPIOB_PTOR FGPIO_PTOR_REG(FGPIOB)
#define FGPIOB_PDIR FGPIO_PDIR_REG(FGPIOB)
#define FGPIOB_PDDR FGPIO_PDDR_REG(FGPIOB)
# 1389 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint8_t FSTAT;
  volatile uint8_t FCNFG;
  volatile const uint8_t FSEC;
  volatile const uint8_t FOPT;
  volatile uint8_t FCCOB3;
  volatile uint8_t FCCOB2;
  volatile uint8_t FCCOB1;
  volatile uint8_t FCCOB0;
  volatile uint8_t FCCOB7;
  volatile uint8_t FCCOB6;
  volatile uint8_t FCCOB5;
  volatile uint8_t FCCOB4;
  volatile uint8_t FCCOBB;
  volatile uint8_t FCCOBA;
  volatile uint8_t FCCOB9;
  volatile uint8_t FCCOB8;
  volatile uint8_t FPROT3;
  volatile uint8_t FPROT2;
  volatile uint8_t FPROT1;
  volatile uint8_t FPROT0;
} FTFA_Type, *FTFA_MemMapPtr;
# 1423 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define FTFA_FSTAT_REG(base) ((base)->FSTAT)
#define FTFA_FCNFG_REG(base) ((base)->FCNFG)
#define FTFA_FSEC_REG(base) ((base)->FSEC)
#define FTFA_FOPT_REG(base) ((base)->FOPT)
#define FTFA_FCCOB3_REG(base) ((base)->FCCOB3)
#define FTFA_FCCOB2_REG(base) ((base)->FCCOB2)
#define FTFA_FCCOB1_REG(base) ((base)->FCCOB1)
#define FTFA_FCCOB0_REG(base) ((base)->FCCOB0)
#define FTFA_FCCOB7_REG(base) ((base)->FCCOB7)
#define FTFA_FCCOB6_REG(base) ((base)->FCCOB6)
#define FTFA_FCCOB5_REG(base) ((base)->FCCOB5)
#define FTFA_FCCOB4_REG(base) ((base)->FCCOB4)
#define FTFA_FCCOBB_REG(base) ((base)->FCCOBB)
#define FTFA_FCCOBA_REG(base) ((base)->FCCOBA)
#define FTFA_FCCOB9_REG(base) ((base)->FCCOB9)
#define FTFA_FCCOB8_REG(base) ((base)->FCCOB8)
#define FTFA_FPROT3_REG(base) ((base)->FPROT3)
#define FTFA_FPROT2_REG(base) ((base)->FPROT2)
#define FTFA_FPROT1_REG(base) ((base)->FPROT1)
#define FTFA_FPROT0_REG(base) ((base)->FPROT0)
# 1459 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define FTFA_FSTAT_MGSTAT0_MASK 0x1u
#define FTFA_FSTAT_MGSTAT0_SHIFT 0
#define FTFA_FSTAT_MGSTAT0_WIDTH 1
#define FTFA_FSTAT_MGSTAT0(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FSTAT_MGSTAT0_SHIFT))&FTFA_FSTAT_MGSTAT0_MASK)
#define FTFA_FSTAT_FPVIOL_MASK 0x10u
#define FTFA_FSTAT_FPVIOL_SHIFT 4
#define FTFA_FSTAT_FPVIOL_WIDTH 1
#define FTFA_FSTAT_FPVIOL(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FSTAT_FPVIOL_SHIFT))&FTFA_FSTAT_FPVIOL_MASK)
#define FTFA_FSTAT_ACCERR_MASK 0x20u
#define FTFA_FSTAT_ACCERR_SHIFT 5
#define FTFA_FSTAT_ACCERR_WIDTH 1
#define FTFA_FSTAT_ACCERR(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FSTAT_ACCERR_SHIFT))&FTFA_FSTAT_ACCERR_MASK)
#define FTFA_FSTAT_RDCOLERR_MASK 0x40u
#define FTFA_FSTAT_RDCOLERR_SHIFT 6
#define FTFA_FSTAT_RDCOLERR_WIDTH 1
#define FTFA_FSTAT_RDCOLERR(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FSTAT_RDCOLERR_SHIFT))&FTFA_FSTAT_RDCOLERR_MASK)
#define FTFA_FSTAT_CCIF_MASK 0x80u
#define FTFA_FSTAT_CCIF_SHIFT 7
#define FTFA_FSTAT_CCIF_WIDTH 1
#define FTFA_FSTAT_CCIF(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FSTAT_CCIF_SHIFT))&FTFA_FSTAT_CCIF_MASK)

#define FTFA_FCNFG_ERSSUSP_MASK 0x10u
#define FTFA_FCNFG_ERSSUSP_SHIFT 4
#define FTFA_FCNFG_ERSSUSP_WIDTH 1
#define FTFA_FCNFG_ERSSUSP(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FCNFG_ERSSUSP_SHIFT))&FTFA_FCNFG_ERSSUSP_MASK)
#define FTFA_FCNFG_ERSAREQ_MASK 0x20u
#define FTFA_FCNFG_ERSAREQ_SHIFT 5
#define FTFA_FCNFG_ERSAREQ_WIDTH 1
#define FTFA_FCNFG_ERSAREQ(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FCNFG_ERSAREQ_SHIFT))&FTFA_FCNFG_ERSAREQ_MASK)
#define FTFA_FCNFG_RDCOLLIE_MASK 0x40u
#define FTFA_FCNFG_RDCOLLIE_SHIFT 6
#define FTFA_FCNFG_RDCOLLIE_WIDTH 1
#define FTFA_FCNFG_RDCOLLIE(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FCNFG_RDCOLLIE_SHIFT))&FTFA_FCNFG_RDCOLLIE_MASK)
#define FTFA_FCNFG_CCIE_MASK 0x80u
#define FTFA_FCNFG_CCIE_SHIFT 7
#define FTFA_FCNFG_CCIE_WIDTH 1
#define FTFA_FCNFG_CCIE(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FCNFG_CCIE_SHIFT))&FTFA_FCNFG_CCIE_MASK)

#define FTFA_FSEC_SEC_MASK 0x3u
#define FTFA_FSEC_SEC_SHIFT 0
#define FTFA_FSEC_SEC_WIDTH 2
#define FTFA_FSEC_SEC(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FSEC_SEC_SHIFT))&FTFA_FSEC_SEC_MASK)
#define FTFA_FSEC_FSLACC_MASK 0xCu
#define FTFA_FSEC_FSLACC_SHIFT 2
#define FTFA_FSEC_FSLACC_WIDTH 2
#define FTFA_FSEC_FSLACC(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FSEC_FSLACC_SHIFT))&FTFA_FSEC_FSLACC_MASK)
#define FTFA_FSEC_MEEN_MASK 0x30u
#define FTFA_FSEC_MEEN_SHIFT 4
#define FTFA_FSEC_MEEN_WIDTH 2
#define FTFA_FSEC_MEEN(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FSEC_MEEN_SHIFT))&FTFA_FSEC_MEEN_MASK)
#define FTFA_FSEC_KEYEN_MASK 0xC0u
#define FTFA_FSEC_KEYEN_SHIFT 6
#define FTFA_FSEC_KEYEN_WIDTH 2
#define FTFA_FSEC_KEYEN(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FSEC_KEYEN_SHIFT))&FTFA_FSEC_KEYEN_MASK)

#define FTFA_FOPT_OPT_MASK 0xFFu
#define FTFA_FOPT_OPT_SHIFT 0
#define FTFA_FOPT_OPT_WIDTH 8
#define FTFA_FOPT_OPT(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FOPT_OPT_SHIFT))&FTFA_FOPT_OPT_MASK)

#define FTFA_FCCOB3_CCOBn_MASK 0xFFu
#define FTFA_FCCOB3_CCOBn_SHIFT 0
#define FTFA_FCCOB3_CCOBn_WIDTH 8
#define FTFA_FCCOB3_CCOBn(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FCCOB3_CCOBn_SHIFT))&FTFA_FCCOB3_CCOBn_MASK)

#define FTFA_FCCOB2_CCOBn_MASK 0xFFu
#define FTFA_FCCOB2_CCOBn_SHIFT 0
#define FTFA_FCCOB2_CCOBn_WIDTH 8
#define FTFA_FCCOB2_CCOBn(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FCCOB2_CCOBn_SHIFT))&FTFA_FCCOB2_CCOBn_MASK)

#define FTFA_FCCOB1_CCOBn_MASK 0xFFu
#define FTFA_FCCOB1_CCOBn_SHIFT 0
#define FTFA_FCCOB1_CCOBn_WIDTH 8
#define FTFA_FCCOB1_CCOBn(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FCCOB1_CCOBn_SHIFT))&FTFA_FCCOB1_CCOBn_MASK)

#define FTFA_FCCOB0_CCOBn_MASK 0xFFu
#define FTFA_FCCOB0_CCOBn_SHIFT 0
#define FTFA_FCCOB0_CCOBn_WIDTH 8
#define FTFA_FCCOB0_CCOBn(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FCCOB0_CCOBn_SHIFT))&FTFA_FCCOB0_CCOBn_MASK)

#define FTFA_FCCOB7_CCOBn_MASK 0xFFu
#define FTFA_FCCOB7_CCOBn_SHIFT 0
#define FTFA_FCCOB7_CCOBn_WIDTH 8
#define FTFA_FCCOB7_CCOBn(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FCCOB7_CCOBn_SHIFT))&FTFA_FCCOB7_CCOBn_MASK)

#define FTFA_FCCOB6_CCOBn_MASK 0xFFu
#define FTFA_FCCOB6_CCOBn_SHIFT 0
#define FTFA_FCCOB6_CCOBn_WIDTH 8
#define FTFA_FCCOB6_CCOBn(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FCCOB6_CCOBn_SHIFT))&FTFA_FCCOB6_CCOBn_MASK)

#define FTFA_FCCOB5_CCOBn_MASK 0xFFu
#define FTFA_FCCOB5_CCOBn_SHIFT 0
#define FTFA_FCCOB5_CCOBn_WIDTH 8
#define FTFA_FCCOB5_CCOBn(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FCCOB5_CCOBn_SHIFT))&FTFA_FCCOB5_CCOBn_MASK)

#define FTFA_FCCOB4_CCOBn_MASK 0xFFu
#define FTFA_FCCOB4_CCOBn_SHIFT 0
#define FTFA_FCCOB4_CCOBn_WIDTH 8
#define FTFA_FCCOB4_CCOBn(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FCCOB4_CCOBn_SHIFT))&FTFA_FCCOB4_CCOBn_MASK)

#define FTFA_FCCOBB_CCOBn_MASK 0xFFu
#define FTFA_FCCOBB_CCOBn_SHIFT 0
#define FTFA_FCCOBB_CCOBn_WIDTH 8
#define FTFA_FCCOBB_CCOBn(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FCCOBB_CCOBn_SHIFT))&FTFA_FCCOBB_CCOBn_MASK)

#define FTFA_FCCOBA_CCOBn_MASK 0xFFu
#define FTFA_FCCOBA_CCOBn_SHIFT 0
#define FTFA_FCCOBA_CCOBn_WIDTH 8
#define FTFA_FCCOBA_CCOBn(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FCCOBA_CCOBn_SHIFT))&FTFA_FCCOBA_CCOBn_MASK)

#define FTFA_FCCOB9_CCOBn_MASK 0xFFu
#define FTFA_FCCOB9_CCOBn_SHIFT 0
#define FTFA_FCCOB9_CCOBn_WIDTH 8
#define FTFA_FCCOB9_CCOBn(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FCCOB9_CCOBn_SHIFT))&FTFA_FCCOB9_CCOBn_MASK)

#define FTFA_FCCOB8_CCOBn_MASK 0xFFu
#define FTFA_FCCOB8_CCOBn_SHIFT 0
#define FTFA_FCCOB8_CCOBn_WIDTH 8
#define FTFA_FCCOB8_CCOBn(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FCCOB8_CCOBn_SHIFT))&FTFA_FCCOB8_CCOBn_MASK)

#define FTFA_FPROT3_PROT_MASK 0xFFu
#define FTFA_FPROT3_PROT_SHIFT 0
#define FTFA_FPROT3_PROT_WIDTH 8
#define FTFA_FPROT3_PROT(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FPROT3_PROT_SHIFT))&FTFA_FPROT3_PROT_MASK)

#define FTFA_FPROT2_PROT_MASK 0xFFu
#define FTFA_FPROT2_PROT_SHIFT 0
#define FTFA_FPROT2_PROT_WIDTH 8
#define FTFA_FPROT2_PROT(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FPROT2_PROT_SHIFT))&FTFA_FPROT2_PROT_MASK)

#define FTFA_FPROT1_PROT_MASK 0xFFu
#define FTFA_FPROT1_PROT_SHIFT 0
#define FTFA_FPROT1_PROT_WIDTH 8
#define FTFA_FPROT1_PROT(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FPROT1_PROT_SHIFT))&FTFA_FPROT1_PROT_MASK)

#define FTFA_FPROT0_PROT_MASK 0xFFu
#define FTFA_FPROT0_PROT_SHIFT 0
#define FTFA_FPROT0_PROT_WIDTH 8
#define FTFA_FPROT0_PROT(x) (((uint8_t)(((uint8_t)(x))<<FTFA_FPROT0_PROT_SHIFT))&FTFA_FPROT0_PROT_MASK)
# 1606 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define FTFA_BASE (0x40020000u)

#define FTFA ((FTFA_Type *)FTFA_BASE)
#define FTFA_BASE_PTR (FTFA)

#define FTFA_BASE_ADDRS { FTFA_BASE }

#define FTFA_BASE_PTRS { FTFA }
# 1627 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define FTFA_FSTAT FTFA_FSTAT_REG(FTFA)
#define FTFA_FCNFG FTFA_FCNFG_REG(FTFA)
#define FTFA_FSEC FTFA_FSEC_REG(FTFA)
#define FTFA_FOPT FTFA_FOPT_REG(FTFA)
#define FTFA_FCCOB3 FTFA_FCCOB3_REG(FTFA)
#define FTFA_FCCOB2 FTFA_FCCOB2_REG(FTFA)
#define FTFA_FCCOB1 FTFA_FCCOB1_REG(FTFA)
#define FTFA_FCCOB0 FTFA_FCCOB0_REG(FTFA)
#define FTFA_FCCOB7 FTFA_FCCOB7_REG(FTFA)
#define FTFA_FCCOB6 FTFA_FCCOB6_REG(FTFA)
#define FTFA_FCCOB5 FTFA_FCCOB5_REG(FTFA)
#define FTFA_FCCOB4 FTFA_FCCOB4_REG(FTFA)
#define FTFA_FCCOBB FTFA_FCCOBB_REG(FTFA)
#define FTFA_FCCOBA FTFA_FCCOBA_REG(FTFA)
#define FTFA_FCCOB9 FTFA_FCCOB9_REG(FTFA)
#define FTFA_FCCOB8 FTFA_FCCOB8_REG(FTFA)
#define FTFA_FPROT3 FTFA_FPROT3_REG(FTFA)
#define FTFA_FPROT2 FTFA_FPROT2_REG(FTFA)
#define FTFA_FPROT1 FTFA_FPROT1_REG(FTFA)
#define FTFA_FPROT0 FTFA_FPROT0_REG(FTFA)
# 1668 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint32_t PDOR;
  volatile uint32_t PSOR;
  volatile uint32_t PCOR;
  volatile uint32_t PTOR;
  volatile const uint32_t PDIR;
  volatile uint32_t PDDR;
} GPIO_Type, *GPIO_MemMapPtr;
# 1688 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define GPIO_PDOR_REG(base) ((base)->PDOR)
#define GPIO_PSOR_REG(base) ((base)->PSOR)
#define GPIO_PCOR_REG(base) ((base)->PCOR)
#define GPIO_PTOR_REG(base) ((base)->PTOR)
#define GPIO_PDIR_REG(base) ((base)->PDIR)
#define GPIO_PDDR_REG(base) ((base)->PDDR)
# 1710 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define GPIO_PDOR_PDO_MASK 0xFFFFFFFFu
#define GPIO_PDOR_PDO_SHIFT 0
#define GPIO_PDOR_PDO_WIDTH 32
#define GPIO_PDOR_PDO(x) (((uint32_t)(((uint32_t)(x))<<GPIO_PDOR_PDO_SHIFT))&GPIO_PDOR_PDO_MASK)

#define GPIO_PSOR_PTSO_MASK 0xFFFFFFFFu
#define GPIO_PSOR_PTSO_SHIFT 0
#define GPIO_PSOR_PTSO_WIDTH 32
#define GPIO_PSOR_PTSO(x) (((uint32_t)(((uint32_t)(x))<<GPIO_PSOR_PTSO_SHIFT))&GPIO_PSOR_PTSO_MASK)

#define GPIO_PCOR_PTCO_MASK 0xFFFFFFFFu
#define GPIO_PCOR_PTCO_SHIFT 0
#define GPIO_PCOR_PTCO_WIDTH 32
#define GPIO_PCOR_PTCO(x) (((uint32_t)(((uint32_t)(x))<<GPIO_PCOR_PTCO_SHIFT))&GPIO_PCOR_PTCO_MASK)

#define GPIO_PTOR_PTTO_MASK 0xFFFFFFFFu
#define GPIO_PTOR_PTTO_SHIFT 0
#define GPIO_PTOR_PTTO_WIDTH 32
#define GPIO_PTOR_PTTO(x) (((uint32_t)(((uint32_t)(x))<<GPIO_PTOR_PTTO_SHIFT))&GPIO_PTOR_PTTO_MASK)

#define GPIO_PDIR_PDI_MASK 0xFFFFFFFFu
#define GPIO_PDIR_PDI_SHIFT 0
#define GPIO_PDIR_PDI_WIDTH 32
#define GPIO_PDIR_PDI(x) (((uint32_t)(((uint32_t)(x))<<GPIO_PDIR_PDI_SHIFT))&GPIO_PDIR_PDI_MASK)

#define GPIO_PDDR_PDD_MASK 0xFFFFFFFFu
#define GPIO_PDDR_PDD_SHIFT 0
#define GPIO_PDDR_PDD_WIDTH 32
#define GPIO_PDDR_PDD(x) (((uint32_t)(((uint32_t)(x))<<GPIO_PDDR_PDD_SHIFT))&GPIO_PDDR_PDD_MASK)
# 1747 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define GPIOA_BASE (0x400FF000u)

#define GPIOA ((GPIO_Type *)GPIOA_BASE)
#define GPIOA_BASE_PTR (GPIOA)

#define GPIOB_BASE (0x400FF040u)

#define GPIOB ((GPIO_Type *)GPIOB_BASE)
#define GPIOB_BASE_PTR (GPIOB)

#define GPIO_BASE_ADDRS { GPIOA_BASE, GPIOB_BASE }

#define GPIO_BASE_PTRS { GPIOA, GPIOB }
# 1773 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define GPIOA_PDOR GPIO_PDOR_REG(GPIOA)
#define GPIOA_PSOR GPIO_PSOR_REG(GPIOA)
#define GPIOA_PCOR GPIO_PCOR_REG(GPIOA)
#define GPIOA_PTOR GPIO_PTOR_REG(GPIOA)
#define GPIOA_PDIR GPIO_PDIR_REG(GPIOA)
#define GPIOA_PDDR GPIO_PDDR_REG(GPIOA)

#define GPIOB_PDOR GPIO_PDOR_REG(GPIOB)
#define GPIOB_PSOR GPIO_PSOR_REG(GPIOB)
#define GPIOB_PCOR GPIO_PCOR_REG(GPIOB)
#define GPIOB_PTOR GPIO_PTOR_REG(GPIOB)
#define GPIOB_PDIR GPIO_PDIR_REG(GPIOB)
#define GPIOB_PDDR GPIO_PDDR_REG(GPIOB)
# 1807 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint8_t A1;
  volatile uint8_t F;
  volatile uint8_t C1;
  volatile uint8_t S;
  volatile uint8_t D;
  volatile uint8_t C2;
  volatile uint8_t FLT;
  volatile uint8_t RA;
  volatile uint8_t SMB;
  volatile uint8_t A2;
  volatile uint8_t SLTH;
  volatile uint8_t SLTL;
} I2C_Type, *I2C_MemMapPtr;
# 1833 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define I2C_A1_REG(base) ((base)->A1)
#define I2C_F_REG(base) ((base)->F)
#define I2C_C1_REG(base) ((base)->C1)
#define I2C_S_REG(base) ((base)->S)
#define I2C_D_REG(base) ((base)->D)
#define I2C_C2_REG(base) ((base)->C2)
#define I2C_FLT_REG(base) ((base)->FLT)
#define I2C_RA_REG(base) ((base)->RA)
#define I2C_SMB_REG(base) ((base)->SMB)
#define I2C_A2_REG(base) ((base)->A2)
#define I2C_SLTH_REG(base) ((base)->SLTH)
#define I2C_SLTL_REG(base) ((base)->SLTL)
# 1861 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define I2C_A1_AD_MASK 0xFEu
#define I2C_A1_AD_SHIFT 1
#define I2C_A1_AD_WIDTH 7
#define I2C_A1_AD(x) (((uint8_t)(((uint8_t)(x))<<I2C_A1_AD_SHIFT))&I2C_A1_AD_MASK)

#define I2C_F_ICR_MASK 0x3Fu
#define I2C_F_ICR_SHIFT 0
#define I2C_F_ICR_WIDTH 6
#define I2C_F_ICR(x) (((uint8_t)(((uint8_t)(x))<<I2C_F_ICR_SHIFT))&I2C_F_ICR_MASK)
#define I2C_F_MULT_MASK 0xC0u
#define I2C_F_MULT_SHIFT 6
#define I2C_F_MULT_WIDTH 2
#define I2C_F_MULT(x) (((uint8_t)(((uint8_t)(x))<<I2C_F_MULT_SHIFT))&I2C_F_MULT_MASK)

#define I2C_C1_DMAEN_MASK 0x1u
#define I2C_C1_DMAEN_SHIFT 0
#define I2C_C1_DMAEN_WIDTH 1
#define I2C_C1_DMAEN(x) (((uint8_t)(((uint8_t)(x))<<I2C_C1_DMAEN_SHIFT))&I2C_C1_DMAEN_MASK)
#define I2C_C1_WUEN_MASK 0x2u
#define I2C_C1_WUEN_SHIFT 1
#define I2C_C1_WUEN_WIDTH 1
#define I2C_C1_WUEN(x) (((uint8_t)(((uint8_t)(x))<<I2C_C1_WUEN_SHIFT))&I2C_C1_WUEN_MASK)
#define I2C_C1_RSTA_MASK 0x4u
#define I2C_C1_RSTA_SHIFT 2
#define I2C_C1_RSTA_WIDTH 1
#define I2C_C1_RSTA(x) (((uint8_t)(((uint8_t)(x))<<I2C_C1_RSTA_SHIFT))&I2C_C1_RSTA_MASK)
#define I2C_C1_TXAK_MASK 0x8u
#define I2C_C1_TXAK_SHIFT 3
#define I2C_C1_TXAK_WIDTH 1
#define I2C_C1_TXAK(x) (((uint8_t)(((uint8_t)(x))<<I2C_C1_TXAK_SHIFT))&I2C_C1_TXAK_MASK)
#define I2C_C1_TX_MASK 0x10u
#define I2C_C1_TX_SHIFT 4
#define I2C_C1_TX_WIDTH 1
#define I2C_C1_TX(x) (((uint8_t)(((uint8_t)(x))<<I2C_C1_TX_SHIFT))&I2C_C1_TX_MASK)
#define I2C_C1_MST_MASK 0x20u
#define I2C_C1_MST_SHIFT 5
#define I2C_C1_MST_WIDTH 1
#define I2C_C1_MST(x) (((uint8_t)(((uint8_t)(x))<<I2C_C1_MST_SHIFT))&I2C_C1_MST_MASK)
#define I2C_C1_IICIE_MASK 0x40u
#define I2C_C1_IICIE_SHIFT 6
#define I2C_C1_IICIE_WIDTH 1
#define I2C_C1_IICIE(x) (((uint8_t)(((uint8_t)(x))<<I2C_C1_IICIE_SHIFT))&I2C_C1_IICIE_MASK)
#define I2C_C1_IICEN_MASK 0x80u
#define I2C_C1_IICEN_SHIFT 7
#define I2C_C1_IICEN_WIDTH 1
#define I2C_C1_IICEN(x) (((uint8_t)(((uint8_t)(x))<<I2C_C1_IICEN_SHIFT))&I2C_C1_IICEN_MASK)

#define I2C_S_RXAK_MASK 0x1u
#define I2C_S_RXAK_SHIFT 0
#define I2C_S_RXAK_WIDTH 1
#define I2C_S_RXAK(x) (((uint8_t)(((uint8_t)(x))<<I2C_S_RXAK_SHIFT))&I2C_S_RXAK_MASK)
#define I2C_S_IICIF_MASK 0x2u
#define I2C_S_IICIF_SHIFT 1
#define I2C_S_IICIF_WIDTH 1
#define I2C_S_IICIF(x) (((uint8_t)(((uint8_t)(x))<<I2C_S_IICIF_SHIFT))&I2C_S_IICIF_MASK)
#define I2C_S_SRW_MASK 0x4u
#define I2C_S_SRW_SHIFT 2
#define I2C_S_SRW_WIDTH 1
#define I2C_S_SRW(x) (((uint8_t)(((uint8_t)(x))<<I2C_S_SRW_SHIFT))&I2C_S_SRW_MASK)
#define I2C_S_RAM_MASK 0x8u
#define I2C_S_RAM_SHIFT 3
#define I2C_S_RAM_WIDTH 1
#define I2C_S_RAM(x) (((uint8_t)(((uint8_t)(x))<<I2C_S_RAM_SHIFT))&I2C_S_RAM_MASK)
#define I2C_S_ARBL_MASK 0x10u
#define I2C_S_ARBL_SHIFT 4
#define I2C_S_ARBL_WIDTH 1
#define I2C_S_ARBL(x) (((uint8_t)(((uint8_t)(x))<<I2C_S_ARBL_SHIFT))&I2C_S_ARBL_MASK)
#define I2C_S_BUSY_MASK 0x20u
#define I2C_S_BUSY_SHIFT 5
#define I2C_S_BUSY_WIDTH 1
#define I2C_S_BUSY(x) (((uint8_t)(((uint8_t)(x))<<I2C_S_BUSY_SHIFT))&I2C_S_BUSY_MASK)
#define I2C_S_IAAS_MASK 0x40u
#define I2C_S_IAAS_SHIFT 6
#define I2C_S_IAAS_WIDTH 1
#define I2C_S_IAAS(x) (((uint8_t)(((uint8_t)(x))<<I2C_S_IAAS_SHIFT))&I2C_S_IAAS_MASK)
#define I2C_S_TCF_MASK 0x80u
#define I2C_S_TCF_SHIFT 7
#define I2C_S_TCF_WIDTH 1
#define I2C_S_TCF(x) (((uint8_t)(((uint8_t)(x))<<I2C_S_TCF_SHIFT))&I2C_S_TCF_MASK)

#define I2C_D_DATA_MASK 0xFFu
#define I2C_D_DATA_SHIFT 0
#define I2C_D_DATA_WIDTH 8
#define I2C_D_DATA(x) (((uint8_t)(((uint8_t)(x))<<I2C_D_DATA_SHIFT))&I2C_D_DATA_MASK)

#define I2C_C2_AD_MASK 0x7u
#define I2C_C2_AD_SHIFT 0
#define I2C_C2_AD_WIDTH 3
#define I2C_C2_AD(x) (((uint8_t)(((uint8_t)(x))<<I2C_C2_AD_SHIFT))&I2C_C2_AD_MASK)
#define I2C_C2_RMEN_MASK 0x8u
#define I2C_C2_RMEN_SHIFT 3
#define I2C_C2_RMEN_WIDTH 1
#define I2C_C2_RMEN(x) (((uint8_t)(((uint8_t)(x))<<I2C_C2_RMEN_SHIFT))&I2C_C2_RMEN_MASK)
#define I2C_C2_SBRC_MASK 0x10u
#define I2C_C2_SBRC_SHIFT 4
#define I2C_C2_SBRC_WIDTH 1
#define I2C_C2_SBRC(x) (((uint8_t)(((uint8_t)(x))<<I2C_C2_SBRC_SHIFT))&I2C_C2_SBRC_MASK)
#define I2C_C2_HDRS_MASK 0x20u
#define I2C_C2_HDRS_SHIFT 5
#define I2C_C2_HDRS_WIDTH 1
#define I2C_C2_HDRS(x) (((uint8_t)(((uint8_t)(x))<<I2C_C2_HDRS_SHIFT))&I2C_C2_HDRS_MASK)
#define I2C_C2_ADEXT_MASK 0x40u
#define I2C_C2_ADEXT_SHIFT 6
#define I2C_C2_ADEXT_WIDTH 1
#define I2C_C2_ADEXT(x) (((uint8_t)(((uint8_t)(x))<<I2C_C2_ADEXT_SHIFT))&I2C_C2_ADEXT_MASK)
#define I2C_C2_GCAEN_MASK 0x80u
#define I2C_C2_GCAEN_SHIFT 7
#define I2C_C2_GCAEN_WIDTH 1
#define I2C_C2_GCAEN(x) (((uint8_t)(((uint8_t)(x))<<I2C_C2_GCAEN_SHIFT))&I2C_C2_GCAEN_MASK)

#define I2C_FLT_FLT_MASK 0x1Fu
#define I2C_FLT_FLT_SHIFT 0
#define I2C_FLT_FLT_WIDTH 5
#define I2C_FLT_FLT(x) (((uint8_t)(((uint8_t)(x))<<I2C_FLT_FLT_SHIFT))&I2C_FLT_FLT_MASK)
#define I2C_FLT_STOPIE_MASK 0x20u
#define I2C_FLT_STOPIE_SHIFT 5
#define I2C_FLT_STOPIE_WIDTH 1
#define I2C_FLT_STOPIE(x) (((uint8_t)(((uint8_t)(x))<<I2C_FLT_STOPIE_SHIFT))&I2C_FLT_STOPIE_MASK)
#define I2C_FLT_STOPF_MASK 0x40u
#define I2C_FLT_STOPF_SHIFT 6
#define I2C_FLT_STOPF_WIDTH 1
#define I2C_FLT_STOPF(x) (((uint8_t)(((uint8_t)(x))<<I2C_FLT_STOPF_SHIFT))&I2C_FLT_STOPF_MASK)
#define I2C_FLT_SHEN_MASK 0x80u
#define I2C_FLT_SHEN_SHIFT 7
#define I2C_FLT_SHEN_WIDTH 1
#define I2C_FLT_SHEN(x) (((uint8_t)(((uint8_t)(x))<<I2C_FLT_SHEN_SHIFT))&I2C_FLT_SHEN_MASK)

#define I2C_RA_RAD_MASK 0xFEu
#define I2C_RA_RAD_SHIFT 1
#define I2C_RA_RAD_WIDTH 7
#define I2C_RA_RAD(x) (((uint8_t)(((uint8_t)(x))<<I2C_RA_RAD_SHIFT))&I2C_RA_RAD_MASK)

#define I2C_SMB_SHTF2IE_MASK 0x1u
#define I2C_SMB_SHTF2IE_SHIFT 0
#define I2C_SMB_SHTF2IE_WIDTH 1
#define I2C_SMB_SHTF2IE(x) (((uint8_t)(((uint8_t)(x))<<I2C_SMB_SHTF2IE_SHIFT))&I2C_SMB_SHTF2IE_MASK)
#define I2C_SMB_SHTF2_MASK 0x2u
#define I2C_SMB_SHTF2_SHIFT 1
#define I2C_SMB_SHTF2_WIDTH 1
#define I2C_SMB_SHTF2(x) (((uint8_t)(((uint8_t)(x))<<I2C_SMB_SHTF2_SHIFT))&I2C_SMB_SHTF2_MASK)
#define I2C_SMB_SHTF1_MASK 0x4u
#define I2C_SMB_SHTF1_SHIFT 2
#define I2C_SMB_SHTF1_WIDTH 1
#define I2C_SMB_SHTF1(x) (((uint8_t)(((uint8_t)(x))<<I2C_SMB_SHTF1_SHIFT))&I2C_SMB_SHTF1_MASK)
#define I2C_SMB_SLTF_MASK 0x8u
#define I2C_SMB_SLTF_SHIFT 3
#define I2C_SMB_SLTF_WIDTH 1
#define I2C_SMB_SLTF(x) (((uint8_t)(((uint8_t)(x))<<I2C_SMB_SLTF_SHIFT))&I2C_SMB_SLTF_MASK)
#define I2C_SMB_TCKSEL_MASK 0x10u
#define I2C_SMB_TCKSEL_SHIFT 4
#define I2C_SMB_TCKSEL_WIDTH 1
#define I2C_SMB_TCKSEL(x) (((uint8_t)(((uint8_t)(x))<<I2C_SMB_TCKSEL_SHIFT))&I2C_SMB_TCKSEL_MASK)
#define I2C_SMB_SIICAEN_MASK 0x20u
#define I2C_SMB_SIICAEN_SHIFT 5
#define I2C_SMB_SIICAEN_WIDTH 1
#define I2C_SMB_SIICAEN(x) (((uint8_t)(((uint8_t)(x))<<I2C_SMB_SIICAEN_SHIFT))&I2C_SMB_SIICAEN_MASK)
#define I2C_SMB_ALERTEN_MASK 0x40u
#define I2C_SMB_ALERTEN_SHIFT 6
#define I2C_SMB_ALERTEN_WIDTH 1
#define I2C_SMB_ALERTEN(x) (((uint8_t)(((uint8_t)(x))<<I2C_SMB_ALERTEN_SHIFT))&I2C_SMB_ALERTEN_MASK)
#define I2C_SMB_FACK_MASK 0x80u
#define I2C_SMB_FACK_SHIFT 7
#define I2C_SMB_FACK_WIDTH 1
#define I2C_SMB_FACK(x) (((uint8_t)(((uint8_t)(x))<<I2C_SMB_FACK_SHIFT))&I2C_SMB_FACK_MASK)

#define I2C_A2_SAD_MASK 0xFEu
#define I2C_A2_SAD_SHIFT 1
#define I2C_A2_SAD_WIDTH 7
#define I2C_A2_SAD(x) (((uint8_t)(((uint8_t)(x))<<I2C_A2_SAD_SHIFT))&I2C_A2_SAD_MASK)

#define I2C_SLTH_SSLT_MASK 0xFFu
#define I2C_SLTH_SSLT_SHIFT 0
#define I2C_SLTH_SSLT_WIDTH 8
#define I2C_SLTH_SSLT(x) (((uint8_t)(((uint8_t)(x))<<I2C_SLTH_SSLT_SHIFT))&I2C_SLTH_SSLT_MASK)

#define I2C_SLTL_SSLT_MASK 0xFFu
#define I2C_SLTL_SSLT_SHIFT 0
#define I2C_SLTL_SSLT_WIDTH 8
#define I2C_SLTL_SSLT(x) (((uint8_t)(((uint8_t)(x))<<I2C_SLTL_SSLT_SHIFT))&I2C_SLTL_SSLT_MASK)
# 2048 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define I2C0_BASE (0x40066000u)

#define I2C0 ((I2C_Type *)I2C0_BASE)
#define I2C0_BASE_PTR (I2C0)

#define I2C_BASE_ADDRS { I2C0_BASE }

#define I2C_BASE_PTRS { I2C0 }
# 2069 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define I2C0_A1 I2C_A1_REG(I2C0)
#define I2C0_F I2C_F_REG(I2C0)
#define I2C0_C1 I2C_C1_REG(I2C0)
#define I2C0_S I2C_S_REG(I2C0)
#define I2C0_D I2C_D_REG(I2C0)
#define I2C0_C2 I2C_C2_REG(I2C0)
#define I2C0_FLT I2C_FLT_REG(I2C0)
#define I2C0_RA I2C_RA_REG(I2C0)
#define I2C0_SMB I2C_SMB_REG(I2C0)
#define I2C0_A2 I2C_A2_REG(I2C0)
#define I2C0_SLTH I2C_SLTH_REG(I2C0)
#define I2C0_SLTL I2C_SLTL_REG(I2C0)
# 2102 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint8_t PE1;
  volatile uint8_t PE2;
  volatile uint8_t ME;
  volatile uint8_t F1;
  volatile const uint8_t F3;
  volatile uint8_t FILT1;
  volatile uint8_t FILT2;
} LLWU_Type, *LLWU_MemMapPtr;
# 2123 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define LLWU_PE1_REG(base) ((base)->PE1)
#define LLWU_PE2_REG(base) ((base)->PE2)
#define LLWU_ME_REG(base) ((base)->ME)
#define LLWU_F1_REG(base) ((base)->F1)
#define LLWU_F3_REG(base) ((base)->F3)
#define LLWU_FILT1_REG(base) ((base)->FILT1)
#define LLWU_FILT2_REG(base) ((base)->FILT2)
# 2146 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define LLWU_PE1_WUPE0_MASK 0x3u
#define LLWU_PE1_WUPE0_SHIFT 0
#define LLWU_PE1_WUPE0_WIDTH 2
#define LLWU_PE1_WUPE0(x) (((uint8_t)(((uint8_t)(x))<<LLWU_PE1_WUPE0_SHIFT))&LLWU_PE1_WUPE0_MASK)
#define LLWU_PE1_WUPE1_MASK 0xCu
#define LLWU_PE1_WUPE1_SHIFT 2
#define LLWU_PE1_WUPE1_WIDTH 2
#define LLWU_PE1_WUPE1(x) (((uint8_t)(((uint8_t)(x))<<LLWU_PE1_WUPE1_SHIFT))&LLWU_PE1_WUPE1_MASK)
#define LLWU_PE1_WUPE2_MASK 0x30u
#define LLWU_PE1_WUPE2_SHIFT 4
#define LLWU_PE1_WUPE2_WIDTH 2
#define LLWU_PE1_WUPE2(x) (((uint8_t)(((uint8_t)(x))<<LLWU_PE1_WUPE2_SHIFT))&LLWU_PE1_WUPE2_MASK)
#define LLWU_PE1_WUPE3_MASK 0xC0u
#define LLWU_PE1_WUPE3_SHIFT 6
#define LLWU_PE1_WUPE3_WIDTH 2
#define LLWU_PE1_WUPE3(x) (((uint8_t)(((uint8_t)(x))<<LLWU_PE1_WUPE3_SHIFT))&LLWU_PE1_WUPE3_MASK)

#define LLWU_PE2_WUPE4_MASK 0x3u
#define LLWU_PE2_WUPE4_SHIFT 0
#define LLWU_PE2_WUPE4_WIDTH 2
#define LLWU_PE2_WUPE4(x) (((uint8_t)(((uint8_t)(x))<<LLWU_PE2_WUPE4_SHIFT))&LLWU_PE2_WUPE4_MASK)
#define LLWU_PE2_WUPE5_MASK 0xCu
#define LLWU_PE2_WUPE5_SHIFT 2
#define LLWU_PE2_WUPE5_WIDTH 2
#define LLWU_PE2_WUPE5(x) (((uint8_t)(((uint8_t)(x))<<LLWU_PE2_WUPE5_SHIFT))&LLWU_PE2_WUPE5_MASK)
#define LLWU_PE2_WUPE6_MASK 0x30u
#define LLWU_PE2_WUPE6_SHIFT 4
#define LLWU_PE2_WUPE6_WIDTH 2
#define LLWU_PE2_WUPE6(x) (((uint8_t)(((uint8_t)(x))<<LLWU_PE2_WUPE6_SHIFT))&LLWU_PE2_WUPE6_MASK)
#define LLWU_PE2_WUPE7_MASK 0xC0u
#define LLWU_PE2_WUPE7_SHIFT 6
#define LLWU_PE2_WUPE7_WIDTH 2
#define LLWU_PE2_WUPE7(x) (((uint8_t)(((uint8_t)(x))<<LLWU_PE2_WUPE7_SHIFT))&LLWU_PE2_WUPE7_MASK)

#define LLWU_ME_WUME0_MASK 0x1u
#define LLWU_ME_WUME0_SHIFT 0
#define LLWU_ME_WUME0_WIDTH 1
#define LLWU_ME_WUME0(x) (((uint8_t)(((uint8_t)(x))<<LLWU_ME_WUME0_SHIFT))&LLWU_ME_WUME0_MASK)
#define LLWU_ME_WUME1_MASK 0x2u
#define LLWU_ME_WUME1_SHIFT 1
#define LLWU_ME_WUME1_WIDTH 1
#define LLWU_ME_WUME1(x) (((uint8_t)(((uint8_t)(x))<<LLWU_ME_WUME1_SHIFT))&LLWU_ME_WUME1_MASK)
#define LLWU_ME_WUME2_MASK 0x4u
#define LLWU_ME_WUME2_SHIFT 2
#define LLWU_ME_WUME2_WIDTH 1
#define LLWU_ME_WUME2(x) (((uint8_t)(((uint8_t)(x))<<LLWU_ME_WUME2_SHIFT))&LLWU_ME_WUME2_MASK)
#define LLWU_ME_WUME3_MASK 0x8u
#define LLWU_ME_WUME3_SHIFT 3
#define LLWU_ME_WUME3_WIDTH 1
#define LLWU_ME_WUME3(x) (((uint8_t)(((uint8_t)(x))<<LLWU_ME_WUME3_SHIFT))&LLWU_ME_WUME3_MASK)
#define LLWU_ME_WUME4_MASK 0x10u
#define LLWU_ME_WUME4_SHIFT 4
#define LLWU_ME_WUME4_WIDTH 1
#define LLWU_ME_WUME4(x) (((uint8_t)(((uint8_t)(x))<<LLWU_ME_WUME4_SHIFT))&LLWU_ME_WUME4_MASK)
#define LLWU_ME_WUME5_MASK 0x20u
#define LLWU_ME_WUME5_SHIFT 5
#define LLWU_ME_WUME5_WIDTH 1
#define LLWU_ME_WUME5(x) (((uint8_t)(((uint8_t)(x))<<LLWU_ME_WUME5_SHIFT))&LLWU_ME_WUME5_MASK)
#define LLWU_ME_WUME6_MASK 0x40u
#define LLWU_ME_WUME6_SHIFT 6
#define LLWU_ME_WUME6_WIDTH 1
#define LLWU_ME_WUME6(x) (((uint8_t)(((uint8_t)(x))<<LLWU_ME_WUME6_SHIFT))&LLWU_ME_WUME6_MASK)
#define LLWU_ME_WUME7_MASK 0x80u
#define LLWU_ME_WUME7_SHIFT 7
#define LLWU_ME_WUME7_WIDTH 1
#define LLWU_ME_WUME7(x) (((uint8_t)(((uint8_t)(x))<<LLWU_ME_WUME7_SHIFT))&LLWU_ME_WUME7_MASK)

#define LLWU_F1_WUF0_MASK 0x1u
#define LLWU_F1_WUF0_SHIFT 0
#define LLWU_F1_WUF0_WIDTH 1
#define LLWU_F1_WUF0(x) (((uint8_t)(((uint8_t)(x))<<LLWU_F1_WUF0_SHIFT))&LLWU_F1_WUF0_MASK)
#define LLWU_F1_WUF1_MASK 0x2u
#define LLWU_F1_WUF1_SHIFT 1
#define LLWU_F1_WUF1_WIDTH 1
#define LLWU_F1_WUF1(x) (((uint8_t)(((uint8_t)(x))<<LLWU_F1_WUF1_SHIFT))&LLWU_F1_WUF1_MASK)
#define LLWU_F1_WUF2_MASK 0x4u
#define LLWU_F1_WUF2_SHIFT 2
#define LLWU_F1_WUF2_WIDTH 1
#define LLWU_F1_WUF2(x) (((uint8_t)(((uint8_t)(x))<<LLWU_F1_WUF2_SHIFT))&LLWU_F1_WUF2_MASK)
#define LLWU_F1_WUF3_MASK 0x8u
#define LLWU_F1_WUF3_SHIFT 3
#define LLWU_F1_WUF3_WIDTH 1
#define LLWU_F1_WUF3(x) (((uint8_t)(((uint8_t)(x))<<LLWU_F1_WUF3_SHIFT))&LLWU_F1_WUF3_MASK)
#define LLWU_F1_WUF4_MASK 0x10u
#define LLWU_F1_WUF4_SHIFT 4
#define LLWU_F1_WUF4_WIDTH 1
#define LLWU_F1_WUF4(x) (((uint8_t)(((uint8_t)(x))<<LLWU_F1_WUF4_SHIFT))&LLWU_F1_WUF4_MASK)
#define LLWU_F1_WUF5_MASK 0x20u
#define LLWU_F1_WUF5_SHIFT 5
#define LLWU_F1_WUF5_WIDTH 1
#define LLWU_F1_WUF5(x) (((uint8_t)(((uint8_t)(x))<<LLWU_F1_WUF5_SHIFT))&LLWU_F1_WUF5_MASK)
#define LLWU_F1_WUF6_MASK 0x40u
#define LLWU_F1_WUF6_SHIFT 6
#define LLWU_F1_WUF6_WIDTH 1
#define LLWU_F1_WUF6(x) (((uint8_t)(((uint8_t)(x))<<LLWU_F1_WUF6_SHIFT))&LLWU_F1_WUF6_MASK)
#define LLWU_F1_WUF7_MASK 0x80u
#define LLWU_F1_WUF7_SHIFT 7
#define LLWU_F1_WUF7_WIDTH 1
#define LLWU_F1_WUF7(x) (((uint8_t)(((uint8_t)(x))<<LLWU_F1_WUF7_SHIFT))&LLWU_F1_WUF7_MASK)

#define LLWU_F3_MWUF0_MASK 0x1u
#define LLWU_F3_MWUF0_SHIFT 0
#define LLWU_F3_MWUF0_WIDTH 1
#define LLWU_F3_MWUF0(x) (((uint8_t)(((uint8_t)(x))<<LLWU_F3_MWUF0_SHIFT))&LLWU_F3_MWUF0_MASK)
#define LLWU_F3_MWUF1_MASK 0x2u
#define LLWU_F3_MWUF1_SHIFT 1
#define LLWU_F3_MWUF1_WIDTH 1
#define LLWU_F3_MWUF1(x) (((uint8_t)(((uint8_t)(x))<<LLWU_F3_MWUF1_SHIFT))&LLWU_F3_MWUF1_MASK)
#define LLWU_F3_MWUF2_MASK 0x4u
#define LLWU_F3_MWUF2_SHIFT 2
#define LLWU_F3_MWUF2_WIDTH 1
#define LLWU_F3_MWUF2(x) (((uint8_t)(((uint8_t)(x))<<LLWU_F3_MWUF2_SHIFT))&LLWU_F3_MWUF2_MASK)
#define LLWU_F3_MWUF3_MASK 0x8u
#define LLWU_F3_MWUF3_SHIFT 3
#define LLWU_F3_MWUF3_WIDTH 1
#define LLWU_F3_MWUF3(x) (((uint8_t)(((uint8_t)(x))<<LLWU_F3_MWUF3_SHIFT))&LLWU_F3_MWUF3_MASK)
#define LLWU_F3_MWUF4_MASK 0x10u
#define LLWU_F3_MWUF4_SHIFT 4
#define LLWU_F3_MWUF4_WIDTH 1
#define LLWU_F3_MWUF4(x) (((uint8_t)(((uint8_t)(x))<<LLWU_F3_MWUF4_SHIFT))&LLWU_F3_MWUF4_MASK)
#define LLWU_F3_MWUF5_MASK 0x20u
#define LLWU_F3_MWUF5_SHIFT 5
#define LLWU_F3_MWUF5_WIDTH 1
#define LLWU_F3_MWUF5(x) (((uint8_t)(((uint8_t)(x))<<LLWU_F3_MWUF5_SHIFT))&LLWU_F3_MWUF5_MASK)
#define LLWU_F3_MWUF6_MASK 0x40u
#define LLWU_F3_MWUF6_SHIFT 6
#define LLWU_F3_MWUF6_WIDTH 1
#define LLWU_F3_MWUF6(x) (((uint8_t)(((uint8_t)(x))<<LLWU_F3_MWUF6_SHIFT))&LLWU_F3_MWUF6_MASK)
#define LLWU_F3_MWUF7_MASK 0x80u
#define LLWU_F3_MWUF7_SHIFT 7
#define LLWU_F3_MWUF7_WIDTH 1
#define LLWU_F3_MWUF7(x) (((uint8_t)(((uint8_t)(x))<<LLWU_F3_MWUF7_SHIFT))&LLWU_F3_MWUF7_MASK)

#define LLWU_FILT1_FILTSEL_MASK 0xFu
#define LLWU_FILT1_FILTSEL_SHIFT 0
#define LLWU_FILT1_FILTSEL_WIDTH 4
#define LLWU_FILT1_FILTSEL(x) (((uint8_t)(((uint8_t)(x))<<LLWU_FILT1_FILTSEL_SHIFT))&LLWU_FILT1_FILTSEL_MASK)
#define LLWU_FILT1_FILTE_MASK 0x60u
#define LLWU_FILT1_FILTE_SHIFT 5
#define LLWU_FILT1_FILTE_WIDTH 2
#define LLWU_FILT1_FILTE(x) (((uint8_t)(((uint8_t)(x))<<LLWU_FILT1_FILTE_SHIFT))&LLWU_FILT1_FILTE_MASK)
#define LLWU_FILT1_FILTF_MASK 0x80u
#define LLWU_FILT1_FILTF_SHIFT 7
#define LLWU_FILT1_FILTF_WIDTH 1
#define LLWU_FILT1_FILTF(x) (((uint8_t)(((uint8_t)(x))<<LLWU_FILT1_FILTF_SHIFT))&LLWU_FILT1_FILTF_MASK)

#define LLWU_FILT2_FILTSEL_MASK 0xFu
#define LLWU_FILT2_FILTSEL_SHIFT 0
#define LLWU_FILT2_FILTSEL_WIDTH 4
#define LLWU_FILT2_FILTSEL(x) (((uint8_t)(((uint8_t)(x))<<LLWU_FILT2_FILTSEL_SHIFT))&LLWU_FILT2_FILTSEL_MASK)
#define LLWU_FILT2_FILTE_MASK 0x60u
#define LLWU_FILT2_FILTE_SHIFT 5
#define LLWU_FILT2_FILTE_WIDTH 2
#define LLWU_FILT2_FILTE(x) (((uint8_t)(((uint8_t)(x))<<LLWU_FILT2_FILTE_SHIFT))&LLWU_FILT2_FILTE_MASK)
#define LLWU_FILT2_FILTF_MASK 0x80u
#define LLWU_FILT2_FILTF_SHIFT 7
#define LLWU_FILT2_FILTF_WIDTH 1
#define LLWU_FILT2_FILTF(x) (((uint8_t)(((uint8_t)(x))<<LLWU_FILT2_FILTF_SHIFT))&LLWU_FILT2_FILTF_MASK)
# 2312 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define LLWU_BASE (0x4007C000u)

#define LLWU ((LLWU_Type *)LLWU_BASE)
#define LLWU_BASE_PTR (LLWU)

#define LLWU_BASE_ADDRS { LLWU_BASE }

#define LLWU_BASE_PTRS { LLWU }
# 2333 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define LLWU_PE1 LLWU_PE1_REG(LLWU)
#define LLWU_PE2 LLWU_PE2_REG(LLWU)
#define LLWU_ME LLWU_ME_REG(LLWU)
#define LLWU_F1 LLWU_F1_REG(LLWU)
#define LLWU_F3 LLWU_F3_REG(LLWU)
#define LLWU_FILT1 LLWU_FILT1_REG(LLWU)
#define LLWU_FILT2 LLWU_FILT2_REG(LLWU)
# 2361 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint32_t CSR;
  volatile uint32_t PSR;
  volatile uint32_t CMR;
  volatile uint32_t CNR;
} LPTMR_Type, *LPTMR_MemMapPtr;
# 2379 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define LPTMR_CSR_REG(base) ((base)->CSR)
#define LPTMR_PSR_REG(base) ((base)->PSR)
#define LPTMR_CMR_REG(base) ((base)->CMR)
#define LPTMR_CNR_REG(base) ((base)->CNR)
# 2399 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define LPTMR_CSR_TEN_MASK 0x1u
#define LPTMR_CSR_TEN_SHIFT 0
#define LPTMR_CSR_TEN_WIDTH 1
#define LPTMR_CSR_TEN(x) (((uint32_t)(((uint32_t)(x))<<LPTMR_CSR_TEN_SHIFT))&LPTMR_CSR_TEN_MASK)
#define LPTMR_CSR_TMS_MASK 0x2u
#define LPTMR_CSR_TMS_SHIFT 1
#define LPTMR_CSR_TMS_WIDTH 1
#define LPTMR_CSR_TMS(x) (((uint32_t)(((uint32_t)(x))<<LPTMR_CSR_TMS_SHIFT))&LPTMR_CSR_TMS_MASK)
#define LPTMR_CSR_TFC_MASK 0x4u
#define LPTMR_CSR_TFC_SHIFT 2
#define LPTMR_CSR_TFC_WIDTH 1
#define LPTMR_CSR_TFC(x) (((uint32_t)(((uint32_t)(x))<<LPTMR_CSR_TFC_SHIFT))&LPTMR_CSR_TFC_MASK)
#define LPTMR_CSR_TPP_MASK 0x8u
#define LPTMR_CSR_TPP_SHIFT 3
#define LPTMR_CSR_TPP_WIDTH 1
#define LPTMR_CSR_TPP(x) (((uint32_t)(((uint32_t)(x))<<LPTMR_CSR_TPP_SHIFT))&LPTMR_CSR_TPP_MASK)
#define LPTMR_CSR_TPS_MASK 0x30u
#define LPTMR_CSR_TPS_SHIFT 4
#define LPTMR_CSR_TPS_WIDTH 2
#define LPTMR_CSR_TPS(x) (((uint32_t)(((uint32_t)(x))<<LPTMR_CSR_TPS_SHIFT))&LPTMR_CSR_TPS_MASK)
#define LPTMR_CSR_TIE_MASK 0x40u
#define LPTMR_CSR_TIE_SHIFT 6
#define LPTMR_CSR_TIE_WIDTH 1
#define LPTMR_CSR_TIE(x) (((uint32_t)(((uint32_t)(x))<<LPTMR_CSR_TIE_SHIFT))&LPTMR_CSR_TIE_MASK)
#define LPTMR_CSR_TCF_MASK 0x80u
#define LPTMR_CSR_TCF_SHIFT 7
#define LPTMR_CSR_TCF_WIDTH 1
#define LPTMR_CSR_TCF(x) (((uint32_t)(((uint32_t)(x))<<LPTMR_CSR_TCF_SHIFT))&LPTMR_CSR_TCF_MASK)

#define LPTMR_PSR_PCS_MASK 0x3u
#define LPTMR_PSR_PCS_SHIFT 0
#define LPTMR_PSR_PCS_WIDTH 2
#define LPTMR_PSR_PCS(x) (((uint32_t)(((uint32_t)(x))<<LPTMR_PSR_PCS_SHIFT))&LPTMR_PSR_PCS_MASK)
#define LPTMR_PSR_PBYP_MASK 0x4u
#define LPTMR_PSR_PBYP_SHIFT 2
#define LPTMR_PSR_PBYP_WIDTH 1
#define LPTMR_PSR_PBYP(x) (((uint32_t)(((uint32_t)(x))<<LPTMR_PSR_PBYP_SHIFT))&LPTMR_PSR_PBYP_MASK)
#define LPTMR_PSR_PRESCALE_MASK 0x78u
#define LPTMR_PSR_PRESCALE_SHIFT 3
#define LPTMR_PSR_PRESCALE_WIDTH 4
#define LPTMR_PSR_PRESCALE(x) (((uint32_t)(((uint32_t)(x))<<LPTMR_PSR_PRESCALE_SHIFT))&LPTMR_PSR_PRESCALE_MASK)

#define LPTMR_CMR_COMPARE_MASK 0xFFFFu
#define LPTMR_CMR_COMPARE_SHIFT 0
#define LPTMR_CMR_COMPARE_WIDTH 16
#define LPTMR_CMR_COMPARE(x) (((uint32_t)(((uint32_t)(x))<<LPTMR_CMR_COMPARE_SHIFT))&LPTMR_CMR_COMPARE_MASK)

#define LPTMR_CNR_COUNTER_MASK 0xFFFFu
#define LPTMR_CNR_COUNTER_SHIFT 0
#define LPTMR_CNR_COUNTER_WIDTH 16
#define LPTMR_CNR_COUNTER(x) (((uint32_t)(((uint32_t)(x))<<LPTMR_CNR_COUNTER_SHIFT))&LPTMR_CNR_COUNTER_MASK)
# 2458 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define LPTMR0_BASE (0x40040000u)

#define LPTMR0 ((LPTMR_Type *)LPTMR0_BASE)
#define LPTMR0_BASE_PTR (LPTMR0)

#define LPTMR_BASE_ADDRS { LPTMR0_BASE }

#define LPTMR_BASE_PTRS { LPTMR0 }
# 2479 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define LPTMR0_CSR LPTMR_CSR_REG(LPTMR0)
#define LPTMR0_PSR LPTMR_PSR_REG(LPTMR0)
#define LPTMR0_CMR LPTMR_CMR_REG(LPTMR0)
#define LPTMR0_CNR LPTMR_CNR_REG(LPTMR0)
# 2504 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint8_t C1;
  volatile uint8_t C2;
  volatile uint8_t C3;
  volatile uint8_t C4;
  volatile const uint8_t C5;
  volatile uint8_t C6;
  volatile const uint8_t S;
       uint8_t RESERVED_0[1];
  volatile uint8_t SC;
       uint8_t RESERVED_1[1];
  volatile uint8_t ATCVH;
  volatile uint8_t ATCVL;
} MCG_Type, *MCG_MemMapPtr;
# 2530 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define MCG_C1_REG(base) ((base)->C1)
#define MCG_C2_REG(base) ((base)->C2)
#define MCG_C3_REG(base) ((base)->C3)
#define MCG_C4_REG(base) ((base)->C4)
#define MCG_C5_REG(base) ((base)->C5)
#define MCG_C6_REG(base) ((base)->C6)
#define MCG_S_REG(base) ((base)->S)
#define MCG_SC_REG(base) ((base)->SC)
#define MCG_ATCVH_REG(base) ((base)->ATCVH)
#define MCG_ATCVL_REG(base) ((base)->ATCVL)
# 2556 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define MCG_C1_IREFSTEN_MASK 0x1u
#define MCG_C1_IREFSTEN_SHIFT 0
#define MCG_C1_IREFSTEN_WIDTH 1
#define MCG_C1_IREFSTEN(x) (((uint8_t)(((uint8_t)(x))<<MCG_C1_IREFSTEN_SHIFT))&MCG_C1_IREFSTEN_MASK)
#define MCG_C1_IRCLKEN_MASK 0x2u
#define MCG_C1_IRCLKEN_SHIFT 1
#define MCG_C1_IRCLKEN_WIDTH 1
#define MCG_C1_IRCLKEN(x) (((uint8_t)(((uint8_t)(x))<<MCG_C1_IRCLKEN_SHIFT))&MCG_C1_IRCLKEN_MASK)
#define MCG_C1_IREFS_MASK 0x4u
#define MCG_C1_IREFS_SHIFT 2
#define MCG_C1_IREFS_WIDTH 1
#define MCG_C1_IREFS(x) (((uint8_t)(((uint8_t)(x))<<MCG_C1_IREFS_SHIFT))&MCG_C1_IREFS_MASK)
#define MCG_C1_FRDIV_MASK 0x38u
#define MCG_C1_FRDIV_SHIFT 3
#define MCG_C1_FRDIV_WIDTH 3
#define MCG_C1_FRDIV(x) (((uint8_t)(((uint8_t)(x))<<MCG_C1_FRDIV_SHIFT))&MCG_C1_FRDIV_MASK)
#define MCG_C1_CLKS_MASK 0xC0u
#define MCG_C1_CLKS_SHIFT 6
#define MCG_C1_CLKS_WIDTH 2
#define MCG_C1_CLKS(x) (((uint8_t)(((uint8_t)(x))<<MCG_C1_CLKS_SHIFT))&MCG_C1_CLKS_MASK)

#define MCG_C2_IRCS_MASK 0x1u
#define MCG_C2_IRCS_SHIFT 0
#define MCG_C2_IRCS_WIDTH 1
#define MCG_C2_IRCS(x) (((uint8_t)(((uint8_t)(x))<<MCG_C2_IRCS_SHIFT))&MCG_C2_IRCS_MASK)
#define MCG_C2_LP_MASK 0x2u
#define MCG_C2_LP_SHIFT 1
#define MCG_C2_LP_WIDTH 1
#define MCG_C2_LP(x) (((uint8_t)(((uint8_t)(x))<<MCG_C2_LP_SHIFT))&MCG_C2_LP_MASK)
#define MCG_C2_EREFS0_MASK 0x4u
#define MCG_C2_EREFS0_SHIFT 2
#define MCG_C2_EREFS0_WIDTH 1
#define MCG_C2_EREFS0(x) (((uint8_t)(((uint8_t)(x))<<MCG_C2_EREFS0_SHIFT))&MCG_C2_EREFS0_MASK)
#define MCG_C2_HGO0_MASK 0x8u
#define MCG_C2_HGO0_SHIFT 3
#define MCG_C2_HGO0_WIDTH 1
#define MCG_C2_HGO0(x) (((uint8_t)(((uint8_t)(x))<<MCG_C2_HGO0_SHIFT))&MCG_C2_HGO0_MASK)
#define MCG_C2_RANGE0_MASK 0x30u
#define MCG_C2_RANGE0_SHIFT 4
#define MCG_C2_RANGE0_WIDTH 2
#define MCG_C2_RANGE0(x) (((uint8_t)(((uint8_t)(x))<<MCG_C2_RANGE0_SHIFT))&MCG_C2_RANGE0_MASK)
#define MCG_C2_LOCRE0_MASK 0x80u
#define MCG_C2_LOCRE0_SHIFT 7
#define MCG_C2_LOCRE0_WIDTH 1
#define MCG_C2_LOCRE0(x) (((uint8_t)(((uint8_t)(x))<<MCG_C2_LOCRE0_SHIFT))&MCG_C2_LOCRE0_MASK)

#define MCG_C3_SCTRIM_MASK 0xFFu
#define MCG_C3_SCTRIM_SHIFT 0
#define MCG_C3_SCTRIM_WIDTH 8
#define MCG_C3_SCTRIM(x) (((uint8_t)(((uint8_t)(x))<<MCG_C3_SCTRIM_SHIFT))&MCG_C3_SCTRIM_MASK)

#define MCG_C4_SCFTRIM_MASK 0x1u
#define MCG_C4_SCFTRIM_SHIFT 0
#define MCG_C4_SCFTRIM_WIDTH 1
#define MCG_C4_SCFTRIM(x) (((uint8_t)(((uint8_t)(x))<<MCG_C4_SCFTRIM_SHIFT))&MCG_C4_SCFTRIM_MASK)
#define MCG_C4_FCTRIM_MASK 0x1Eu
#define MCG_C4_FCTRIM_SHIFT 1
#define MCG_C4_FCTRIM_WIDTH 4
#define MCG_C4_FCTRIM(x) (((uint8_t)(((uint8_t)(x))<<MCG_C4_FCTRIM_SHIFT))&MCG_C4_FCTRIM_MASK)
#define MCG_C4_DRST_DRS_MASK 0x60u
#define MCG_C4_DRST_DRS_SHIFT 5
#define MCG_C4_DRST_DRS_WIDTH 2
#define MCG_C4_DRST_DRS(x) (((uint8_t)(((uint8_t)(x))<<MCG_C4_DRST_DRS_SHIFT))&MCG_C4_DRST_DRS_MASK)
#define MCG_C4_DMX32_MASK 0x80u
#define MCG_C4_DMX32_SHIFT 7
#define MCG_C4_DMX32_WIDTH 1
#define MCG_C4_DMX32(x) (((uint8_t)(((uint8_t)(x))<<MCG_C4_DMX32_SHIFT))&MCG_C4_DMX32_MASK)

#define MCG_C6_CME_MASK 0x20u
#define MCG_C6_CME_SHIFT 5
#define MCG_C6_CME_WIDTH 1
#define MCG_C6_CME(x) (((uint8_t)(((uint8_t)(x))<<MCG_C6_CME_SHIFT))&MCG_C6_CME_MASK)

#define MCG_S_IRCST_MASK 0x1u
#define MCG_S_IRCST_SHIFT 0
#define MCG_S_IRCST_WIDTH 1
#define MCG_S_IRCST(x) (((uint8_t)(((uint8_t)(x))<<MCG_S_IRCST_SHIFT))&MCG_S_IRCST_MASK)
#define MCG_S_OSCINIT0_MASK 0x2u
#define MCG_S_OSCINIT0_SHIFT 1
#define MCG_S_OSCINIT0_WIDTH 1
#define MCG_S_OSCINIT0(x) (((uint8_t)(((uint8_t)(x))<<MCG_S_OSCINIT0_SHIFT))&MCG_S_OSCINIT0_MASK)
#define MCG_S_CLKST_MASK 0xCu
#define MCG_S_CLKST_SHIFT 2
#define MCG_S_CLKST_WIDTH 2
#define MCG_S_CLKST(x) (((uint8_t)(((uint8_t)(x))<<MCG_S_CLKST_SHIFT))&MCG_S_CLKST_MASK)
#define MCG_S_IREFST_MASK 0x10u
#define MCG_S_IREFST_SHIFT 4
#define MCG_S_IREFST_WIDTH 1
#define MCG_S_IREFST(x) (((uint8_t)(((uint8_t)(x))<<MCG_S_IREFST_SHIFT))&MCG_S_IREFST_MASK)

#define MCG_SC_LOCS0_MASK 0x1u
#define MCG_SC_LOCS0_SHIFT 0
#define MCG_SC_LOCS0_WIDTH 1
#define MCG_SC_LOCS0(x) (((uint8_t)(((uint8_t)(x))<<MCG_SC_LOCS0_SHIFT))&MCG_SC_LOCS0_MASK)
#define MCG_SC_FCRDIV_MASK 0xEu
#define MCG_SC_FCRDIV_SHIFT 1
#define MCG_SC_FCRDIV_WIDTH 3
#define MCG_SC_FCRDIV(x) (((uint8_t)(((uint8_t)(x))<<MCG_SC_FCRDIV_SHIFT))&MCG_SC_FCRDIV_MASK)
#define MCG_SC_FLTPRSRV_MASK 0x10u
#define MCG_SC_FLTPRSRV_SHIFT 4
#define MCG_SC_FLTPRSRV_WIDTH 1
#define MCG_SC_FLTPRSRV(x) (((uint8_t)(((uint8_t)(x))<<MCG_SC_FLTPRSRV_SHIFT))&MCG_SC_FLTPRSRV_MASK)
#define MCG_SC_ATMF_MASK 0x20u
#define MCG_SC_ATMF_SHIFT 5
#define MCG_SC_ATMF_WIDTH 1
#define MCG_SC_ATMF(x) (((uint8_t)(((uint8_t)(x))<<MCG_SC_ATMF_SHIFT))&MCG_SC_ATMF_MASK)
#define MCG_SC_ATMS_MASK 0x40u
#define MCG_SC_ATMS_SHIFT 6
#define MCG_SC_ATMS_WIDTH 1
#define MCG_SC_ATMS(x) (((uint8_t)(((uint8_t)(x))<<MCG_SC_ATMS_SHIFT))&MCG_SC_ATMS_MASK)
#define MCG_SC_ATME_MASK 0x80u
#define MCG_SC_ATME_SHIFT 7
#define MCG_SC_ATME_WIDTH 1
#define MCG_SC_ATME(x) (((uint8_t)(((uint8_t)(x))<<MCG_SC_ATME_SHIFT))&MCG_SC_ATME_MASK)

#define MCG_ATCVH_ATCVH_MASK 0xFFu
#define MCG_ATCVH_ATCVH_SHIFT 0
#define MCG_ATCVH_ATCVH_WIDTH 8
#define MCG_ATCVH_ATCVH(x) (((uint8_t)(((uint8_t)(x))<<MCG_ATCVH_ATCVH_SHIFT))&MCG_ATCVH_ATCVH_MASK)

#define MCG_ATCVL_ATCVL_MASK 0xFFu
#define MCG_ATCVL_ATCVL_SHIFT 0
#define MCG_ATCVL_ATCVL_WIDTH 8
#define MCG_ATCVL_ATCVL(x) (((uint8_t)(((uint8_t)(x))<<MCG_ATCVL_ATCVL_SHIFT))&MCG_ATCVL_ATCVL_MASK)
# 2688 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define MCG_BASE (0x40064000u)

#define MCG ((MCG_Type *)MCG_BASE)
#define MCG_BASE_PTR (MCG)

#define MCG_BASE_ADDRS { MCG_BASE }

#define MCG_BASE_PTRS { MCG }
# 2709 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define MCG_C1 MCG_C1_REG(MCG)
#define MCG_C2 MCG_C2_REG(MCG)
#define MCG_C3 MCG_C3_REG(MCG)
#define MCG_C4 MCG_C4_REG(MCG)
#define MCG_C5 MCG_C5_REG(MCG)
#define MCG_C6 MCG_C6_REG(MCG)
#define MCG_S MCG_S_REG(MCG)
#define MCG_SC MCG_SC_REG(MCG)
#define MCG_ATCVH MCG_ATCVH_REG(MCG)
#define MCG_ATCVL MCG_ATCVL_REG(MCG)






#define MCG_C2_EREFS_MASK (MCG_C2_EREFS0_MASK)
#define MCG_C2_EREFS_SHIFT (MCG_C2_EREFS0_SHIFT)
#define MCG_C2_EREFS_WIDTH (MCG_C2_EREFS0_WIDTH)
#define MCG_C2_EREFS(x) (MCG_C2_EREFS0(x))


#define MCG_C2_HGO_MASK (MCG_C2_HGO0_MASK)
#define MCG_C2_HGO_SHIFT (MCG_C2_HGO0_SHIFT)
#define MCG_C2_HGO_WIDTH (MCG_C2_HGO0_WIDTH)
#define MCG_C2_HGO(x) (MCG_C2_HGO0(x))


#define MCG_C2_RANGE_MASK (MCG_C2_RANGE0_MASK)
#define MCG_C2_RANGE_SHIFT (MCG_C2_RANGE0_SHIFT)
#define MCG_C2_RANGE_WIDTH (MCG_C2_RANGE0_WIDTH)
#define MCG_C2_RANGE(x) (MCG_C2_RANGE0(x))
# 2758 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
       uint8_t RESERVED_0[8];
  volatile const uint16_t PLASC;
  volatile const uint16_t PLAMC;
  volatile uint32_t PLACR;
       uint8_t RESERVED_1[48];
  volatile uint32_t CPO;
} MCM_Type, *MCM_MemMapPtr;
# 2778 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define MCM_PLASC_REG(base) ((base)->PLASC)
#define MCM_PLAMC_REG(base) ((base)->PLAMC)
#define MCM_PLACR_REG(base) ((base)->PLACR)
#define MCM_CPO_REG(base) ((base)->CPO)
# 2798 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define MCM_PLASC_ASC_MASK 0xFFu
#define MCM_PLASC_ASC_SHIFT 0
#define MCM_PLASC_ASC_WIDTH 8
#define MCM_PLASC_ASC(x) (((uint16_t)(((uint16_t)(x))<<MCM_PLASC_ASC_SHIFT))&MCM_PLASC_ASC_MASK)

#define MCM_PLAMC_AMC_MASK 0xFFu
#define MCM_PLAMC_AMC_SHIFT 0
#define MCM_PLAMC_AMC_WIDTH 8
#define MCM_PLAMC_AMC(x) (((uint16_t)(((uint16_t)(x))<<MCM_PLAMC_AMC_SHIFT))&MCM_PLAMC_AMC_MASK)

#define MCM_PLACR_ARB_MASK 0x200u
#define MCM_PLACR_ARB_SHIFT 9
#define MCM_PLACR_ARB_WIDTH 1
#define MCM_PLACR_ARB(x) (((uint32_t)(((uint32_t)(x))<<MCM_PLACR_ARB_SHIFT))&MCM_PLACR_ARB_MASK)
#define MCM_PLACR_CFCC_MASK 0x400u
#define MCM_PLACR_CFCC_SHIFT 10
#define MCM_PLACR_CFCC_WIDTH 1
#define MCM_PLACR_CFCC(x) (((uint32_t)(((uint32_t)(x))<<MCM_PLACR_CFCC_SHIFT))&MCM_PLACR_CFCC_MASK)
#define MCM_PLACR_DFCDA_MASK 0x800u
#define MCM_PLACR_DFCDA_SHIFT 11
#define MCM_PLACR_DFCDA_WIDTH 1
#define MCM_PLACR_DFCDA(x) (((uint32_t)(((uint32_t)(x))<<MCM_PLACR_DFCDA_SHIFT))&MCM_PLACR_DFCDA_MASK)
#define MCM_PLACR_DFCIC_MASK 0x1000u
#define MCM_PLACR_DFCIC_SHIFT 12
#define MCM_PLACR_DFCIC_WIDTH 1
#define MCM_PLACR_DFCIC(x) (((uint32_t)(((uint32_t)(x))<<MCM_PLACR_DFCIC_SHIFT))&MCM_PLACR_DFCIC_MASK)
#define MCM_PLACR_DFCC_MASK 0x2000u
#define MCM_PLACR_DFCC_SHIFT 13
#define MCM_PLACR_DFCC_WIDTH 1
#define MCM_PLACR_DFCC(x) (((uint32_t)(((uint32_t)(x))<<MCM_PLACR_DFCC_SHIFT))&MCM_PLACR_DFCC_MASK)
#define MCM_PLACR_EFDS_MASK 0x4000u
#define MCM_PLACR_EFDS_SHIFT 14
#define MCM_PLACR_EFDS_WIDTH 1
#define MCM_PLACR_EFDS(x) (((uint32_t)(((uint32_t)(x))<<MCM_PLACR_EFDS_SHIFT))&MCM_PLACR_EFDS_MASK)
#define MCM_PLACR_DFCS_MASK 0x8000u
#define MCM_PLACR_DFCS_SHIFT 15
#define MCM_PLACR_DFCS_WIDTH 1
#define MCM_PLACR_DFCS(x) (((uint32_t)(((uint32_t)(x))<<MCM_PLACR_DFCS_SHIFT))&MCM_PLACR_DFCS_MASK)
#define MCM_PLACR_ESFC_MASK 0x10000u
#define MCM_PLACR_ESFC_SHIFT 16
#define MCM_PLACR_ESFC_WIDTH 1
#define MCM_PLACR_ESFC(x) (((uint32_t)(((uint32_t)(x))<<MCM_PLACR_ESFC_SHIFT))&MCM_PLACR_ESFC_MASK)

#define MCM_CPO_CPOREQ_MASK 0x1u
#define MCM_CPO_CPOREQ_SHIFT 0
#define MCM_CPO_CPOREQ_WIDTH 1
#define MCM_CPO_CPOREQ(x) (((uint32_t)(((uint32_t)(x))<<MCM_CPO_CPOREQ_SHIFT))&MCM_CPO_CPOREQ_MASK)
#define MCM_CPO_CPOACK_MASK 0x2u
#define MCM_CPO_CPOACK_SHIFT 1
#define MCM_CPO_CPOACK_WIDTH 1
#define MCM_CPO_CPOACK(x) (((uint32_t)(((uint32_t)(x))<<MCM_CPO_CPOACK_SHIFT))&MCM_CPO_CPOACK_MASK)
#define MCM_CPO_CPOWOI_MASK 0x4u
#define MCM_CPO_CPOWOI_SHIFT 2
#define MCM_CPO_CPOWOI_WIDTH 1
#define MCM_CPO_CPOWOI(x) (((uint32_t)(((uint32_t)(x))<<MCM_CPO_CPOWOI_SHIFT))&MCM_CPO_CPOWOI_MASK)
# 2861 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define MCM_BASE (0xF0003000u)

#define MCM ((MCM_Type *)MCM_BASE)
#define MCM_BASE_PTR (MCM)

#define MCM_BASE_ADDRS { MCM_BASE }

#define MCM_BASE_PTRS { MCM }
# 2882 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define MCM_PLASC MCM_PLASC_REG(MCM)
#define MCM_PLAMC MCM_PLAMC_REG(MCM)
#define MCM_PLACR MCM_PLACR_REG(MCM)
#define MCM_CPO MCM_CPO_REG(MCM)
# 2907 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint32_t POSITION;
  volatile uint32_t MASTER;
  volatile uint32_t FLOW;
  volatile const uint32_t BASE;
       uint8_t RESERVED_0[3824];
  volatile const uint32_t MODECTRL;
       uint8_t RESERVED_1[156];
  volatile const uint32_t TAGSET;
  volatile const uint32_t TAGCLEAR;
       uint8_t RESERVED_2[8];
  volatile const uint32_t LOCKACCESS;
  volatile const uint32_t LOCKSTAT;
  volatile const uint32_t AUTHSTAT;
  volatile const uint32_t DEVICEARCH;
       uint8_t RESERVED_3[8];
  volatile const uint32_t DEVICECFG;
  volatile const uint32_t DEVICETYPID;
  volatile const uint32_t PERIPHID[8];
  volatile const uint32_t COMPID[4];
} MTB_Type, *MTB_MemMapPtr;
# 2940 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define MTB_POSITION_REG(base) ((base)->POSITION)
#define MTB_MASTER_REG(base) ((base)->MASTER)
#define MTB_FLOW_REG(base) ((base)->FLOW)
#define MTB_BASE_REG(base) ((base)->BASE)
#define MTB_MODECTRL_REG(base) ((base)->MODECTRL)
#define MTB_TAGSET_REG(base) ((base)->TAGSET)
#define MTB_TAGCLEAR_REG(base) ((base)->TAGCLEAR)
#define MTB_LOCKACCESS_REG(base) ((base)->LOCKACCESS)
#define MTB_LOCKSTAT_REG(base) ((base)->LOCKSTAT)
#define MTB_AUTHSTAT_REG(base) ((base)->AUTHSTAT)
#define MTB_DEVICEARCH_REG(base) ((base)->DEVICEARCH)
#define MTB_DEVICECFG_REG(base) ((base)->DEVICECFG)
#define MTB_DEVICETYPID_REG(base) ((base)->DEVICETYPID)
#define MTB_PERIPHID_REG(base,index) ((base)->PERIPHID[index])
#define MTB_PERIPHID_COUNT 8
#define MTB_COMPID_REG(base,index) ((base)->COMPID[index])
#define MTB_COMPID_COUNT 4
# 2973 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define MTB_POSITION_WRAP_MASK 0x4u
#define MTB_POSITION_WRAP_SHIFT 2
#define MTB_POSITION_WRAP_WIDTH 1
#define MTB_POSITION_WRAP(x) (((uint32_t)(((uint32_t)(x))<<MTB_POSITION_WRAP_SHIFT))&MTB_POSITION_WRAP_MASK)
#define MTB_POSITION_POINTER_MASK 0xFFFFFFF8u
#define MTB_POSITION_POINTER_SHIFT 3
#define MTB_POSITION_POINTER_WIDTH 29
#define MTB_POSITION_POINTER(x) (((uint32_t)(((uint32_t)(x))<<MTB_POSITION_POINTER_SHIFT))&MTB_POSITION_POINTER_MASK)

#define MTB_MASTER_MASK_MASK 0x1Fu
#define MTB_MASTER_MASK_SHIFT 0
#define MTB_MASTER_MASK_WIDTH 5
#define MTB_MASTER_MASK(x) (((uint32_t)(((uint32_t)(x))<<MTB_MASTER_MASK_SHIFT))&MTB_MASTER_MASK_MASK)
#define MTB_MASTER_TSTARTEN_MASK 0x20u
#define MTB_MASTER_TSTARTEN_SHIFT 5
#define MTB_MASTER_TSTARTEN_WIDTH 1
#define MTB_MASTER_TSTARTEN(x) (((uint32_t)(((uint32_t)(x))<<MTB_MASTER_TSTARTEN_SHIFT))&MTB_MASTER_TSTARTEN_MASK)
#define MTB_MASTER_TSTOPEN_MASK 0x40u
#define MTB_MASTER_TSTOPEN_SHIFT 6
#define MTB_MASTER_TSTOPEN_WIDTH 1
#define MTB_MASTER_TSTOPEN(x) (((uint32_t)(((uint32_t)(x))<<MTB_MASTER_TSTOPEN_SHIFT))&MTB_MASTER_TSTOPEN_MASK)
#define MTB_MASTER_SFRWPRIV_MASK 0x80u
#define MTB_MASTER_SFRWPRIV_SHIFT 7
#define MTB_MASTER_SFRWPRIV_WIDTH 1
#define MTB_MASTER_SFRWPRIV(x) (((uint32_t)(((uint32_t)(x))<<MTB_MASTER_SFRWPRIV_SHIFT))&MTB_MASTER_SFRWPRIV_MASK)
#define MTB_MASTER_RAMPRIV_MASK 0x100u
#define MTB_MASTER_RAMPRIV_SHIFT 8
#define MTB_MASTER_RAMPRIV_WIDTH 1
#define MTB_MASTER_RAMPRIV(x) (((uint32_t)(((uint32_t)(x))<<MTB_MASTER_RAMPRIV_SHIFT))&MTB_MASTER_RAMPRIV_MASK)
#define MTB_MASTER_HALTREQ_MASK 0x200u
#define MTB_MASTER_HALTREQ_SHIFT 9
#define MTB_MASTER_HALTREQ_WIDTH 1
#define MTB_MASTER_HALTREQ(x) (((uint32_t)(((uint32_t)(x))<<MTB_MASTER_HALTREQ_SHIFT))&MTB_MASTER_HALTREQ_MASK)
#define MTB_MASTER_EN_MASK 0x80000000u
#define MTB_MASTER_EN_SHIFT 31
#define MTB_MASTER_EN_WIDTH 1
#define MTB_MASTER_EN(x) (((uint32_t)(((uint32_t)(x))<<MTB_MASTER_EN_SHIFT))&MTB_MASTER_EN_MASK)

#define MTB_FLOW_AUTOSTOP_MASK 0x1u
#define MTB_FLOW_AUTOSTOP_SHIFT 0
#define MTB_FLOW_AUTOSTOP_WIDTH 1
#define MTB_FLOW_AUTOSTOP(x) (((uint32_t)(((uint32_t)(x))<<MTB_FLOW_AUTOSTOP_SHIFT))&MTB_FLOW_AUTOSTOP_MASK)
#define MTB_FLOW_AUTOHALT_MASK 0x2u
#define MTB_FLOW_AUTOHALT_SHIFT 1
#define MTB_FLOW_AUTOHALT_WIDTH 1
#define MTB_FLOW_AUTOHALT(x) (((uint32_t)(((uint32_t)(x))<<MTB_FLOW_AUTOHALT_SHIFT))&MTB_FLOW_AUTOHALT_MASK)
#define MTB_FLOW_WATERMARK_MASK 0xFFFFFFF8u
#define MTB_FLOW_WATERMARK_SHIFT 3
#define MTB_FLOW_WATERMARK_WIDTH 29
#define MTB_FLOW_WATERMARK(x) (((uint32_t)(((uint32_t)(x))<<MTB_FLOW_WATERMARK_SHIFT))&MTB_FLOW_WATERMARK_MASK)

#define MTB_BASE_BASEADDR_MASK 0xFFFFFFFFu
#define MTB_BASE_BASEADDR_SHIFT 0
#define MTB_BASE_BASEADDR_WIDTH 32
#define MTB_BASE_BASEADDR(x) (((uint32_t)(((uint32_t)(x))<<MTB_BASE_BASEADDR_SHIFT))&MTB_BASE_BASEADDR_MASK)

#define MTB_MODECTRL_MODECTRL_MASK 0xFFFFFFFFu
#define MTB_MODECTRL_MODECTRL_SHIFT 0
#define MTB_MODECTRL_MODECTRL_WIDTH 32
#define MTB_MODECTRL_MODECTRL(x) (((uint32_t)(((uint32_t)(x))<<MTB_MODECTRL_MODECTRL_SHIFT))&MTB_MODECTRL_MODECTRL_MASK)

#define MTB_TAGSET_TAGSET_MASK 0xFFFFFFFFu
#define MTB_TAGSET_TAGSET_SHIFT 0
#define MTB_TAGSET_TAGSET_WIDTH 32
#define MTB_TAGSET_TAGSET(x) (((uint32_t)(((uint32_t)(x))<<MTB_TAGSET_TAGSET_SHIFT))&MTB_TAGSET_TAGSET_MASK)

#define MTB_TAGCLEAR_TAGCLEAR_MASK 0xFFFFFFFFu
#define MTB_TAGCLEAR_TAGCLEAR_SHIFT 0
#define MTB_TAGCLEAR_TAGCLEAR_WIDTH 32
#define MTB_TAGCLEAR_TAGCLEAR(x) (((uint32_t)(((uint32_t)(x))<<MTB_TAGCLEAR_TAGCLEAR_SHIFT))&MTB_TAGCLEAR_TAGCLEAR_MASK)

#define MTB_LOCKACCESS_LOCKACCESS_MASK 0xFFFFFFFFu
#define MTB_LOCKACCESS_LOCKACCESS_SHIFT 0
#define MTB_LOCKACCESS_LOCKACCESS_WIDTH 32
#define MTB_LOCKACCESS_LOCKACCESS(x) (((uint32_t)(((uint32_t)(x))<<MTB_LOCKACCESS_LOCKACCESS_SHIFT))&MTB_LOCKACCESS_LOCKACCESS_MASK)

#define MTB_LOCKSTAT_LOCKSTAT_MASK 0xFFFFFFFFu
#define MTB_LOCKSTAT_LOCKSTAT_SHIFT 0
#define MTB_LOCKSTAT_LOCKSTAT_WIDTH 32
#define MTB_LOCKSTAT_LOCKSTAT(x) (((uint32_t)(((uint32_t)(x))<<MTB_LOCKSTAT_LOCKSTAT_SHIFT))&MTB_LOCKSTAT_LOCKSTAT_MASK)

#define MTB_AUTHSTAT_BIT0_MASK 0x1u
#define MTB_AUTHSTAT_BIT0_SHIFT 0
#define MTB_AUTHSTAT_BIT0_WIDTH 1
#define MTB_AUTHSTAT_BIT0(x) (((uint32_t)(((uint32_t)(x))<<MTB_AUTHSTAT_BIT0_SHIFT))&MTB_AUTHSTAT_BIT0_MASK)
#define MTB_AUTHSTAT_BIT1_MASK 0x2u
#define MTB_AUTHSTAT_BIT1_SHIFT 1
#define MTB_AUTHSTAT_BIT1_WIDTH 1
#define MTB_AUTHSTAT_BIT1(x) (((uint32_t)(((uint32_t)(x))<<MTB_AUTHSTAT_BIT1_SHIFT))&MTB_AUTHSTAT_BIT1_MASK)
#define MTB_AUTHSTAT_BIT2_MASK 0x4u
#define MTB_AUTHSTAT_BIT2_SHIFT 2
#define MTB_AUTHSTAT_BIT2_WIDTH 1
#define MTB_AUTHSTAT_BIT2(x) (((uint32_t)(((uint32_t)(x))<<MTB_AUTHSTAT_BIT2_SHIFT))&MTB_AUTHSTAT_BIT2_MASK)
#define MTB_AUTHSTAT_BIT3_MASK 0x8u
#define MTB_AUTHSTAT_BIT3_SHIFT 3
#define MTB_AUTHSTAT_BIT3_WIDTH 1
#define MTB_AUTHSTAT_BIT3(x) (((uint32_t)(((uint32_t)(x))<<MTB_AUTHSTAT_BIT3_SHIFT))&MTB_AUTHSTAT_BIT3_MASK)

#define MTB_DEVICEARCH_DEVICEARCH_MASK 0xFFFFFFFFu
#define MTB_DEVICEARCH_DEVICEARCH_SHIFT 0
#define MTB_DEVICEARCH_DEVICEARCH_WIDTH 32
#define MTB_DEVICEARCH_DEVICEARCH(x) (((uint32_t)(((uint32_t)(x))<<MTB_DEVICEARCH_DEVICEARCH_SHIFT))&MTB_DEVICEARCH_DEVICEARCH_MASK)

#define MTB_DEVICECFG_DEVICECFG_MASK 0xFFFFFFFFu
#define MTB_DEVICECFG_DEVICECFG_SHIFT 0
#define MTB_DEVICECFG_DEVICECFG_WIDTH 32
#define MTB_DEVICECFG_DEVICECFG(x) (((uint32_t)(((uint32_t)(x))<<MTB_DEVICECFG_DEVICECFG_SHIFT))&MTB_DEVICECFG_DEVICECFG_MASK)

#define MTB_DEVICETYPID_DEVICETYPID_MASK 0xFFFFFFFFu
#define MTB_DEVICETYPID_DEVICETYPID_SHIFT 0
#define MTB_DEVICETYPID_DEVICETYPID_WIDTH 32
#define MTB_DEVICETYPID_DEVICETYPID(x) (((uint32_t)(((uint32_t)(x))<<MTB_DEVICETYPID_DEVICETYPID_SHIFT))&MTB_DEVICETYPID_DEVICETYPID_MASK)

#define MTB_PERIPHID_PERIPHID_MASK 0xFFFFFFFFu
#define MTB_PERIPHID_PERIPHID_SHIFT 0
#define MTB_PERIPHID_PERIPHID_WIDTH 32
#define MTB_PERIPHID_PERIPHID(x) (((uint32_t)(((uint32_t)(x))<<MTB_PERIPHID_PERIPHID_SHIFT))&MTB_PERIPHID_PERIPHID_MASK)

#define MTB_COMPID_COMPID_MASK 0xFFFFFFFFu
#define MTB_COMPID_COMPID_SHIFT 0
#define MTB_COMPID_COMPID_WIDTH 32
#define MTB_COMPID_COMPID(x) (((uint32_t)(((uint32_t)(x))<<MTB_COMPID_COMPID_SHIFT))&MTB_COMPID_COMPID_MASK)
# 3103 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define MTB_BASE (0xF0000000u)

#define MTB ((MTB_Type *)MTB_BASE)
#define MTB_BASE_PTR (MTB)

#define MTB_BASE_ADDRS { MTB_BASE }

#define MTB_BASE_PTRS { MTB }
# 3124 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define MTB_POSITION MTB_POSITION_REG(MTB)
#define MTB_MASTER MTB_MASTER_REG(MTB)
#define MTB_FLOW MTB_FLOW_REG(MTB)
#define MTB_BASEr MTB_BASE_REG(MTB)
#define MTB_MODECTRL MTB_MODECTRL_REG(MTB)
#define MTB_TAGSET MTB_TAGSET_REG(MTB)
#define MTB_TAGCLEAR MTB_TAGCLEAR_REG(MTB)
#define MTB_LOCKACCESS MTB_LOCKACCESS_REG(MTB)
#define MTB_LOCKSTAT MTB_LOCKSTAT_REG(MTB)
#define MTB_AUTHSTAT MTB_AUTHSTAT_REG(MTB)
#define MTB_DEVICEARCH MTB_DEVICEARCH_REG(MTB)
#define MTB_DEVICECFG MTB_DEVICECFG_REG(MTB)
#define MTB_DEVICETYPID MTB_DEVICETYPID_REG(MTB)
#define MTB_PERIPHID4 MTB_PERIPHID_REG(MTB,0)
#define MTB_PERIPHID5 MTB_PERIPHID_REG(MTB,1)
#define MTB_PERIPHID6 MTB_PERIPHID_REG(MTB,2)
#define MTB_PERIPHID7 MTB_PERIPHID_REG(MTB,3)
#define MTB_PERIPHID0 MTB_PERIPHID_REG(MTB,4)
#define MTB_PERIPHID1 MTB_PERIPHID_REG(MTB,5)
#define MTB_PERIPHID2 MTB_PERIPHID_REG(MTB,6)
#define MTB_PERIPHID3 MTB_PERIPHID_REG(MTB,7)
#define MTB_COMPID0 MTB_COMPID_REG(MTB,0)
#define MTB_COMPID1 MTB_COMPID_REG(MTB,1)
#define MTB_COMPID2 MTB_COMPID_REG(MTB,2)
#define MTB_COMPID3 MTB_COMPID_REG(MTB,3)


#define MTB_PERIPHID(index) MTB_PERIPHID_REG(MTB,index)
#define MTB_COMPID(index) MTB_COMPID_REG(MTB,index)
# 3174 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile const uint32_t CTRL;
       uint8_t RESERVED_0[28];
  struct {
    volatile uint32_t COMP;
    volatile uint32_t MASK;
    volatile uint32_t FCT;
         uint8_t RESERVED_0[4];
  } COMPARATOR[2];
       uint8_t RESERVED_1[448];
  volatile uint32_t TBCTRL;
       uint8_t RESERVED_2[3524];
  volatile const uint32_t DEVICECFG;
  volatile const uint32_t DEVICETYPID;
  volatile const uint32_t PERIPHID[8];
  volatile const uint32_t COMPID[4];
} MTBDWT_Type, *MTBDWT_MemMapPtr;
# 3203 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define MTBDWT_CTRL_REG(base) ((base)->CTRL)
#define MTBDWT_COMP_REG(base,index) ((base)->COMPARATOR[index].COMP)
#define MTBDWT_COMP_COUNT 2
#define MTBDWT_MASK_REG(base,index) ((base)->COMPARATOR[index].MASK)
#define MTBDWT_MASK_COUNT 2
#define MTBDWT_FCT_REG(base,index) ((base)->COMPARATOR[index].FCT)
#define MTBDWT_FCT_COUNT 2
#define MTBDWT_TBCTRL_REG(base) ((base)->TBCTRL)
#define MTBDWT_DEVICECFG_REG(base) ((base)->DEVICECFG)
#define MTBDWT_DEVICETYPID_REG(base) ((base)->DEVICETYPID)
#define MTBDWT_PERIPHID_REG(base,index) ((base)->PERIPHID[index])
#define MTBDWT_PERIPHID_COUNT 8
#define MTBDWT_COMPID_REG(base,index) ((base)->COMPID[index])
#define MTBDWT_COMPID_COUNT 4
# 3233 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define MTBDWT_CTRL_DWTCFGCTRL_MASK 0xFFFFFFFu
#define MTBDWT_CTRL_DWTCFGCTRL_SHIFT 0
#define MTBDWT_CTRL_DWTCFGCTRL_WIDTH 28
#define MTBDWT_CTRL_DWTCFGCTRL(x) (((uint32_t)(((uint32_t)(x))<<MTBDWT_CTRL_DWTCFGCTRL_SHIFT))&MTBDWT_CTRL_DWTCFGCTRL_MASK)
#define MTBDWT_CTRL_NUMCMP_MASK 0xF0000000u
#define MTBDWT_CTRL_NUMCMP_SHIFT 28
#define MTBDWT_CTRL_NUMCMP_WIDTH 4
#define MTBDWT_CTRL_NUMCMP(x) (((uint32_t)(((uint32_t)(x))<<MTBDWT_CTRL_NUMCMP_SHIFT))&MTBDWT_CTRL_NUMCMP_MASK)

#define MTBDWT_COMP_COMP_MASK 0xFFFFFFFFu
#define MTBDWT_COMP_COMP_SHIFT 0
#define MTBDWT_COMP_COMP_WIDTH 32
#define MTBDWT_COMP_COMP(x) (((uint32_t)(((uint32_t)(x))<<MTBDWT_COMP_COMP_SHIFT))&MTBDWT_COMP_COMP_MASK)

#define MTBDWT_MASK_MASK_MASK 0x1Fu
#define MTBDWT_MASK_MASK_SHIFT 0
#define MTBDWT_MASK_MASK_WIDTH 5
#define MTBDWT_MASK_MASK(x) (((uint32_t)(((uint32_t)(x))<<MTBDWT_MASK_MASK_SHIFT))&MTBDWT_MASK_MASK_MASK)

#define MTBDWT_FCT_FUNCTION_MASK 0xFu
#define MTBDWT_FCT_FUNCTION_SHIFT 0
#define MTBDWT_FCT_FUNCTION_WIDTH 4
#define MTBDWT_FCT_FUNCTION(x) (((uint32_t)(((uint32_t)(x))<<MTBDWT_FCT_FUNCTION_SHIFT))&MTBDWT_FCT_FUNCTION_MASK)
#define MTBDWT_FCT_DATAVMATCH_MASK 0x100u
#define MTBDWT_FCT_DATAVMATCH_SHIFT 8
#define MTBDWT_FCT_DATAVMATCH_WIDTH 1
#define MTBDWT_FCT_DATAVMATCH(x) (((uint32_t)(((uint32_t)(x))<<MTBDWT_FCT_DATAVMATCH_SHIFT))&MTBDWT_FCT_DATAVMATCH_MASK)
#define MTBDWT_FCT_DATAVSIZE_MASK 0xC00u
#define MTBDWT_FCT_DATAVSIZE_SHIFT 10
#define MTBDWT_FCT_DATAVSIZE_WIDTH 2
#define MTBDWT_FCT_DATAVSIZE(x) (((uint32_t)(((uint32_t)(x))<<MTBDWT_FCT_DATAVSIZE_SHIFT))&MTBDWT_FCT_DATAVSIZE_MASK)
#define MTBDWT_FCT_DATAVADDR0_MASK 0xF000u
#define MTBDWT_FCT_DATAVADDR0_SHIFT 12
#define MTBDWT_FCT_DATAVADDR0_WIDTH 4
#define MTBDWT_FCT_DATAVADDR0(x) (((uint32_t)(((uint32_t)(x))<<MTBDWT_FCT_DATAVADDR0_SHIFT))&MTBDWT_FCT_DATAVADDR0_MASK)
#define MTBDWT_FCT_MATCHED_MASK 0x1000000u
#define MTBDWT_FCT_MATCHED_SHIFT 24
#define MTBDWT_FCT_MATCHED_WIDTH 1
#define MTBDWT_FCT_MATCHED(x) (((uint32_t)(((uint32_t)(x))<<MTBDWT_FCT_MATCHED_SHIFT))&MTBDWT_FCT_MATCHED_MASK)

#define MTBDWT_TBCTRL_ACOMP0_MASK 0x1u
#define MTBDWT_TBCTRL_ACOMP0_SHIFT 0
#define MTBDWT_TBCTRL_ACOMP0_WIDTH 1
#define MTBDWT_TBCTRL_ACOMP0(x) (((uint32_t)(((uint32_t)(x))<<MTBDWT_TBCTRL_ACOMP0_SHIFT))&MTBDWT_TBCTRL_ACOMP0_MASK)
#define MTBDWT_TBCTRL_ACOMP1_MASK 0x2u
#define MTBDWT_TBCTRL_ACOMP1_SHIFT 1
#define MTBDWT_TBCTRL_ACOMP1_WIDTH 1
#define MTBDWT_TBCTRL_ACOMP1(x) (((uint32_t)(((uint32_t)(x))<<MTBDWT_TBCTRL_ACOMP1_SHIFT))&MTBDWT_TBCTRL_ACOMP1_MASK)
#define MTBDWT_TBCTRL_NUMCOMP_MASK 0xF0000000u
#define MTBDWT_TBCTRL_NUMCOMP_SHIFT 28
#define MTBDWT_TBCTRL_NUMCOMP_WIDTH 4
#define MTBDWT_TBCTRL_NUMCOMP(x) (((uint32_t)(((uint32_t)(x))<<MTBDWT_TBCTRL_NUMCOMP_SHIFT))&MTBDWT_TBCTRL_NUMCOMP_MASK)

#define MTBDWT_DEVICECFG_DEVICECFG_MASK 0xFFFFFFFFu
#define MTBDWT_DEVICECFG_DEVICECFG_SHIFT 0
#define MTBDWT_DEVICECFG_DEVICECFG_WIDTH 32
#define MTBDWT_DEVICECFG_DEVICECFG(x) (((uint32_t)(((uint32_t)(x))<<MTBDWT_DEVICECFG_DEVICECFG_SHIFT))&MTBDWT_DEVICECFG_DEVICECFG_MASK)

#define MTBDWT_DEVICETYPID_DEVICETYPID_MASK 0xFFFFFFFFu
#define MTBDWT_DEVICETYPID_DEVICETYPID_SHIFT 0
#define MTBDWT_DEVICETYPID_DEVICETYPID_WIDTH 32
#define MTBDWT_DEVICETYPID_DEVICETYPID(x) (((uint32_t)(((uint32_t)(x))<<MTBDWT_DEVICETYPID_DEVICETYPID_SHIFT))&MTBDWT_DEVICETYPID_DEVICETYPID_MASK)

#define MTBDWT_PERIPHID_PERIPHID_MASK 0xFFFFFFFFu
#define MTBDWT_PERIPHID_PERIPHID_SHIFT 0
#define MTBDWT_PERIPHID_PERIPHID_WIDTH 32
#define MTBDWT_PERIPHID_PERIPHID(x) (((uint32_t)(((uint32_t)(x))<<MTBDWT_PERIPHID_PERIPHID_SHIFT))&MTBDWT_PERIPHID_PERIPHID_MASK)

#define MTBDWT_COMPID_COMPID_MASK 0xFFFFFFFFu
#define MTBDWT_COMPID_COMPID_SHIFT 0
#define MTBDWT_COMPID_COMPID_WIDTH 32
#define MTBDWT_COMPID_COMPID(x) (((uint32_t)(((uint32_t)(x))<<MTBDWT_COMPID_COMPID_SHIFT))&MTBDWT_COMPID_COMPID_MASK)
# 3313 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define MTBDWT_BASE (0xF0001000u)

#define MTBDWT ((MTBDWT_Type *)MTBDWT_BASE)
#define MTBDWT_BASE_PTR (MTBDWT)

#define MTBDWT_BASE_ADDRS { MTBDWT_BASE }

#define MTBDWT_BASE_PTRS { MTBDWT }
# 3334 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define MTBDWT_CTRL MTBDWT_CTRL_REG(MTBDWT)
#define MTBDWT_COMP0 MTBDWT_COMP_REG(MTBDWT,0)
#define MTBDWT_MASK0 MTBDWT_MASK_REG(MTBDWT,0)
#define MTBDWT_FCT0 MTBDWT_FCT_REG(MTBDWT,0)
#define MTBDWT_COMP1 MTBDWT_COMP_REG(MTBDWT,1)
#define MTBDWT_MASK1 MTBDWT_MASK_REG(MTBDWT,1)
#define MTBDWT_FCT1 MTBDWT_FCT_REG(MTBDWT,1)
#define MTBDWT_TBCTRL MTBDWT_TBCTRL_REG(MTBDWT)
#define MTBDWT_DEVICECFG MTBDWT_DEVICECFG_REG(MTBDWT)
#define MTBDWT_DEVICETYPID MTBDWT_DEVICETYPID_REG(MTBDWT)
#define MTBDWT_PERIPHID4 MTBDWT_PERIPHID_REG(MTBDWT,0)
#define MTBDWT_PERIPHID5 MTBDWT_PERIPHID_REG(MTBDWT,1)
#define MTBDWT_PERIPHID6 MTBDWT_PERIPHID_REG(MTBDWT,2)
#define MTBDWT_PERIPHID7 MTBDWT_PERIPHID_REG(MTBDWT,3)
#define MTBDWT_PERIPHID0 MTBDWT_PERIPHID_REG(MTBDWT,4)
#define MTBDWT_PERIPHID1 MTBDWT_PERIPHID_REG(MTBDWT,5)
#define MTBDWT_PERIPHID2 MTBDWT_PERIPHID_REG(MTBDWT,6)
#define MTBDWT_PERIPHID3 MTBDWT_PERIPHID_REG(MTBDWT,7)
#define MTBDWT_COMPID0 MTBDWT_COMPID_REG(MTBDWT,0)
#define MTBDWT_COMPID1 MTBDWT_COMPID_REG(MTBDWT,1)
#define MTBDWT_COMPID2 MTBDWT_COMPID_REG(MTBDWT,2)
#define MTBDWT_COMPID3 MTBDWT_COMPID_REG(MTBDWT,3)


#define MTBDWT_COMP(index) MTBDWT_COMP_REG(MTBDWT,index)
#define MTBDWT_MASK(index) MTBDWT_MASK_REG(MTBDWT,index)
#define MTBDWT_FCT(index) MTBDWT_FCT_REG(MTBDWT,index)
#define MTBDWT_PERIPHID(index) MTBDWT_PERIPHID_REG(MTBDWT,index)
#define MTBDWT_COMPID(index) MTBDWT_COMPID_REG(MTBDWT,index)
# 3384 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile const uint8_t BACKKEY3;
  volatile const uint8_t BACKKEY2;
  volatile const uint8_t BACKKEY1;
  volatile const uint8_t BACKKEY0;
  volatile const uint8_t BACKKEY7;
  volatile const uint8_t BACKKEY6;
  volatile const uint8_t BACKKEY5;
  volatile const uint8_t BACKKEY4;
  volatile const uint8_t FPROT3;
  volatile const uint8_t FPROT2;
  volatile const uint8_t FPROT1;
  volatile const uint8_t FPROT0;
  volatile const uint8_t FSEC;
  volatile const uint8_t FOPT;
} NV_Type, *NV_MemMapPtr;
# 3412 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define NV_BACKKEY3_REG(base) ((base)->BACKKEY3)
#define NV_BACKKEY2_REG(base) ((base)->BACKKEY2)
#define NV_BACKKEY1_REG(base) ((base)->BACKKEY1)
#define NV_BACKKEY0_REG(base) ((base)->BACKKEY0)
#define NV_BACKKEY7_REG(base) ((base)->BACKKEY7)
#define NV_BACKKEY6_REG(base) ((base)->BACKKEY6)
#define NV_BACKKEY5_REG(base) ((base)->BACKKEY5)
#define NV_BACKKEY4_REG(base) ((base)->BACKKEY4)
#define NV_FPROT3_REG(base) ((base)->FPROT3)
#define NV_FPROT2_REG(base) ((base)->FPROT2)
#define NV_FPROT1_REG(base) ((base)->FPROT1)
#define NV_FPROT0_REG(base) ((base)->FPROT0)
#define NV_FSEC_REG(base) ((base)->FSEC)
#define NV_FOPT_REG(base) ((base)->FOPT)
# 3442 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define NV_BACKKEY3_KEY_MASK 0xFFu
#define NV_BACKKEY3_KEY_SHIFT 0
#define NV_BACKKEY3_KEY_WIDTH 8
#define NV_BACKKEY3_KEY(x) (((uint8_t)(((uint8_t)(x))<<NV_BACKKEY3_KEY_SHIFT))&NV_BACKKEY3_KEY_MASK)

#define NV_BACKKEY2_KEY_MASK 0xFFu
#define NV_BACKKEY2_KEY_SHIFT 0
#define NV_BACKKEY2_KEY_WIDTH 8
#define NV_BACKKEY2_KEY(x) (((uint8_t)(((uint8_t)(x))<<NV_BACKKEY2_KEY_SHIFT))&NV_BACKKEY2_KEY_MASK)

#define NV_BACKKEY1_KEY_MASK 0xFFu
#define NV_BACKKEY1_KEY_SHIFT 0
#define NV_BACKKEY1_KEY_WIDTH 8
#define NV_BACKKEY1_KEY(x) (((uint8_t)(((uint8_t)(x))<<NV_BACKKEY1_KEY_SHIFT))&NV_BACKKEY1_KEY_MASK)

#define NV_BACKKEY0_KEY_MASK 0xFFu
#define NV_BACKKEY0_KEY_SHIFT 0
#define NV_BACKKEY0_KEY_WIDTH 8
#define NV_BACKKEY0_KEY(x) (((uint8_t)(((uint8_t)(x))<<NV_BACKKEY0_KEY_SHIFT))&NV_BACKKEY0_KEY_MASK)

#define NV_BACKKEY7_KEY_MASK 0xFFu
#define NV_BACKKEY7_KEY_SHIFT 0
#define NV_BACKKEY7_KEY_WIDTH 8
#define NV_BACKKEY7_KEY(x) (((uint8_t)(((uint8_t)(x))<<NV_BACKKEY7_KEY_SHIFT))&NV_BACKKEY7_KEY_MASK)

#define NV_BACKKEY6_KEY_MASK 0xFFu
#define NV_BACKKEY6_KEY_SHIFT 0
#define NV_BACKKEY6_KEY_WIDTH 8
#define NV_BACKKEY6_KEY(x) (((uint8_t)(((uint8_t)(x))<<NV_BACKKEY6_KEY_SHIFT))&NV_BACKKEY6_KEY_MASK)

#define NV_BACKKEY5_KEY_MASK 0xFFu
#define NV_BACKKEY5_KEY_SHIFT 0
#define NV_BACKKEY5_KEY_WIDTH 8
#define NV_BACKKEY5_KEY(x) (((uint8_t)(((uint8_t)(x))<<NV_BACKKEY5_KEY_SHIFT))&NV_BACKKEY5_KEY_MASK)

#define NV_BACKKEY4_KEY_MASK 0xFFu
#define NV_BACKKEY4_KEY_SHIFT 0
#define NV_BACKKEY4_KEY_WIDTH 8
#define NV_BACKKEY4_KEY(x) (((uint8_t)(((uint8_t)(x))<<NV_BACKKEY4_KEY_SHIFT))&NV_BACKKEY4_KEY_MASK)

#define NV_FPROT3_PROT_MASK 0xFFu
#define NV_FPROT3_PROT_SHIFT 0
#define NV_FPROT3_PROT_WIDTH 8
#define NV_FPROT3_PROT(x) (((uint8_t)(((uint8_t)(x))<<NV_FPROT3_PROT_SHIFT))&NV_FPROT3_PROT_MASK)

#define NV_FPROT2_PROT_MASK 0xFFu
#define NV_FPROT2_PROT_SHIFT 0
#define NV_FPROT2_PROT_WIDTH 8
#define NV_FPROT2_PROT(x) (((uint8_t)(((uint8_t)(x))<<NV_FPROT2_PROT_SHIFT))&NV_FPROT2_PROT_MASK)

#define NV_FPROT1_PROT_MASK 0xFFu
#define NV_FPROT1_PROT_SHIFT 0
#define NV_FPROT1_PROT_WIDTH 8
#define NV_FPROT1_PROT(x) (((uint8_t)(((uint8_t)(x))<<NV_FPROT1_PROT_SHIFT))&NV_FPROT1_PROT_MASK)

#define NV_FPROT0_PROT_MASK 0xFFu
#define NV_FPROT0_PROT_SHIFT 0
#define NV_FPROT0_PROT_WIDTH 8
#define NV_FPROT0_PROT(x) (((uint8_t)(((uint8_t)(x))<<NV_FPROT0_PROT_SHIFT))&NV_FPROT0_PROT_MASK)

#define NV_FSEC_SEC_MASK 0x3u
#define NV_FSEC_SEC_SHIFT 0
#define NV_FSEC_SEC_WIDTH 2
#define NV_FSEC_SEC(x) (((uint8_t)(((uint8_t)(x))<<NV_FSEC_SEC_SHIFT))&NV_FSEC_SEC_MASK)
#define NV_FSEC_FSLACC_MASK 0xCu
#define NV_FSEC_FSLACC_SHIFT 2
#define NV_FSEC_FSLACC_WIDTH 2
#define NV_FSEC_FSLACC(x) (((uint8_t)(((uint8_t)(x))<<NV_FSEC_FSLACC_SHIFT))&NV_FSEC_FSLACC_MASK)
#define NV_FSEC_MEEN_MASK 0x30u
#define NV_FSEC_MEEN_SHIFT 4
#define NV_FSEC_MEEN_WIDTH 2
#define NV_FSEC_MEEN(x) (((uint8_t)(((uint8_t)(x))<<NV_FSEC_MEEN_SHIFT))&NV_FSEC_MEEN_MASK)
#define NV_FSEC_KEYEN_MASK 0xC0u
#define NV_FSEC_KEYEN_SHIFT 6
#define NV_FSEC_KEYEN_WIDTH 2
#define NV_FSEC_KEYEN(x) (((uint8_t)(((uint8_t)(x))<<NV_FSEC_KEYEN_SHIFT))&NV_FSEC_KEYEN_MASK)

#define NV_FOPT_LPBOOT0_MASK 0x1u
#define NV_FOPT_LPBOOT0_SHIFT 0
#define NV_FOPT_LPBOOT0_WIDTH 1
#define NV_FOPT_LPBOOT0(x) (((uint8_t)(((uint8_t)(x))<<NV_FOPT_LPBOOT0_SHIFT))&NV_FOPT_LPBOOT0_MASK)
#define NV_FOPT_NMI_DIS_MASK 0x4u
#define NV_FOPT_NMI_DIS_SHIFT 2
#define NV_FOPT_NMI_DIS_WIDTH 1
#define NV_FOPT_NMI_DIS(x) (((uint8_t)(((uint8_t)(x))<<NV_FOPT_NMI_DIS_SHIFT))&NV_FOPT_NMI_DIS_MASK)
#define NV_FOPT_RESET_PIN_CFG_MASK 0x8u
#define NV_FOPT_RESET_PIN_CFG_SHIFT 3
#define NV_FOPT_RESET_PIN_CFG_WIDTH 1
#define NV_FOPT_RESET_PIN_CFG(x) (((uint8_t)(((uint8_t)(x))<<NV_FOPT_RESET_PIN_CFG_SHIFT))&NV_FOPT_RESET_PIN_CFG_MASK)
#define NV_FOPT_LPBOOT1_MASK 0x10u
#define NV_FOPT_LPBOOT1_SHIFT 4
#define NV_FOPT_LPBOOT1_WIDTH 1
#define NV_FOPT_LPBOOT1(x) (((uint8_t)(((uint8_t)(x))<<NV_FOPT_LPBOOT1_SHIFT))&NV_FOPT_LPBOOT1_MASK)
#define NV_FOPT_FAST_INIT_MASK 0x20u
#define NV_FOPT_FAST_INIT_SHIFT 5
#define NV_FOPT_FAST_INIT_WIDTH 1
#define NV_FOPT_FAST_INIT(x) (((uint8_t)(((uint8_t)(x))<<NV_FOPT_FAST_INIT_SHIFT))&NV_FOPT_FAST_INIT_MASK)
# 3547 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define FTFA_FlashConfig_BASE (0x400u)

#define FTFA_FlashConfig ((NV_Type *)FTFA_FlashConfig_BASE)
#define FTFA_FlashConfig_BASE_PTR (FTFA_FlashConfig)

#define NV_BASE_ADDRS { FTFA_FlashConfig_BASE }

#define NV_BASE_PTRS { FTFA_FlashConfig }
# 3568 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define NV_BACKKEY3 NV_BACKKEY3_REG(FTFA_FlashConfig)
#define NV_BACKKEY2 NV_BACKKEY2_REG(FTFA_FlashConfig)
#define NV_BACKKEY1 NV_BACKKEY1_REG(FTFA_FlashConfig)
#define NV_BACKKEY0 NV_BACKKEY0_REG(FTFA_FlashConfig)
#define NV_BACKKEY7 NV_BACKKEY7_REG(FTFA_FlashConfig)
#define NV_BACKKEY6 NV_BACKKEY6_REG(FTFA_FlashConfig)
#define NV_BACKKEY5 NV_BACKKEY5_REG(FTFA_FlashConfig)
#define NV_BACKKEY4 NV_BACKKEY4_REG(FTFA_FlashConfig)
#define NV_FPROT3 NV_FPROT3_REG(FTFA_FlashConfig)
#define NV_FPROT2 NV_FPROT2_REG(FTFA_FlashConfig)
#define NV_FPROT1 NV_FPROT1_REG(FTFA_FlashConfig)
#define NV_FPROT0 NV_FPROT0_REG(FTFA_FlashConfig)
#define NV_FSEC NV_FSEC_REG(FTFA_FlashConfig)
#define NV_FOPT NV_FOPT_REG(FTFA_FlashConfig)
# 3603 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint8_t CR;
} OSC_Type, *OSC_MemMapPtr;
# 3618 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define OSC_CR_REG(base) ((base)->CR)
# 3635 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define OSC_CR_SC16P_MASK 0x1u
#define OSC_CR_SC16P_SHIFT 0
#define OSC_CR_SC16P_WIDTH 1
#define OSC_CR_SC16P(x) (((uint8_t)(((uint8_t)(x))<<OSC_CR_SC16P_SHIFT))&OSC_CR_SC16P_MASK)
#define OSC_CR_SC8P_MASK 0x2u
#define OSC_CR_SC8P_SHIFT 1
#define OSC_CR_SC8P_WIDTH 1
#define OSC_CR_SC8P(x) (((uint8_t)(((uint8_t)(x))<<OSC_CR_SC8P_SHIFT))&OSC_CR_SC8P_MASK)
#define OSC_CR_SC4P_MASK 0x4u
#define OSC_CR_SC4P_SHIFT 2
#define OSC_CR_SC4P_WIDTH 1
#define OSC_CR_SC4P(x) (((uint8_t)(((uint8_t)(x))<<OSC_CR_SC4P_SHIFT))&OSC_CR_SC4P_MASK)
#define OSC_CR_SC2P_MASK 0x8u
#define OSC_CR_SC2P_SHIFT 3
#define OSC_CR_SC2P_WIDTH 1
#define OSC_CR_SC2P(x) (((uint8_t)(((uint8_t)(x))<<OSC_CR_SC2P_SHIFT))&OSC_CR_SC2P_MASK)
#define OSC_CR_EREFSTEN_MASK 0x20u
#define OSC_CR_EREFSTEN_SHIFT 5
#define OSC_CR_EREFSTEN_WIDTH 1
#define OSC_CR_EREFSTEN(x) (((uint8_t)(((uint8_t)(x))<<OSC_CR_EREFSTEN_SHIFT))&OSC_CR_EREFSTEN_MASK)
#define OSC_CR_ERCLKEN_MASK 0x80u
#define OSC_CR_ERCLKEN_SHIFT 7
#define OSC_CR_ERCLKEN_WIDTH 1
#define OSC_CR_ERCLKEN(x) (((uint8_t)(((uint8_t)(x))<<OSC_CR_ERCLKEN_SHIFT))&OSC_CR_ERCLKEN_MASK)
# 3667 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define OSC0_BASE (0x40065000u)

#define OSC0 ((OSC_Type *)OSC0_BASE)
#define OSC0_BASE_PTR (OSC0)

#define OSC_BASE_ADDRS { OSC0_BASE }

#define OSC_BASE_PTRS { OSC0 }
# 3688 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define OSC0_CR OSC_CR_REG(OSC0)
# 3710 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint32_t MCR;
       uint8_t RESERVED_0[220];
  volatile const uint32_t LTMR64H;
  volatile const uint32_t LTMR64L;
       uint8_t RESERVED_1[24];
  struct {
    volatile uint32_t LDVAL;
    volatile const uint32_t CVAL;
    volatile uint32_t TCTRL;
    volatile uint32_t TFLG;
  } CHANNEL[2];
} PIT_Type, *PIT_MemMapPtr;
# 3735 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define PIT_MCR_REG(base) ((base)->MCR)
#define PIT_LTMR64H_REG(base) ((base)->LTMR64H)
#define PIT_LTMR64L_REG(base) ((base)->LTMR64L)
#define PIT_LDVAL_REG(base,index) ((base)->CHANNEL[index].LDVAL)
#define PIT_LDVAL_COUNT 2
#define PIT_CVAL_REG(base,index) ((base)->CHANNEL[index].CVAL)
#define PIT_CVAL_COUNT 2
#define PIT_TCTRL_REG(base,index) ((base)->CHANNEL[index].TCTRL)
#define PIT_TCTRL_COUNT 2
#define PIT_TFLG_REG(base,index) ((base)->CHANNEL[index].TFLG)
#define PIT_TFLG_COUNT 2
# 3762 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define PIT_MCR_FRZ_MASK 0x1u
#define PIT_MCR_FRZ_SHIFT 0
#define PIT_MCR_FRZ_WIDTH 1
#define PIT_MCR_FRZ(x) (((uint32_t)(((uint32_t)(x))<<PIT_MCR_FRZ_SHIFT))&PIT_MCR_FRZ_MASK)
#define PIT_MCR_MDIS_MASK 0x2u
#define PIT_MCR_MDIS_SHIFT 1
#define PIT_MCR_MDIS_WIDTH 1
#define PIT_MCR_MDIS(x) (((uint32_t)(((uint32_t)(x))<<PIT_MCR_MDIS_SHIFT))&PIT_MCR_MDIS_MASK)

#define PIT_LTMR64H_LTH_MASK 0xFFFFFFFFu
#define PIT_LTMR64H_LTH_SHIFT 0
#define PIT_LTMR64H_LTH_WIDTH 32
#define PIT_LTMR64H_LTH(x) (((uint32_t)(((uint32_t)(x))<<PIT_LTMR64H_LTH_SHIFT))&PIT_LTMR64H_LTH_MASK)

#define PIT_LTMR64L_LTL_MASK 0xFFFFFFFFu
#define PIT_LTMR64L_LTL_SHIFT 0
#define PIT_LTMR64L_LTL_WIDTH 32
#define PIT_LTMR64L_LTL(x) (((uint32_t)(((uint32_t)(x))<<PIT_LTMR64L_LTL_SHIFT))&PIT_LTMR64L_LTL_MASK)

#define PIT_LDVAL_TSV_MASK 0xFFFFFFFFu
#define PIT_LDVAL_TSV_SHIFT 0
#define PIT_LDVAL_TSV_WIDTH 32
#define PIT_LDVAL_TSV(x) (((uint32_t)(((uint32_t)(x))<<PIT_LDVAL_TSV_SHIFT))&PIT_LDVAL_TSV_MASK)

#define PIT_CVAL_TVL_MASK 0xFFFFFFFFu
#define PIT_CVAL_TVL_SHIFT 0
#define PIT_CVAL_TVL_WIDTH 32
#define PIT_CVAL_TVL(x) (((uint32_t)(((uint32_t)(x))<<PIT_CVAL_TVL_SHIFT))&PIT_CVAL_TVL_MASK)

#define PIT_TCTRL_TEN_MASK 0x1u
#define PIT_TCTRL_TEN_SHIFT 0
#define PIT_TCTRL_TEN_WIDTH 1
#define PIT_TCTRL_TEN(x) (((uint32_t)(((uint32_t)(x))<<PIT_TCTRL_TEN_SHIFT))&PIT_TCTRL_TEN_MASK)
#define PIT_TCTRL_TIE_MASK 0x2u
#define PIT_TCTRL_TIE_SHIFT 1
#define PIT_TCTRL_TIE_WIDTH 1
#define PIT_TCTRL_TIE(x) (((uint32_t)(((uint32_t)(x))<<PIT_TCTRL_TIE_SHIFT))&PIT_TCTRL_TIE_MASK)
#define PIT_TCTRL_CHN_MASK 0x4u
#define PIT_TCTRL_CHN_SHIFT 2
#define PIT_TCTRL_CHN_WIDTH 1
#define PIT_TCTRL_CHN(x) (((uint32_t)(((uint32_t)(x))<<PIT_TCTRL_CHN_SHIFT))&PIT_TCTRL_CHN_MASK)

#define PIT_TFLG_TIF_MASK 0x1u
#define PIT_TFLG_TIF_SHIFT 0
#define PIT_TFLG_TIF_WIDTH 1
#define PIT_TFLG_TIF(x) (((uint32_t)(((uint32_t)(x))<<PIT_TFLG_TIF_SHIFT))&PIT_TFLG_TIF_MASK)
# 3816 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define PIT_BASE (0x40037000u)

#define PIT ((PIT_Type *)PIT_BASE)
#define PIT_BASE_PTR (PIT)

#define PIT_BASE_ADDRS { PIT_BASE }

#define PIT_BASE_PTRS { PIT }
# 3837 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define PIT_MCR PIT_MCR_REG(PIT)
#define PIT_LTMR64H PIT_LTMR64H_REG(PIT)
#define PIT_LTMR64L PIT_LTMR64L_REG(PIT)
#define PIT_LDVAL0 PIT_LDVAL_REG(PIT,0)
#define PIT_CVAL0 PIT_CVAL_REG(PIT,0)
#define PIT_TCTRL0 PIT_TCTRL_REG(PIT,0)
#define PIT_TFLG0 PIT_TFLG_REG(PIT,0)
#define PIT_LDVAL1 PIT_LDVAL_REG(PIT,1)
#define PIT_CVAL1 PIT_CVAL_REG(PIT,1)
#define PIT_TCTRL1 PIT_TCTRL_REG(PIT,1)
#define PIT_TFLG1 PIT_TFLG_REG(PIT,1)


#define PIT_LDVAL(index) PIT_LDVAL_REG(PIT,index)
#define PIT_CVAL(index) PIT_CVAL_REG(PIT,index)
#define PIT_TCTRL(index) PIT_TCTRL_REG(PIT,index)
#define PIT_TFLG(index) PIT_TFLG_REG(PIT,index)
# 3875 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint8_t LVDSC1;
  volatile uint8_t LVDSC2;
  volatile uint8_t REGSC;
} PMC_Type, *PMC_MemMapPtr;
# 3892 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define PMC_LVDSC1_REG(base) ((base)->LVDSC1)
#define PMC_LVDSC2_REG(base) ((base)->LVDSC2)
#define PMC_REGSC_REG(base) ((base)->REGSC)
# 3911 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define PMC_LVDSC1_LVDV_MASK 0x3u
#define PMC_LVDSC1_LVDV_SHIFT 0
#define PMC_LVDSC1_LVDV_WIDTH 2
#define PMC_LVDSC1_LVDV(x) (((uint8_t)(((uint8_t)(x))<<PMC_LVDSC1_LVDV_SHIFT))&PMC_LVDSC1_LVDV_MASK)
#define PMC_LVDSC1_LVDRE_MASK 0x10u
#define PMC_LVDSC1_LVDRE_SHIFT 4
#define PMC_LVDSC1_LVDRE_WIDTH 1
#define PMC_LVDSC1_LVDRE(x) (((uint8_t)(((uint8_t)(x))<<PMC_LVDSC1_LVDRE_SHIFT))&PMC_LVDSC1_LVDRE_MASK)
#define PMC_LVDSC1_LVDIE_MASK 0x20u
#define PMC_LVDSC1_LVDIE_SHIFT 5
#define PMC_LVDSC1_LVDIE_WIDTH 1
#define PMC_LVDSC1_LVDIE(x) (((uint8_t)(((uint8_t)(x))<<PMC_LVDSC1_LVDIE_SHIFT))&PMC_LVDSC1_LVDIE_MASK)
#define PMC_LVDSC1_LVDACK_MASK 0x40u
#define PMC_LVDSC1_LVDACK_SHIFT 6
#define PMC_LVDSC1_LVDACK_WIDTH 1
#define PMC_LVDSC1_LVDACK(x) (((uint8_t)(((uint8_t)(x))<<PMC_LVDSC1_LVDACK_SHIFT))&PMC_LVDSC1_LVDACK_MASK)
#define PMC_LVDSC1_LVDF_MASK 0x80u
#define PMC_LVDSC1_LVDF_SHIFT 7
#define PMC_LVDSC1_LVDF_WIDTH 1
#define PMC_LVDSC1_LVDF(x) (((uint8_t)(((uint8_t)(x))<<PMC_LVDSC1_LVDF_SHIFT))&PMC_LVDSC1_LVDF_MASK)

#define PMC_LVDSC2_LVWV_MASK 0x3u
#define PMC_LVDSC2_LVWV_SHIFT 0
#define PMC_LVDSC2_LVWV_WIDTH 2
#define PMC_LVDSC2_LVWV(x) (((uint8_t)(((uint8_t)(x))<<PMC_LVDSC2_LVWV_SHIFT))&PMC_LVDSC2_LVWV_MASK)
#define PMC_LVDSC2_LVWIE_MASK 0x20u
#define PMC_LVDSC2_LVWIE_SHIFT 5
#define PMC_LVDSC2_LVWIE_WIDTH 1
#define PMC_LVDSC2_LVWIE(x) (((uint8_t)(((uint8_t)(x))<<PMC_LVDSC2_LVWIE_SHIFT))&PMC_LVDSC2_LVWIE_MASK)
#define PMC_LVDSC2_LVWACK_MASK 0x40u
#define PMC_LVDSC2_LVWACK_SHIFT 6
#define PMC_LVDSC2_LVWACK_WIDTH 1
#define PMC_LVDSC2_LVWACK(x) (((uint8_t)(((uint8_t)(x))<<PMC_LVDSC2_LVWACK_SHIFT))&PMC_LVDSC2_LVWACK_MASK)
#define PMC_LVDSC2_LVWF_MASK 0x80u
#define PMC_LVDSC2_LVWF_SHIFT 7
#define PMC_LVDSC2_LVWF_WIDTH 1
#define PMC_LVDSC2_LVWF(x) (((uint8_t)(((uint8_t)(x))<<PMC_LVDSC2_LVWF_SHIFT))&PMC_LVDSC2_LVWF_MASK)

#define PMC_REGSC_BGBE_MASK 0x1u
#define PMC_REGSC_BGBE_SHIFT 0
#define PMC_REGSC_BGBE_WIDTH 1
#define PMC_REGSC_BGBE(x) (((uint8_t)(((uint8_t)(x))<<PMC_REGSC_BGBE_SHIFT))&PMC_REGSC_BGBE_MASK)
#define PMC_REGSC_REGONS_MASK 0x4u
#define PMC_REGSC_REGONS_SHIFT 2
#define PMC_REGSC_REGONS_WIDTH 1
#define PMC_REGSC_REGONS(x) (((uint8_t)(((uint8_t)(x))<<PMC_REGSC_REGONS_SHIFT))&PMC_REGSC_REGONS_MASK)
#define PMC_REGSC_ACKISO_MASK 0x8u
#define PMC_REGSC_ACKISO_SHIFT 3
#define PMC_REGSC_ACKISO_WIDTH 1
#define PMC_REGSC_ACKISO(x) (((uint8_t)(((uint8_t)(x))<<PMC_REGSC_ACKISO_SHIFT))&PMC_REGSC_ACKISO_MASK)
#define PMC_REGSC_BGEN_MASK 0x10u
#define PMC_REGSC_BGEN_SHIFT 4
#define PMC_REGSC_BGEN_WIDTH 1
#define PMC_REGSC_BGEN(x) (((uint8_t)(((uint8_t)(x))<<PMC_REGSC_BGEN_SHIFT))&PMC_REGSC_BGEN_MASK)
# 3973 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define PMC_BASE (0x4007D000u)

#define PMC ((PMC_Type *)PMC_BASE)
#define PMC_BASE_PTR (PMC)

#define PMC_BASE_ADDRS { PMC_BASE }

#define PMC_BASE_PTRS { PMC }
# 3994 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define PMC_LVDSC1 PMC_LVDSC1_REG(PMC)
#define PMC_LVDSC2 PMC_LVDSC2_REG(PMC)
#define PMC_REGSC PMC_REGSC_REG(PMC)
# 4018 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint32_t PCR[32];
  volatile uint32_t GPCLR;
  volatile uint32_t GPCHR;
       uint8_t RESERVED_0[24];
  volatile uint32_t ISFR;
} PORT_Type, *PORT_MemMapPtr;
# 4037 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define PORT_PCR_REG(base,index) ((base)->PCR[index])
#define PORT_PCR_COUNT 32
#define PORT_GPCLR_REG(base) ((base)->GPCLR)
#define PORT_GPCHR_REG(base) ((base)->GPCHR)
#define PORT_ISFR_REG(base) ((base)->ISFR)
# 4058 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define PORT_PCR_PS_MASK 0x1u
#define PORT_PCR_PS_SHIFT 0
#define PORT_PCR_PS_WIDTH 1
#define PORT_PCR_PS(x) (((uint32_t)(((uint32_t)(x))<<PORT_PCR_PS_SHIFT))&PORT_PCR_PS_MASK)
#define PORT_PCR_PE_MASK 0x2u
#define PORT_PCR_PE_SHIFT 1
#define PORT_PCR_PE_WIDTH 1
#define PORT_PCR_PE(x) (((uint32_t)(((uint32_t)(x))<<PORT_PCR_PE_SHIFT))&PORT_PCR_PE_MASK)
#define PORT_PCR_SRE_MASK 0x4u
#define PORT_PCR_SRE_SHIFT 2
#define PORT_PCR_SRE_WIDTH 1
#define PORT_PCR_SRE(x) (((uint32_t)(((uint32_t)(x))<<PORT_PCR_SRE_SHIFT))&PORT_PCR_SRE_MASK)
#define PORT_PCR_PFE_MASK 0x10u
#define PORT_PCR_PFE_SHIFT 4
#define PORT_PCR_PFE_WIDTH 1
#define PORT_PCR_PFE(x) (((uint32_t)(((uint32_t)(x))<<PORT_PCR_PFE_SHIFT))&PORT_PCR_PFE_MASK)
#define PORT_PCR_DSE_MASK 0x40u
#define PORT_PCR_DSE_SHIFT 6
#define PORT_PCR_DSE_WIDTH 1
#define PORT_PCR_DSE(x) (((uint32_t)(((uint32_t)(x))<<PORT_PCR_DSE_SHIFT))&PORT_PCR_DSE_MASK)
#define PORT_PCR_MUX_MASK 0x700u
#define PORT_PCR_MUX_SHIFT 8
#define PORT_PCR_MUX_WIDTH 3
#define PORT_PCR_MUX(x) (((uint32_t)(((uint32_t)(x))<<PORT_PCR_MUX_SHIFT))&PORT_PCR_MUX_MASK)
#define PORT_PCR_IRQC_MASK 0xF0000u
#define PORT_PCR_IRQC_SHIFT 16
#define PORT_PCR_IRQC_WIDTH 4
#define PORT_PCR_IRQC(x) (((uint32_t)(((uint32_t)(x))<<PORT_PCR_IRQC_SHIFT))&PORT_PCR_IRQC_MASK)
#define PORT_PCR_ISF_MASK 0x1000000u
#define PORT_PCR_ISF_SHIFT 24
#define PORT_PCR_ISF_WIDTH 1
#define PORT_PCR_ISF(x) (((uint32_t)(((uint32_t)(x))<<PORT_PCR_ISF_SHIFT))&PORT_PCR_ISF_MASK)

#define PORT_GPCLR_GPWD_MASK 0xFFFFu
#define PORT_GPCLR_GPWD_SHIFT 0
#define PORT_GPCLR_GPWD_WIDTH 16
#define PORT_GPCLR_GPWD(x) (((uint32_t)(((uint32_t)(x))<<PORT_GPCLR_GPWD_SHIFT))&PORT_GPCLR_GPWD_MASK)
#define PORT_GPCLR_GPWE_MASK 0xFFFF0000u
#define PORT_GPCLR_GPWE_SHIFT 16
#define PORT_GPCLR_GPWE_WIDTH 16
#define PORT_GPCLR_GPWE(x) (((uint32_t)(((uint32_t)(x))<<PORT_GPCLR_GPWE_SHIFT))&PORT_GPCLR_GPWE_MASK)

#define PORT_GPCHR_GPWD_MASK 0xFFFFu
#define PORT_GPCHR_GPWD_SHIFT 0
#define PORT_GPCHR_GPWD_WIDTH 16
#define PORT_GPCHR_GPWD(x) (((uint32_t)(((uint32_t)(x))<<PORT_GPCHR_GPWD_SHIFT))&PORT_GPCHR_GPWD_MASK)
#define PORT_GPCHR_GPWE_MASK 0xFFFF0000u
#define PORT_GPCHR_GPWE_SHIFT 16
#define PORT_GPCHR_GPWE_WIDTH 16
#define PORT_GPCHR_GPWE(x) (((uint32_t)(((uint32_t)(x))<<PORT_GPCHR_GPWE_SHIFT))&PORT_GPCHR_GPWE_MASK)

#define PORT_ISFR_ISF_MASK 0xFFFFFFFFu
#define PORT_ISFR_ISF_SHIFT 0
#define PORT_ISFR_ISF_WIDTH 32
#define PORT_ISFR_ISF(x) (((uint32_t)(((uint32_t)(x))<<PORT_ISFR_ISF_SHIFT))&PORT_ISFR_ISF_MASK)
# 4121 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define PORTA_BASE (0x40049000u)

#define PORTA ((PORT_Type *)PORTA_BASE)
#define PORTA_BASE_PTR (PORTA)

#define PORTB_BASE (0x4004A000u)

#define PORTB ((PORT_Type *)PORTB_BASE)
#define PORTB_BASE_PTR (PORTB)

#define PORT_BASE_ADDRS { PORTA_BASE, PORTB_BASE }

#define PORT_BASE_PTRS { PORTA, PORTB }
# 4147 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define PORTA_PCR0 PORT_PCR_REG(PORTA,0)
#define PORTA_PCR1 PORT_PCR_REG(PORTA,1)
#define PORTA_PCR2 PORT_PCR_REG(PORTA,2)
#define PORTA_PCR3 PORT_PCR_REG(PORTA,3)
#define PORTA_PCR4 PORT_PCR_REG(PORTA,4)
#define PORTA_PCR5 PORT_PCR_REG(PORTA,5)
#define PORTA_PCR6 PORT_PCR_REG(PORTA,6)
#define PORTA_PCR7 PORT_PCR_REG(PORTA,7)
#define PORTA_PCR8 PORT_PCR_REG(PORTA,8)
#define PORTA_PCR9 PORT_PCR_REG(PORTA,9)
#define PORTA_PCR10 PORT_PCR_REG(PORTA,10)
#define PORTA_PCR11 PORT_PCR_REG(PORTA,11)
#define PORTA_PCR12 PORT_PCR_REG(PORTA,12)
#define PORTA_PCR13 PORT_PCR_REG(PORTA,13)
#define PORTA_PCR14 PORT_PCR_REG(PORTA,14)
#define PORTA_PCR15 PORT_PCR_REG(PORTA,15)
#define PORTA_PCR16 PORT_PCR_REG(PORTA,16)
#define PORTA_PCR17 PORT_PCR_REG(PORTA,17)
#define PORTA_PCR18 PORT_PCR_REG(PORTA,18)
#define PORTA_PCR19 PORT_PCR_REG(PORTA,19)
#define PORTA_PCR20 PORT_PCR_REG(PORTA,20)
#define PORTA_PCR21 PORT_PCR_REG(PORTA,21)
#define PORTA_PCR22 PORT_PCR_REG(PORTA,22)
#define PORTA_PCR23 PORT_PCR_REG(PORTA,23)
#define PORTA_PCR24 PORT_PCR_REG(PORTA,24)
#define PORTA_PCR25 PORT_PCR_REG(PORTA,25)
#define PORTA_PCR26 PORT_PCR_REG(PORTA,26)
#define PORTA_PCR27 PORT_PCR_REG(PORTA,27)
#define PORTA_PCR28 PORT_PCR_REG(PORTA,28)
#define PORTA_PCR29 PORT_PCR_REG(PORTA,29)
#define PORTA_PCR30 PORT_PCR_REG(PORTA,30)
#define PORTA_PCR31 PORT_PCR_REG(PORTA,31)
#define PORTA_GPCLR PORT_GPCLR_REG(PORTA)
#define PORTA_GPCHR PORT_GPCHR_REG(PORTA)
#define PORTA_ISFR PORT_ISFR_REG(PORTA)

#define PORTB_PCR0 PORT_PCR_REG(PORTB,0)
#define PORTB_PCR1 PORT_PCR_REG(PORTB,1)
#define PORTB_PCR2 PORT_PCR_REG(PORTB,2)
#define PORTB_PCR3 PORT_PCR_REG(PORTB,3)
#define PORTB_PCR4 PORT_PCR_REG(PORTB,4)
#define PORTB_PCR5 PORT_PCR_REG(PORTB,5)
#define PORTB_PCR6 PORT_PCR_REG(PORTB,6)
#define PORTB_PCR7 PORT_PCR_REG(PORTB,7)
#define PORTB_PCR8 PORT_PCR_REG(PORTB,8)
#define PORTB_PCR9 PORT_PCR_REG(PORTB,9)
#define PORTB_PCR10 PORT_PCR_REG(PORTB,10)
#define PORTB_PCR11 PORT_PCR_REG(PORTB,11)
#define PORTB_PCR12 PORT_PCR_REG(PORTB,12)
#define PORTB_PCR13 PORT_PCR_REG(PORTB,13)
#define PORTB_PCR14 PORT_PCR_REG(PORTB,14)
#define PORTB_PCR15 PORT_PCR_REG(PORTB,15)
#define PORTB_PCR16 PORT_PCR_REG(PORTB,16)
#define PORTB_PCR17 PORT_PCR_REG(PORTB,17)
#define PORTB_PCR18 PORT_PCR_REG(PORTB,18)
#define PORTB_PCR19 PORT_PCR_REG(PORTB,19)
#define PORTB_PCR20 PORT_PCR_REG(PORTB,20)
#define PORTB_PCR21 PORT_PCR_REG(PORTB,21)
#define PORTB_PCR22 PORT_PCR_REG(PORTB,22)
#define PORTB_PCR23 PORT_PCR_REG(PORTB,23)
#define PORTB_PCR24 PORT_PCR_REG(PORTB,24)
#define PORTB_PCR25 PORT_PCR_REG(PORTB,25)
#define PORTB_PCR26 PORT_PCR_REG(PORTB,26)
#define PORTB_PCR27 PORT_PCR_REG(PORTB,27)
#define PORTB_PCR28 PORT_PCR_REG(PORTB,28)
#define PORTB_PCR29 PORT_PCR_REG(PORTB,29)
#define PORTB_PCR30 PORT_PCR_REG(PORTB,30)
#define PORTB_PCR31 PORT_PCR_REG(PORTB,31)
#define PORTB_GPCLR PORT_GPCLR_REG(PORTB)
#define PORTB_GPCHR PORT_GPCHR_REG(PORTB)
#define PORTB_ISFR PORT_ISFR_REG(PORTB)


#define PORTA_PCR(index) PORT_PCR_REG(PORTA,index)
#define PORTB_PCR(index) PORT_PCR_REG(PORTB,index)
# 4243 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile const uint8_t SRS0;
  volatile const uint8_t SRS1;
       uint8_t RESERVED_0[2];
  volatile uint8_t RPFC;
  volatile uint8_t RPFW;
} RCM_Type, *RCM_MemMapPtr;
# 4262 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define RCM_SRS0_REG(base) ((base)->SRS0)
#define RCM_SRS1_REG(base) ((base)->SRS1)
#define RCM_RPFC_REG(base) ((base)->RPFC)
#define RCM_RPFW_REG(base) ((base)->RPFW)
# 4282 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define RCM_SRS0_WAKEUP_MASK 0x1u
#define RCM_SRS0_WAKEUP_SHIFT 0
#define RCM_SRS0_WAKEUP_WIDTH 1
#define RCM_SRS0_WAKEUP(x) (((uint8_t)(((uint8_t)(x))<<RCM_SRS0_WAKEUP_SHIFT))&RCM_SRS0_WAKEUP_MASK)
#define RCM_SRS0_LVD_MASK 0x2u
#define RCM_SRS0_LVD_SHIFT 1
#define RCM_SRS0_LVD_WIDTH 1
#define RCM_SRS0_LVD(x) (((uint8_t)(((uint8_t)(x))<<RCM_SRS0_LVD_SHIFT))&RCM_SRS0_LVD_MASK)
#define RCM_SRS0_LOC_MASK 0x4u
#define RCM_SRS0_LOC_SHIFT 2
#define RCM_SRS0_LOC_WIDTH 1
#define RCM_SRS0_LOC(x) (((uint8_t)(((uint8_t)(x))<<RCM_SRS0_LOC_SHIFT))&RCM_SRS0_LOC_MASK)
#define RCM_SRS0_WDOG_MASK 0x20u
#define RCM_SRS0_WDOG_SHIFT 5
#define RCM_SRS0_WDOG_WIDTH 1
#define RCM_SRS0_WDOG(x) (((uint8_t)(((uint8_t)(x))<<RCM_SRS0_WDOG_SHIFT))&RCM_SRS0_WDOG_MASK)
#define RCM_SRS0_PIN_MASK 0x40u
#define RCM_SRS0_PIN_SHIFT 6
#define RCM_SRS0_PIN_WIDTH 1
#define RCM_SRS0_PIN(x) (((uint8_t)(((uint8_t)(x))<<RCM_SRS0_PIN_SHIFT))&RCM_SRS0_PIN_MASK)
#define RCM_SRS0_POR_MASK 0x80u
#define RCM_SRS0_POR_SHIFT 7
#define RCM_SRS0_POR_WIDTH 1
#define RCM_SRS0_POR(x) (((uint8_t)(((uint8_t)(x))<<RCM_SRS0_POR_SHIFT))&RCM_SRS0_POR_MASK)

#define RCM_SRS1_LOCKUP_MASK 0x2u
#define RCM_SRS1_LOCKUP_SHIFT 1
#define RCM_SRS1_LOCKUP_WIDTH 1
#define RCM_SRS1_LOCKUP(x) (((uint8_t)(((uint8_t)(x))<<RCM_SRS1_LOCKUP_SHIFT))&RCM_SRS1_LOCKUP_MASK)
#define RCM_SRS1_SW_MASK 0x4u
#define RCM_SRS1_SW_SHIFT 2
#define RCM_SRS1_SW_WIDTH 1
#define RCM_SRS1_SW(x) (((uint8_t)(((uint8_t)(x))<<RCM_SRS1_SW_SHIFT))&RCM_SRS1_SW_MASK)
#define RCM_SRS1_MDM_AP_MASK 0x8u
#define RCM_SRS1_MDM_AP_SHIFT 3
#define RCM_SRS1_MDM_AP_WIDTH 1
#define RCM_SRS1_MDM_AP(x) (((uint8_t)(((uint8_t)(x))<<RCM_SRS1_MDM_AP_SHIFT))&RCM_SRS1_MDM_AP_MASK)
#define RCM_SRS1_SACKERR_MASK 0x20u
#define RCM_SRS1_SACKERR_SHIFT 5
#define RCM_SRS1_SACKERR_WIDTH 1
#define RCM_SRS1_SACKERR(x) (((uint8_t)(((uint8_t)(x))<<RCM_SRS1_SACKERR_SHIFT))&RCM_SRS1_SACKERR_MASK)

#define RCM_RPFC_RSTFLTSRW_MASK 0x3u
#define RCM_RPFC_RSTFLTSRW_SHIFT 0
#define RCM_RPFC_RSTFLTSRW_WIDTH 2
#define RCM_RPFC_RSTFLTSRW(x) (((uint8_t)(((uint8_t)(x))<<RCM_RPFC_RSTFLTSRW_SHIFT))&RCM_RPFC_RSTFLTSRW_MASK)
#define RCM_RPFC_RSTFLTSS_MASK 0x4u
#define RCM_RPFC_RSTFLTSS_SHIFT 2
#define RCM_RPFC_RSTFLTSS_WIDTH 1
#define RCM_RPFC_RSTFLTSS(x) (((uint8_t)(((uint8_t)(x))<<RCM_RPFC_RSTFLTSS_SHIFT))&RCM_RPFC_RSTFLTSS_MASK)

#define RCM_RPFW_RSTFLTSEL_MASK 0x1Fu
#define RCM_RPFW_RSTFLTSEL_SHIFT 0
#define RCM_RPFW_RSTFLTSEL_WIDTH 5
#define RCM_RPFW_RSTFLTSEL(x) (((uint8_t)(((uint8_t)(x))<<RCM_RPFW_RSTFLTSEL_SHIFT))&RCM_RPFW_RSTFLTSEL_MASK)
# 4345 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define RCM_BASE (0x4007F000u)

#define RCM ((RCM_Type *)RCM_BASE)
#define RCM_BASE_PTR (RCM)

#define RCM_BASE_ADDRS { RCM_BASE }

#define RCM_BASE_PTRS { RCM }
# 4366 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define RCM_SRS0 RCM_SRS0_REG(RCM)
#define RCM_SRS1 RCM_SRS1_REG(RCM)
#define RCM_RPFC RCM_RPFC_REG(RCM)
#define RCM_RPFW RCM_RPFW_REG(RCM)
# 4391 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile const uint32_t ENTRY[3];
  volatile const uint32_t TABLEMARK;
       uint8_t RESERVED_0[4028];
  volatile const uint32_t SYSACCESS;
  volatile const uint32_t PERIPHID4;
  volatile const uint32_t PERIPHID5;
  volatile const uint32_t PERIPHID6;
  volatile const uint32_t PERIPHID7;
  volatile const uint32_t PERIPHID0;
  volatile const uint32_t PERIPHID1;
  volatile const uint32_t PERIPHID2;
  volatile const uint32_t PERIPHID3;
  volatile const uint32_t COMPID[4];
} ROM_Type, *ROM_MemMapPtr;
# 4418 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define ROM_ENTRY_REG(base,index) ((base)->ENTRY[index])
#define ROM_ENTRY_COUNT 3
#define ROM_TABLEMARK_REG(base) ((base)->TABLEMARK)
#define ROM_SYSACCESS_REG(base) ((base)->SYSACCESS)
#define ROM_PERIPHID4_REG(base) ((base)->PERIPHID4)
#define ROM_PERIPHID5_REG(base) ((base)->PERIPHID5)
#define ROM_PERIPHID6_REG(base) ((base)->PERIPHID6)
#define ROM_PERIPHID7_REG(base) ((base)->PERIPHID7)
#define ROM_PERIPHID0_REG(base) ((base)->PERIPHID0)
#define ROM_PERIPHID1_REG(base) ((base)->PERIPHID1)
#define ROM_PERIPHID2_REG(base) ((base)->PERIPHID2)
#define ROM_PERIPHID3_REG(base) ((base)->PERIPHID3)
#define ROM_COMPID_REG(base,index) ((base)->COMPID[index])
#define ROM_COMPID_COUNT 4
# 4448 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define ROM_ENTRY_ENTRY_MASK 0xFFFFFFFFu
#define ROM_ENTRY_ENTRY_SHIFT 0
#define ROM_ENTRY_ENTRY_WIDTH 32
#define ROM_ENTRY_ENTRY(x) (((uint32_t)(((uint32_t)(x))<<ROM_ENTRY_ENTRY_SHIFT))&ROM_ENTRY_ENTRY_MASK)

#define ROM_TABLEMARK_MARK_MASK 0xFFFFFFFFu
#define ROM_TABLEMARK_MARK_SHIFT 0
#define ROM_TABLEMARK_MARK_WIDTH 32
#define ROM_TABLEMARK_MARK(x) (((uint32_t)(((uint32_t)(x))<<ROM_TABLEMARK_MARK_SHIFT))&ROM_TABLEMARK_MARK_MASK)

#define ROM_SYSACCESS_SYSACCESS_MASK 0xFFFFFFFFu
#define ROM_SYSACCESS_SYSACCESS_SHIFT 0
#define ROM_SYSACCESS_SYSACCESS_WIDTH 32
#define ROM_SYSACCESS_SYSACCESS(x) (((uint32_t)(((uint32_t)(x))<<ROM_SYSACCESS_SYSACCESS_SHIFT))&ROM_SYSACCESS_SYSACCESS_MASK)

#define ROM_PERIPHID4_PERIPHID_MASK 0xFFFFFFFFu
#define ROM_PERIPHID4_PERIPHID_SHIFT 0
#define ROM_PERIPHID4_PERIPHID_WIDTH 32
#define ROM_PERIPHID4_PERIPHID(x) (((uint32_t)(((uint32_t)(x))<<ROM_PERIPHID4_PERIPHID_SHIFT))&ROM_PERIPHID4_PERIPHID_MASK)

#define ROM_PERIPHID5_PERIPHID_MASK 0xFFFFFFFFu
#define ROM_PERIPHID5_PERIPHID_SHIFT 0
#define ROM_PERIPHID5_PERIPHID_WIDTH 32
#define ROM_PERIPHID5_PERIPHID(x) (((uint32_t)(((uint32_t)(x))<<ROM_PERIPHID5_PERIPHID_SHIFT))&ROM_PERIPHID5_PERIPHID_MASK)

#define ROM_PERIPHID6_PERIPHID_MASK 0xFFFFFFFFu
#define ROM_PERIPHID6_PERIPHID_SHIFT 0
#define ROM_PERIPHID6_PERIPHID_WIDTH 32
#define ROM_PERIPHID6_PERIPHID(x) (((uint32_t)(((uint32_t)(x))<<ROM_PERIPHID6_PERIPHID_SHIFT))&ROM_PERIPHID6_PERIPHID_MASK)

#define ROM_PERIPHID7_PERIPHID_MASK 0xFFFFFFFFu
#define ROM_PERIPHID7_PERIPHID_SHIFT 0
#define ROM_PERIPHID7_PERIPHID_WIDTH 32
#define ROM_PERIPHID7_PERIPHID(x) (((uint32_t)(((uint32_t)(x))<<ROM_PERIPHID7_PERIPHID_SHIFT))&ROM_PERIPHID7_PERIPHID_MASK)

#define ROM_PERIPHID0_PERIPHID_MASK 0xFFFFFFFFu
#define ROM_PERIPHID0_PERIPHID_SHIFT 0
#define ROM_PERIPHID0_PERIPHID_WIDTH 32
#define ROM_PERIPHID0_PERIPHID(x) (((uint32_t)(((uint32_t)(x))<<ROM_PERIPHID0_PERIPHID_SHIFT))&ROM_PERIPHID0_PERIPHID_MASK)

#define ROM_PERIPHID1_PERIPHID_MASK 0xFFFFFFFFu
#define ROM_PERIPHID1_PERIPHID_SHIFT 0
#define ROM_PERIPHID1_PERIPHID_WIDTH 32
#define ROM_PERIPHID1_PERIPHID(x) (((uint32_t)(((uint32_t)(x))<<ROM_PERIPHID1_PERIPHID_SHIFT))&ROM_PERIPHID1_PERIPHID_MASK)

#define ROM_PERIPHID2_PERIPHID_MASK 0xFFFFFFFFu
#define ROM_PERIPHID2_PERIPHID_SHIFT 0
#define ROM_PERIPHID2_PERIPHID_WIDTH 32
#define ROM_PERIPHID2_PERIPHID(x) (((uint32_t)(((uint32_t)(x))<<ROM_PERIPHID2_PERIPHID_SHIFT))&ROM_PERIPHID2_PERIPHID_MASK)

#define ROM_PERIPHID3_PERIPHID_MASK 0xFFFFFFFFu
#define ROM_PERIPHID3_PERIPHID_SHIFT 0
#define ROM_PERIPHID3_PERIPHID_WIDTH 32
#define ROM_PERIPHID3_PERIPHID(x) (((uint32_t)(((uint32_t)(x))<<ROM_PERIPHID3_PERIPHID_SHIFT))&ROM_PERIPHID3_PERIPHID_MASK)

#define ROM_COMPID_COMPID_MASK 0xFFFFFFFFu
#define ROM_COMPID_COMPID_SHIFT 0
#define ROM_COMPID_COMPID_WIDTH 32
#define ROM_COMPID_COMPID(x) (((uint32_t)(((uint32_t)(x))<<ROM_COMPID_COMPID_SHIFT))&ROM_COMPID_COMPID_MASK)
# 4515 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define ROM_BASE (0xF0002000u)

#define ROM ((ROM_Type *)ROM_BASE)
#define ROM_BASE_PTR (ROM)

#define ROM_BASE_ADDRS { ROM_BASE }

#define ROM_BASE_PTRS { ROM }
# 4536 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define ROM_ENTRY0 ROM_ENTRY_REG(ROM,0)
#define ROM_ENTRY1 ROM_ENTRY_REG(ROM,1)
#define ROM_ENTRY2 ROM_ENTRY_REG(ROM,2)
#define ROM_TABLEMARK ROM_TABLEMARK_REG(ROM)
#define ROM_SYSACCESS ROM_SYSACCESS_REG(ROM)
#define ROM_PERIPHID4 ROM_PERIPHID4_REG(ROM)
#define ROM_PERIPHID5 ROM_PERIPHID5_REG(ROM)
#define ROM_PERIPHID6 ROM_PERIPHID6_REG(ROM)
#define ROM_PERIPHID7 ROM_PERIPHID7_REG(ROM)
#define ROM_PERIPHID0 ROM_PERIPHID0_REG(ROM)
#define ROM_PERIPHID1 ROM_PERIPHID1_REG(ROM)
#define ROM_PERIPHID2 ROM_PERIPHID2_REG(ROM)
#define ROM_PERIPHID3 ROM_PERIPHID3_REG(ROM)
#define ROM_COMPID0 ROM_COMPID_REG(ROM,0)
#define ROM_COMPID1 ROM_COMPID_REG(ROM,1)
#define ROM_COMPID2 ROM_COMPID_REG(ROM,2)
#define ROM_COMPID3 ROM_COMPID_REG(ROM,3)


#define ROM_ENTRY(index) ROM_ENTRY_REG(ROM,index)
#define ROM_COMPID(index) ROM_COMPID_REG(ROM,index)
# 4578 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint32_t TSR;
  volatile uint32_t TPR;
  volatile uint32_t TAR;
  volatile uint32_t TCR;
  volatile uint32_t CR;
  volatile uint32_t SR;
  volatile uint32_t LR;
  volatile uint32_t IER;
} RTC_Type, *RTC_MemMapPtr;
# 4600 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define RTC_TSR_REG(base) ((base)->TSR)
#define RTC_TPR_REG(base) ((base)->TPR)
#define RTC_TAR_REG(base) ((base)->TAR)
#define RTC_TCR_REG(base) ((base)->TCR)
#define RTC_CR_REG(base) ((base)->CR)
#define RTC_SR_REG(base) ((base)->SR)
#define RTC_LR_REG(base) ((base)->LR)
#define RTC_IER_REG(base) ((base)->IER)
# 4624 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define RTC_TSR_TSR_MASK 0xFFFFFFFFu
#define RTC_TSR_TSR_SHIFT 0
#define RTC_TSR_TSR_WIDTH 32
#define RTC_TSR_TSR(x) (((uint32_t)(((uint32_t)(x))<<RTC_TSR_TSR_SHIFT))&RTC_TSR_TSR_MASK)

#define RTC_TPR_TPR_MASK 0xFFFFu
#define RTC_TPR_TPR_SHIFT 0
#define RTC_TPR_TPR_WIDTH 16
#define RTC_TPR_TPR(x) (((uint32_t)(((uint32_t)(x))<<RTC_TPR_TPR_SHIFT))&RTC_TPR_TPR_MASK)

#define RTC_TAR_TAR_MASK 0xFFFFFFFFu
#define RTC_TAR_TAR_SHIFT 0
#define RTC_TAR_TAR_WIDTH 32
#define RTC_TAR_TAR(x) (((uint32_t)(((uint32_t)(x))<<RTC_TAR_TAR_SHIFT))&RTC_TAR_TAR_MASK)

#define RTC_TCR_TCR_MASK 0xFFu
#define RTC_TCR_TCR_SHIFT 0
#define RTC_TCR_TCR_WIDTH 8
#define RTC_TCR_TCR(x) (((uint32_t)(((uint32_t)(x))<<RTC_TCR_TCR_SHIFT))&RTC_TCR_TCR_MASK)
#define RTC_TCR_CIR_MASK 0xFF00u
#define RTC_TCR_CIR_SHIFT 8
#define RTC_TCR_CIR_WIDTH 8
#define RTC_TCR_CIR(x) (((uint32_t)(((uint32_t)(x))<<RTC_TCR_CIR_SHIFT))&RTC_TCR_CIR_MASK)
#define RTC_TCR_TCV_MASK 0xFF0000u
#define RTC_TCR_TCV_SHIFT 16
#define RTC_TCR_TCV_WIDTH 8
#define RTC_TCR_TCV(x) (((uint32_t)(((uint32_t)(x))<<RTC_TCR_TCV_SHIFT))&RTC_TCR_TCV_MASK)
#define RTC_TCR_CIC_MASK 0xFF000000u
#define RTC_TCR_CIC_SHIFT 24
#define RTC_TCR_CIC_WIDTH 8
#define RTC_TCR_CIC(x) (((uint32_t)(((uint32_t)(x))<<RTC_TCR_CIC_SHIFT))&RTC_TCR_CIC_MASK)

#define RTC_CR_SWR_MASK 0x1u
#define RTC_CR_SWR_SHIFT 0
#define RTC_CR_SWR_WIDTH 1
#define RTC_CR_SWR(x) (((uint32_t)(((uint32_t)(x))<<RTC_CR_SWR_SHIFT))&RTC_CR_SWR_MASK)
#define RTC_CR_WPE_MASK 0x2u
#define RTC_CR_WPE_SHIFT 1
#define RTC_CR_WPE_WIDTH 1
#define RTC_CR_WPE(x) (((uint32_t)(((uint32_t)(x))<<RTC_CR_WPE_SHIFT))&RTC_CR_WPE_MASK)
#define RTC_CR_SUP_MASK 0x4u
#define RTC_CR_SUP_SHIFT 2
#define RTC_CR_SUP_WIDTH 1
#define RTC_CR_SUP(x) (((uint32_t)(((uint32_t)(x))<<RTC_CR_SUP_SHIFT))&RTC_CR_SUP_MASK)
#define RTC_CR_UM_MASK 0x8u
#define RTC_CR_UM_SHIFT 3
#define RTC_CR_UM_WIDTH 1
#define RTC_CR_UM(x) (((uint32_t)(((uint32_t)(x))<<RTC_CR_UM_SHIFT))&RTC_CR_UM_MASK)
#define RTC_CR_OSCE_MASK 0x100u
#define RTC_CR_OSCE_SHIFT 8
#define RTC_CR_OSCE_WIDTH 1
#define RTC_CR_OSCE(x) (((uint32_t)(((uint32_t)(x))<<RTC_CR_OSCE_SHIFT))&RTC_CR_OSCE_MASK)
#define RTC_CR_CLKO_MASK 0x200u
#define RTC_CR_CLKO_SHIFT 9
#define RTC_CR_CLKO_WIDTH 1
#define RTC_CR_CLKO(x) (((uint32_t)(((uint32_t)(x))<<RTC_CR_CLKO_SHIFT))&RTC_CR_CLKO_MASK)
#define RTC_CR_SC16P_MASK 0x400u
#define RTC_CR_SC16P_SHIFT 10
#define RTC_CR_SC16P_WIDTH 1
#define RTC_CR_SC16P(x) (((uint32_t)(((uint32_t)(x))<<RTC_CR_SC16P_SHIFT))&RTC_CR_SC16P_MASK)
#define RTC_CR_SC8P_MASK 0x800u
#define RTC_CR_SC8P_SHIFT 11
#define RTC_CR_SC8P_WIDTH 1
#define RTC_CR_SC8P(x) (((uint32_t)(((uint32_t)(x))<<RTC_CR_SC8P_SHIFT))&RTC_CR_SC8P_MASK)
#define RTC_CR_SC4P_MASK 0x1000u
#define RTC_CR_SC4P_SHIFT 12
#define RTC_CR_SC4P_WIDTH 1
#define RTC_CR_SC4P(x) (((uint32_t)(((uint32_t)(x))<<RTC_CR_SC4P_SHIFT))&RTC_CR_SC4P_MASK)
#define RTC_CR_SC2P_MASK 0x2000u
#define RTC_CR_SC2P_SHIFT 13
#define RTC_CR_SC2P_WIDTH 1
#define RTC_CR_SC2P(x) (((uint32_t)(((uint32_t)(x))<<RTC_CR_SC2P_SHIFT))&RTC_CR_SC2P_MASK)

#define RTC_SR_TIF_MASK 0x1u
#define RTC_SR_TIF_SHIFT 0
#define RTC_SR_TIF_WIDTH 1
#define RTC_SR_TIF(x) (((uint32_t)(((uint32_t)(x))<<RTC_SR_TIF_SHIFT))&RTC_SR_TIF_MASK)
#define RTC_SR_TOF_MASK 0x2u
#define RTC_SR_TOF_SHIFT 1
#define RTC_SR_TOF_WIDTH 1
#define RTC_SR_TOF(x) (((uint32_t)(((uint32_t)(x))<<RTC_SR_TOF_SHIFT))&RTC_SR_TOF_MASK)
#define RTC_SR_TAF_MASK 0x4u
#define RTC_SR_TAF_SHIFT 2
#define RTC_SR_TAF_WIDTH 1
#define RTC_SR_TAF(x) (((uint32_t)(((uint32_t)(x))<<RTC_SR_TAF_SHIFT))&RTC_SR_TAF_MASK)
#define RTC_SR_TCE_MASK 0x10u
#define RTC_SR_TCE_SHIFT 4
#define RTC_SR_TCE_WIDTH 1
#define RTC_SR_TCE(x) (((uint32_t)(((uint32_t)(x))<<RTC_SR_TCE_SHIFT))&RTC_SR_TCE_MASK)

#define RTC_LR_TCL_MASK 0x8u
#define RTC_LR_TCL_SHIFT 3
#define RTC_LR_TCL_WIDTH 1
#define RTC_LR_TCL(x) (((uint32_t)(((uint32_t)(x))<<RTC_LR_TCL_SHIFT))&RTC_LR_TCL_MASK)
#define RTC_LR_CRL_MASK 0x10u
#define RTC_LR_CRL_SHIFT 4
#define RTC_LR_CRL_WIDTH 1
#define RTC_LR_CRL(x) (((uint32_t)(((uint32_t)(x))<<RTC_LR_CRL_SHIFT))&RTC_LR_CRL_MASK)
#define RTC_LR_SRL_MASK 0x20u
#define RTC_LR_SRL_SHIFT 5
#define RTC_LR_SRL_WIDTH 1
#define RTC_LR_SRL(x) (((uint32_t)(((uint32_t)(x))<<RTC_LR_SRL_SHIFT))&RTC_LR_SRL_MASK)
#define RTC_LR_LRL_MASK 0x40u
#define RTC_LR_LRL_SHIFT 6
#define RTC_LR_LRL_WIDTH 1
#define RTC_LR_LRL(x) (((uint32_t)(((uint32_t)(x))<<RTC_LR_LRL_SHIFT))&RTC_LR_LRL_MASK)

#define RTC_IER_TIIE_MASK 0x1u
#define RTC_IER_TIIE_SHIFT 0
#define RTC_IER_TIIE_WIDTH 1
#define RTC_IER_TIIE(x) (((uint32_t)(((uint32_t)(x))<<RTC_IER_TIIE_SHIFT))&RTC_IER_TIIE_MASK)
#define RTC_IER_TOIE_MASK 0x2u
#define RTC_IER_TOIE_SHIFT 1
#define RTC_IER_TOIE_WIDTH 1
#define RTC_IER_TOIE(x) (((uint32_t)(((uint32_t)(x))<<RTC_IER_TOIE_SHIFT))&RTC_IER_TOIE_MASK)
#define RTC_IER_TAIE_MASK 0x4u
#define RTC_IER_TAIE_SHIFT 2
#define RTC_IER_TAIE_WIDTH 1
#define RTC_IER_TAIE(x) (((uint32_t)(((uint32_t)(x))<<RTC_IER_TAIE_SHIFT))&RTC_IER_TAIE_MASK)
#define RTC_IER_TSIE_MASK 0x10u
#define RTC_IER_TSIE_SHIFT 4
#define RTC_IER_TSIE_WIDTH 1
#define RTC_IER_TSIE(x) (((uint32_t)(((uint32_t)(x))<<RTC_IER_TSIE_SHIFT))&RTC_IER_TSIE_MASK)
#define RTC_IER_WPON_MASK 0x80u
#define RTC_IER_WPON_SHIFT 7
#define RTC_IER_WPON_WIDTH 1
#define RTC_IER_WPON(x) (((uint32_t)(((uint32_t)(x))<<RTC_IER_WPON_SHIFT))&RTC_IER_WPON_MASK)
# 4759 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define RTC_BASE (0x4003D000u)

#define RTC ((RTC_Type *)RTC_BASE)
#define RTC_BASE_PTR (RTC)

#define RTC_BASE_ADDRS { RTC_BASE }

#define RTC_BASE_PTRS { RTC }
# 4780 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define RTC_TSR RTC_TSR_REG(RTC)
#define RTC_TPR RTC_TPR_REG(RTC)
#define RTC_TAR RTC_TAR_REG(RTC)
#define RTC_TCR RTC_TCR_REG(RTC)
#define RTC_CR RTC_CR_REG(RTC)
#define RTC_SR RTC_SR_REG(RTC)
#define RTC_LR RTC_LR_REG(RTC)
#define RTC_IER RTC_IER_REG(RTC)
# 4809 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint32_t SOPT1;
  volatile const uint32_t SOPT1CFG;
       uint8_t RESERVED_0[4092];
  volatile uint32_t SOPT2;
       uint8_t RESERVED_1[4];
  volatile uint32_t SOPT4;
  volatile uint32_t SOPT5;
       uint8_t RESERVED_2[4];
  volatile uint32_t SOPT7;
       uint8_t RESERVED_3[8];
  volatile const uint32_t SDID;
       uint8_t RESERVED_4[12];
  volatile uint32_t SCGC4;
  volatile uint32_t SCGC5;
  volatile uint32_t SCGC6;
  volatile uint32_t SCGC7;
  volatile uint32_t CLKDIV1;
       uint8_t RESERVED_5[4];
  volatile uint32_t FCFG1;
  volatile const uint32_t FCFG2;
       uint8_t RESERVED_6[4];
  volatile const uint32_t UIDMH;
  volatile const uint32_t UIDML;
  volatile const uint32_t UIDL;
       uint8_t RESERVED_7[156];
  volatile uint32_t COPC;
  volatile uint32_t SRVCOP;
} SIM_Type, *SIM_MemMapPtr;
# 4850 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define SIM_SOPT1_REG(base) ((base)->SOPT1)
#define SIM_SOPT1CFG_REG(base) ((base)->SOPT1CFG)
#define SIM_SOPT2_REG(base) ((base)->SOPT2)
#define SIM_SOPT4_REG(base) ((base)->SOPT4)
#define SIM_SOPT5_REG(base) ((base)->SOPT5)
#define SIM_SOPT7_REG(base) ((base)->SOPT7)
#define SIM_SDID_REG(base) ((base)->SDID)
#define SIM_SCGC4_REG(base) ((base)->SCGC4)
#define SIM_SCGC5_REG(base) ((base)->SCGC5)
#define SIM_SCGC6_REG(base) ((base)->SCGC6)
#define SIM_SCGC7_REG(base) ((base)->SCGC7)
#define SIM_CLKDIV1_REG(base) ((base)->CLKDIV1)
#define SIM_FCFG1_REG(base) ((base)->FCFG1)
#define SIM_FCFG2_REG(base) ((base)->FCFG2)
#define SIM_UIDMH_REG(base) ((base)->UIDMH)
#define SIM_UIDML_REG(base) ((base)->UIDML)
#define SIM_UIDL_REG(base) ((base)->UIDL)
#define SIM_COPC_REG(base) ((base)->COPC)
#define SIM_SRVCOP_REG(base) ((base)->SRVCOP)
# 4885 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define SIM_SOPT1_OSC32KSEL_MASK 0xC0000u
#define SIM_SOPT1_OSC32KSEL_SHIFT 18
#define SIM_SOPT1_OSC32KSEL_WIDTH 2
#define SIM_SOPT1_OSC32KSEL(x) (((uint32_t)(((uint32_t)(x))<<SIM_SOPT1_OSC32KSEL_SHIFT))&SIM_SOPT1_OSC32KSEL_MASK)

#define SIM_SOPT2_RTCCLKOUTSEL_MASK 0x10u
#define SIM_SOPT2_RTCCLKOUTSEL_SHIFT 4
#define SIM_SOPT2_RTCCLKOUTSEL_WIDTH 1
#define SIM_SOPT2_RTCCLKOUTSEL(x) (((uint32_t)(((uint32_t)(x))<<SIM_SOPT2_RTCCLKOUTSEL_SHIFT))&SIM_SOPT2_RTCCLKOUTSEL_MASK)
#define SIM_SOPT2_CLKOUTSEL_MASK 0xE0u
#define SIM_SOPT2_CLKOUTSEL_SHIFT 5
#define SIM_SOPT2_CLKOUTSEL_WIDTH 3
#define SIM_SOPT2_CLKOUTSEL(x) (((uint32_t)(((uint32_t)(x))<<SIM_SOPT2_CLKOUTSEL_SHIFT))&SIM_SOPT2_CLKOUTSEL_MASK)
#define SIM_SOPT2_TPMSRC_MASK 0x3000000u
#define SIM_SOPT2_TPMSRC_SHIFT 24
#define SIM_SOPT2_TPMSRC_WIDTH 2
#define SIM_SOPT2_TPMSRC(x) (((uint32_t)(((uint32_t)(x))<<SIM_SOPT2_TPMSRC_SHIFT))&SIM_SOPT2_TPMSRC_MASK)
#define SIM_SOPT2_UART0SRC_MASK 0xC000000u
#define SIM_SOPT2_UART0SRC_SHIFT 26
#define SIM_SOPT2_UART0SRC_WIDTH 2
#define SIM_SOPT2_UART0SRC(x) (((uint32_t)(((uint32_t)(x))<<SIM_SOPT2_UART0SRC_SHIFT))&SIM_SOPT2_UART0SRC_MASK)

#define SIM_SOPT4_TPM1CH0SRC_MASK 0x40000u
#define SIM_SOPT4_TPM1CH0SRC_SHIFT 18
#define SIM_SOPT4_TPM1CH0SRC_WIDTH 1
#define SIM_SOPT4_TPM1CH0SRC(x) (((uint32_t)(((uint32_t)(x))<<SIM_SOPT4_TPM1CH0SRC_SHIFT))&SIM_SOPT4_TPM1CH0SRC_MASK)
#define SIM_SOPT4_TPM0CLKSEL_MASK 0x1000000u
#define SIM_SOPT4_TPM0CLKSEL_SHIFT 24
#define SIM_SOPT4_TPM0CLKSEL_WIDTH 1
#define SIM_SOPT4_TPM0CLKSEL(x) (((uint32_t)(((uint32_t)(x))<<SIM_SOPT4_TPM0CLKSEL_SHIFT))&SIM_SOPT4_TPM0CLKSEL_MASK)
#define SIM_SOPT4_TPM1CLKSEL_MASK 0x2000000u
#define SIM_SOPT4_TPM1CLKSEL_SHIFT 25
#define SIM_SOPT4_TPM1CLKSEL_WIDTH 1
#define SIM_SOPT4_TPM1CLKSEL(x) (((uint32_t)(((uint32_t)(x))<<SIM_SOPT4_TPM1CLKSEL_SHIFT))&SIM_SOPT4_TPM1CLKSEL_MASK)

#define SIM_SOPT5_UART0TXSRC_MASK 0x1u
#define SIM_SOPT5_UART0TXSRC_SHIFT 0
#define SIM_SOPT5_UART0TXSRC_WIDTH 1
#define SIM_SOPT5_UART0TXSRC(x) (((uint32_t)(((uint32_t)(x))<<SIM_SOPT5_UART0TXSRC_SHIFT))&SIM_SOPT5_UART0TXSRC_MASK)
#define SIM_SOPT5_UART0RXSRC_MASK 0x4u
#define SIM_SOPT5_UART0RXSRC_SHIFT 2
#define SIM_SOPT5_UART0RXSRC_WIDTH 1
#define SIM_SOPT5_UART0RXSRC(x) (((uint32_t)(((uint32_t)(x))<<SIM_SOPT5_UART0RXSRC_SHIFT))&SIM_SOPT5_UART0RXSRC_MASK)
#define SIM_SOPT5_UART0ODE_MASK 0x10000u
#define SIM_SOPT5_UART0ODE_SHIFT 16
#define SIM_SOPT5_UART0ODE_WIDTH 1
#define SIM_SOPT5_UART0ODE(x) (((uint32_t)(((uint32_t)(x))<<SIM_SOPT5_UART0ODE_SHIFT))&SIM_SOPT5_UART0ODE_MASK)

#define SIM_SOPT7_ADC0TRGSEL_MASK 0xFu
#define SIM_SOPT7_ADC0TRGSEL_SHIFT 0
#define SIM_SOPT7_ADC0TRGSEL_WIDTH 4
#define SIM_SOPT7_ADC0TRGSEL(x) (((uint32_t)(((uint32_t)(x))<<SIM_SOPT7_ADC0TRGSEL_SHIFT))&SIM_SOPT7_ADC0TRGSEL_MASK)
#define SIM_SOPT7_ADC0PRETRGSEL_MASK 0x10u
#define SIM_SOPT7_ADC0PRETRGSEL_SHIFT 4
#define SIM_SOPT7_ADC0PRETRGSEL_WIDTH 1
#define SIM_SOPT7_ADC0PRETRGSEL(x) (((uint32_t)(((uint32_t)(x))<<SIM_SOPT7_ADC0PRETRGSEL_SHIFT))&SIM_SOPT7_ADC0PRETRGSEL_MASK)
#define SIM_SOPT7_ADC0ALTTRGEN_MASK 0x80u
#define SIM_SOPT7_ADC0ALTTRGEN_SHIFT 7
#define SIM_SOPT7_ADC0ALTTRGEN_WIDTH 1
#define SIM_SOPT7_ADC0ALTTRGEN(x) (((uint32_t)(((uint32_t)(x))<<SIM_SOPT7_ADC0ALTTRGEN_SHIFT))&SIM_SOPT7_ADC0ALTTRGEN_MASK)

#define SIM_SDID_PINID_MASK 0xFu
#define SIM_SDID_PINID_SHIFT 0
#define SIM_SDID_PINID_WIDTH 4
#define SIM_SDID_PINID(x) (((uint32_t)(((uint32_t)(x))<<SIM_SDID_PINID_SHIFT))&SIM_SDID_PINID_MASK)
#define SIM_SDID_DIEID_MASK 0xF80u
#define SIM_SDID_DIEID_SHIFT 7
#define SIM_SDID_DIEID_WIDTH 5
#define SIM_SDID_DIEID(x) (((uint32_t)(((uint32_t)(x))<<SIM_SDID_DIEID_SHIFT))&SIM_SDID_DIEID_MASK)
#define SIM_SDID_REVID_MASK 0xF000u
#define SIM_SDID_REVID_SHIFT 12
#define SIM_SDID_REVID_WIDTH 4
#define SIM_SDID_REVID(x) (((uint32_t)(((uint32_t)(x))<<SIM_SDID_REVID_SHIFT))&SIM_SDID_REVID_MASK)
#define SIM_SDID_SRAMSIZE_MASK 0xF0000u
#define SIM_SDID_SRAMSIZE_SHIFT 16
#define SIM_SDID_SRAMSIZE_WIDTH 4
#define SIM_SDID_SRAMSIZE(x) (((uint32_t)(((uint32_t)(x))<<SIM_SDID_SRAMSIZE_SHIFT))&SIM_SDID_SRAMSIZE_MASK)
#define SIM_SDID_SERIESID_MASK 0xF00000u
#define SIM_SDID_SERIESID_SHIFT 20
#define SIM_SDID_SERIESID_WIDTH 4
#define SIM_SDID_SERIESID(x) (((uint32_t)(((uint32_t)(x))<<SIM_SDID_SERIESID_SHIFT))&SIM_SDID_SERIESID_MASK)
#define SIM_SDID_SUBFAMID_MASK 0xF000000u
#define SIM_SDID_SUBFAMID_SHIFT 24
#define SIM_SDID_SUBFAMID_WIDTH 4
#define SIM_SDID_SUBFAMID(x) (((uint32_t)(((uint32_t)(x))<<SIM_SDID_SUBFAMID_SHIFT))&SIM_SDID_SUBFAMID_MASK)
#define SIM_SDID_FAMID_MASK 0xF0000000u
#define SIM_SDID_FAMID_SHIFT 28
#define SIM_SDID_FAMID_WIDTH 4
#define SIM_SDID_FAMID(x) (((uint32_t)(((uint32_t)(x))<<SIM_SDID_FAMID_SHIFT))&SIM_SDID_FAMID_MASK)

#define SIM_SCGC4_I2C0_MASK 0x40u
#define SIM_SCGC4_I2C0_SHIFT 6
#define SIM_SCGC4_I2C0_WIDTH 1
#define SIM_SCGC4_I2C0(x) (((uint32_t)(((uint32_t)(x))<<SIM_SCGC4_I2C0_SHIFT))&SIM_SCGC4_I2C0_MASK)
#define SIM_SCGC4_UART0_MASK 0x400u
#define SIM_SCGC4_UART0_SHIFT 10
#define SIM_SCGC4_UART0_WIDTH 1
#define SIM_SCGC4_UART0(x) (((uint32_t)(((uint32_t)(x))<<SIM_SCGC4_UART0_SHIFT))&SIM_SCGC4_UART0_MASK)
#define SIM_SCGC4_CMP_MASK 0x80000u
#define SIM_SCGC4_CMP_SHIFT 19
#define SIM_SCGC4_CMP_WIDTH 1
#define SIM_SCGC4_CMP(x) (((uint32_t)(((uint32_t)(x))<<SIM_SCGC4_CMP_SHIFT))&SIM_SCGC4_CMP_MASK)
#define SIM_SCGC4_SPI0_MASK 0x400000u
#define SIM_SCGC4_SPI0_SHIFT 22
#define SIM_SCGC4_SPI0_WIDTH 1
#define SIM_SCGC4_SPI0(x) (((uint32_t)(((uint32_t)(x))<<SIM_SCGC4_SPI0_SHIFT))&SIM_SCGC4_SPI0_MASK)

#define SIM_SCGC5_LPTMR_MASK 0x1u
#define SIM_SCGC5_LPTMR_SHIFT 0
#define SIM_SCGC5_LPTMR_WIDTH 1
#define SIM_SCGC5_LPTMR(x) (((uint32_t)(((uint32_t)(x))<<SIM_SCGC5_LPTMR_SHIFT))&SIM_SCGC5_LPTMR_MASK)
#define SIM_SCGC5_TSI_MASK 0x20u
#define SIM_SCGC5_TSI_SHIFT 5
#define SIM_SCGC5_TSI_WIDTH 1
#define SIM_SCGC5_TSI(x) (((uint32_t)(((uint32_t)(x))<<SIM_SCGC5_TSI_SHIFT))&SIM_SCGC5_TSI_MASK)
#define SIM_SCGC5_PORTA_MASK 0x200u
#define SIM_SCGC5_PORTA_SHIFT 9
#define SIM_SCGC5_PORTA_WIDTH 1
#define SIM_SCGC5_PORTA(x) (((uint32_t)(((uint32_t)(x))<<SIM_SCGC5_PORTA_SHIFT))&SIM_SCGC5_PORTA_MASK)
#define SIM_SCGC5_PORTB_MASK 0x400u
#define SIM_SCGC5_PORTB_SHIFT 10
#define SIM_SCGC5_PORTB_WIDTH 1
#define SIM_SCGC5_PORTB(x) (((uint32_t)(((uint32_t)(x))<<SIM_SCGC5_PORTB_SHIFT))&SIM_SCGC5_PORTB_MASK)

#define SIM_SCGC6_FTF_MASK 0x1u
#define SIM_SCGC6_FTF_SHIFT 0
#define SIM_SCGC6_FTF_WIDTH 1
#define SIM_SCGC6_FTF(x) (((uint32_t)(((uint32_t)(x))<<SIM_SCGC6_FTF_SHIFT))&SIM_SCGC6_FTF_MASK)
#define SIM_SCGC6_DMAMUX_MASK 0x2u
#define SIM_SCGC6_DMAMUX_SHIFT 1
#define SIM_SCGC6_DMAMUX_WIDTH 1
#define SIM_SCGC6_DMAMUX(x) (((uint32_t)(((uint32_t)(x))<<SIM_SCGC6_DMAMUX_SHIFT))&SIM_SCGC6_DMAMUX_MASK)
#define SIM_SCGC6_PIT_MASK 0x800000u
#define SIM_SCGC6_PIT_SHIFT 23
#define SIM_SCGC6_PIT_WIDTH 1
#define SIM_SCGC6_PIT(x) (((uint32_t)(((uint32_t)(x))<<SIM_SCGC6_PIT_SHIFT))&SIM_SCGC6_PIT_MASK)
#define SIM_SCGC6_TPM0_MASK 0x1000000u
#define SIM_SCGC6_TPM0_SHIFT 24
#define SIM_SCGC6_TPM0_WIDTH 1
#define SIM_SCGC6_TPM0(x) (((uint32_t)(((uint32_t)(x))<<SIM_SCGC6_TPM0_SHIFT))&SIM_SCGC6_TPM0_MASK)
#define SIM_SCGC6_TPM1_MASK 0x2000000u
#define SIM_SCGC6_TPM1_SHIFT 25
#define SIM_SCGC6_TPM1_WIDTH 1
#define SIM_SCGC6_TPM1(x) (((uint32_t)(((uint32_t)(x))<<SIM_SCGC6_TPM1_SHIFT))&SIM_SCGC6_TPM1_MASK)
#define SIM_SCGC6_ADC0_MASK 0x8000000u
#define SIM_SCGC6_ADC0_SHIFT 27
#define SIM_SCGC6_ADC0_WIDTH 1
#define SIM_SCGC6_ADC0(x) (((uint32_t)(((uint32_t)(x))<<SIM_SCGC6_ADC0_SHIFT))&SIM_SCGC6_ADC0_MASK)
#define SIM_SCGC6_RTC_MASK 0x20000000u
#define SIM_SCGC6_RTC_SHIFT 29
#define SIM_SCGC6_RTC_WIDTH 1
#define SIM_SCGC6_RTC(x) (((uint32_t)(((uint32_t)(x))<<SIM_SCGC6_RTC_SHIFT))&SIM_SCGC6_RTC_MASK)
#define SIM_SCGC6_DAC0_MASK 0x80000000u
#define SIM_SCGC6_DAC0_SHIFT 31
#define SIM_SCGC6_DAC0_WIDTH 1
#define SIM_SCGC6_DAC0(x) (((uint32_t)(((uint32_t)(x))<<SIM_SCGC6_DAC0_SHIFT))&SIM_SCGC6_DAC0_MASK)

#define SIM_SCGC7_DMA_MASK 0x100u
#define SIM_SCGC7_DMA_SHIFT 8
#define SIM_SCGC7_DMA_WIDTH 1
#define SIM_SCGC7_DMA(x) (((uint32_t)(((uint32_t)(x))<<SIM_SCGC7_DMA_SHIFT))&SIM_SCGC7_DMA_MASK)

#define SIM_CLKDIV1_OUTDIV4_MASK 0x70000u
#define SIM_CLKDIV1_OUTDIV4_SHIFT 16
#define SIM_CLKDIV1_OUTDIV4_WIDTH 3
#define SIM_CLKDIV1_OUTDIV4(x) (((uint32_t)(((uint32_t)(x))<<SIM_CLKDIV1_OUTDIV4_SHIFT))&SIM_CLKDIV1_OUTDIV4_MASK)
#define SIM_CLKDIV1_OUTDIV1_MASK 0xF0000000u
#define SIM_CLKDIV1_OUTDIV1_SHIFT 28
#define SIM_CLKDIV1_OUTDIV1_WIDTH 4
#define SIM_CLKDIV1_OUTDIV1(x) (((uint32_t)(((uint32_t)(x))<<SIM_CLKDIV1_OUTDIV1_SHIFT))&SIM_CLKDIV1_OUTDIV1_MASK)

#define SIM_FCFG1_FLASHDIS_MASK 0x1u
#define SIM_FCFG1_FLASHDIS_SHIFT 0
#define SIM_FCFG1_FLASHDIS_WIDTH 1
#define SIM_FCFG1_FLASHDIS(x) (((uint32_t)(((uint32_t)(x))<<SIM_FCFG1_FLASHDIS_SHIFT))&SIM_FCFG1_FLASHDIS_MASK)
#define SIM_FCFG1_FLASHDOZE_MASK 0x2u
#define SIM_FCFG1_FLASHDOZE_SHIFT 1
#define SIM_FCFG1_FLASHDOZE_WIDTH 1
#define SIM_FCFG1_FLASHDOZE(x) (((uint32_t)(((uint32_t)(x))<<SIM_FCFG1_FLASHDOZE_SHIFT))&SIM_FCFG1_FLASHDOZE_MASK)
#define SIM_FCFG1_PFSIZE_MASK 0xF000000u
#define SIM_FCFG1_PFSIZE_SHIFT 24
#define SIM_FCFG1_PFSIZE_WIDTH 4
#define SIM_FCFG1_PFSIZE(x) (((uint32_t)(((uint32_t)(x))<<SIM_FCFG1_PFSIZE_SHIFT))&SIM_FCFG1_PFSIZE_MASK)

#define SIM_FCFG2_MAXADDR0_MASK 0x7F000000u
#define SIM_FCFG2_MAXADDR0_SHIFT 24
#define SIM_FCFG2_MAXADDR0_WIDTH 7
#define SIM_FCFG2_MAXADDR0(x) (((uint32_t)(((uint32_t)(x))<<SIM_FCFG2_MAXADDR0_SHIFT))&SIM_FCFG2_MAXADDR0_MASK)

#define SIM_UIDMH_UID_MASK 0xFFFFu
#define SIM_UIDMH_UID_SHIFT 0
#define SIM_UIDMH_UID_WIDTH 16
#define SIM_UIDMH_UID(x) (((uint32_t)(((uint32_t)(x))<<SIM_UIDMH_UID_SHIFT))&SIM_UIDMH_UID_MASK)

#define SIM_UIDML_UID_MASK 0xFFFFFFFFu
#define SIM_UIDML_UID_SHIFT 0
#define SIM_UIDML_UID_WIDTH 32
#define SIM_UIDML_UID(x) (((uint32_t)(((uint32_t)(x))<<SIM_UIDML_UID_SHIFT))&SIM_UIDML_UID_MASK)

#define SIM_UIDL_UID_MASK 0xFFFFFFFFu
#define SIM_UIDL_UID_SHIFT 0
#define SIM_UIDL_UID_WIDTH 32
#define SIM_UIDL_UID(x) (((uint32_t)(((uint32_t)(x))<<SIM_UIDL_UID_SHIFT))&SIM_UIDL_UID_MASK)

#define SIM_COPC_COPW_MASK 0x1u
#define SIM_COPC_COPW_SHIFT 0
#define SIM_COPC_COPW_WIDTH 1
#define SIM_COPC_COPW(x) (((uint32_t)(((uint32_t)(x))<<SIM_COPC_COPW_SHIFT))&SIM_COPC_COPW_MASK)
#define SIM_COPC_COPCLKS_MASK 0x2u
#define SIM_COPC_COPCLKS_SHIFT 1
#define SIM_COPC_COPCLKS_WIDTH 1
#define SIM_COPC_COPCLKS(x) (((uint32_t)(((uint32_t)(x))<<SIM_COPC_COPCLKS_SHIFT))&SIM_COPC_COPCLKS_MASK)
#define SIM_COPC_COPT_MASK 0xCu
#define SIM_COPC_COPT_SHIFT 2
#define SIM_COPC_COPT_WIDTH 2
#define SIM_COPC_COPT(x) (((uint32_t)(((uint32_t)(x))<<SIM_COPC_COPT_SHIFT))&SIM_COPC_COPT_MASK)

#define SIM_SRVCOP_SRVCOP_MASK 0xFFu
#define SIM_SRVCOP_SRVCOP_SHIFT 0
#define SIM_SRVCOP_SRVCOP_WIDTH 8
#define SIM_SRVCOP_SRVCOP(x) (((uint32_t)(((uint32_t)(x))<<SIM_SRVCOP_SRVCOP_SHIFT))&SIM_SRVCOP_SRVCOP_MASK)
# 5114 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define SIM_BASE (0x40047000u)

#define SIM ((SIM_Type *)SIM_BASE)
#define SIM_BASE_PTR (SIM)

#define SIM_BASE_ADDRS { SIM_BASE }

#define SIM_BASE_PTRS { SIM }
# 5135 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define SIM_SOPT1 SIM_SOPT1_REG(SIM)
#define SIM_SOPT1CFG SIM_SOPT1CFG_REG(SIM)
#define SIM_SOPT2 SIM_SOPT2_REG(SIM)
#define SIM_SOPT4 SIM_SOPT4_REG(SIM)
#define SIM_SOPT5 SIM_SOPT5_REG(SIM)
#define SIM_SOPT7 SIM_SOPT7_REG(SIM)
#define SIM_SDID SIM_SDID_REG(SIM)
#define SIM_SCGC4 SIM_SCGC4_REG(SIM)
#define SIM_SCGC5 SIM_SCGC5_REG(SIM)
#define SIM_SCGC6 SIM_SCGC6_REG(SIM)
#define SIM_SCGC7 SIM_SCGC7_REG(SIM)
#define SIM_CLKDIV1 SIM_CLKDIV1_REG(SIM)
#define SIM_FCFG1 SIM_FCFG1_REG(SIM)
#define SIM_FCFG2 SIM_FCFG2_REG(SIM)
#define SIM_UIDMH SIM_UIDMH_REG(SIM)
#define SIM_UIDML SIM_UIDML_REG(SIM)
#define SIM_UIDL SIM_UIDL_REG(SIM)
#define SIM_COPC SIM_COPC_REG(SIM)
#define SIM_SRVCOP SIM_SRVCOP_REG(SIM)
# 5175 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint8_t PMPROT;
  volatile uint8_t PMCTRL;
  volatile uint8_t STOPCTRL;
  volatile const uint8_t PMSTAT;
} SMC_Type, *SMC_MemMapPtr;
# 5193 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define SMC_PMPROT_REG(base) ((base)->PMPROT)
#define SMC_PMCTRL_REG(base) ((base)->PMCTRL)
#define SMC_STOPCTRL_REG(base) ((base)->STOPCTRL)
#define SMC_PMSTAT_REG(base) ((base)->PMSTAT)
# 5213 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define SMC_PMPROT_AVLLS_MASK 0x2u
#define SMC_PMPROT_AVLLS_SHIFT 1
#define SMC_PMPROT_AVLLS_WIDTH 1
#define SMC_PMPROT_AVLLS(x) (((uint8_t)(((uint8_t)(x))<<SMC_PMPROT_AVLLS_SHIFT))&SMC_PMPROT_AVLLS_MASK)
#define SMC_PMPROT_ALLS_MASK 0x8u
#define SMC_PMPROT_ALLS_SHIFT 3
#define SMC_PMPROT_ALLS_WIDTH 1
#define SMC_PMPROT_ALLS(x) (((uint8_t)(((uint8_t)(x))<<SMC_PMPROT_ALLS_SHIFT))&SMC_PMPROT_ALLS_MASK)
#define SMC_PMPROT_AVLP_MASK 0x20u
#define SMC_PMPROT_AVLP_SHIFT 5
#define SMC_PMPROT_AVLP_WIDTH 1
#define SMC_PMPROT_AVLP(x) (((uint8_t)(((uint8_t)(x))<<SMC_PMPROT_AVLP_SHIFT))&SMC_PMPROT_AVLP_MASK)

#define SMC_PMCTRL_STOPM_MASK 0x7u
#define SMC_PMCTRL_STOPM_SHIFT 0
#define SMC_PMCTRL_STOPM_WIDTH 3
#define SMC_PMCTRL_STOPM(x) (((uint8_t)(((uint8_t)(x))<<SMC_PMCTRL_STOPM_SHIFT))&SMC_PMCTRL_STOPM_MASK)
#define SMC_PMCTRL_STOPA_MASK 0x8u
#define SMC_PMCTRL_STOPA_SHIFT 3
#define SMC_PMCTRL_STOPA_WIDTH 1
#define SMC_PMCTRL_STOPA(x) (((uint8_t)(((uint8_t)(x))<<SMC_PMCTRL_STOPA_SHIFT))&SMC_PMCTRL_STOPA_MASK)
#define SMC_PMCTRL_RUNM_MASK 0x60u
#define SMC_PMCTRL_RUNM_SHIFT 5
#define SMC_PMCTRL_RUNM_WIDTH 2
#define SMC_PMCTRL_RUNM(x) (((uint8_t)(((uint8_t)(x))<<SMC_PMCTRL_RUNM_SHIFT))&SMC_PMCTRL_RUNM_MASK)

#define SMC_STOPCTRL_VLLSM_MASK 0x7u
#define SMC_STOPCTRL_VLLSM_SHIFT 0
#define SMC_STOPCTRL_VLLSM_WIDTH 3
#define SMC_STOPCTRL_VLLSM(x) (((uint8_t)(((uint8_t)(x))<<SMC_STOPCTRL_VLLSM_SHIFT))&SMC_STOPCTRL_VLLSM_MASK)
#define SMC_STOPCTRL_PORPO_MASK 0x20u
#define SMC_STOPCTRL_PORPO_SHIFT 5
#define SMC_STOPCTRL_PORPO_WIDTH 1
#define SMC_STOPCTRL_PORPO(x) (((uint8_t)(((uint8_t)(x))<<SMC_STOPCTRL_PORPO_SHIFT))&SMC_STOPCTRL_PORPO_MASK)
#define SMC_STOPCTRL_PSTOPO_MASK 0xC0u
#define SMC_STOPCTRL_PSTOPO_SHIFT 6
#define SMC_STOPCTRL_PSTOPO_WIDTH 2
#define SMC_STOPCTRL_PSTOPO(x) (((uint8_t)(((uint8_t)(x))<<SMC_STOPCTRL_PSTOPO_SHIFT))&SMC_STOPCTRL_PSTOPO_MASK)

#define SMC_PMSTAT_PMSTAT_MASK 0x7Fu
#define SMC_PMSTAT_PMSTAT_SHIFT 0
#define SMC_PMSTAT_PMSTAT_WIDTH 7
#define SMC_PMSTAT_PMSTAT(x) (((uint8_t)(((uint8_t)(x))<<SMC_PMSTAT_PMSTAT_SHIFT))&SMC_PMSTAT_PMSTAT_MASK)
# 5264 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define SMC_BASE (0x4007E000u)

#define SMC ((SMC_Type *)SMC_BASE)
#define SMC_BASE_PTR (SMC)

#define SMC_BASE_ADDRS { SMC_BASE }

#define SMC_BASE_PTRS { SMC }
# 5285 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define SMC_PMPROT SMC_PMPROT_REG(SMC)
#define SMC_PMCTRL SMC_PMCTRL_REG(SMC)
#define SMC_STOPCTRL SMC_STOPCTRL_REG(SMC)
#define SMC_PMSTAT SMC_PMSTAT_REG(SMC)
# 5310 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint8_t C1;
  volatile uint8_t C2;
  volatile uint8_t BR;
  volatile uint8_t S;
       uint8_t RESERVED_0[1];
  volatile uint8_t D;
       uint8_t RESERVED_1[1];
  volatile uint8_t M;
} SPI_Type, *SPI_MemMapPtr;
# 5332 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define SPI_C1_REG(base) ((base)->C1)
#define SPI_C2_REG(base) ((base)->C2)
#define SPI_BR_REG(base) ((base)->BR)
#define SPI_S_REG(base) ((base)->S)
#define SPI_D_REG(base) ((base)->D)
#define SPI_M_REG(base) ((base)->M)
# 5354 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define SPI_C1_LSBFE_MASK 0x1u
#define SPI_C1_LSBFE_SHIFT 0
#define SPI_C1_LSBFE_WIDTH 1
#define SPI_C1_LSBFE(x) (((uint8_t)(((uint8_t)(x))<<SPI_C1_LSBFE_SHIFT))&SPI_C1_LSBFE_MASK)
#define SPI_C1_SSOE_MASK 0x2u
#define SPI_C1_SSOE_SHIFT 1
#define SPI_C1_SSOE_WIDTH 1
#define SPI_C1_SSOE(x) (((uint8_t)(((uint8_t)(x))<<SPI_C1_SSOE_SHIFT))&SPI_C1_SSOE_MASK)
#define SPI_C1_CPHA_MASK 0x4u
#define SPI_C1_CPHA_SHIFT 2
#define SPI_C1_CPHA_WIDTH 1
#define SPI_C1_CPHA(x) (((uint8_t)(((uint8_t)(x))<<SPI_C1_CPHA_SHIFT))&SPI_C1_CPHA_MASK)
#define SPI_C1_CPOL_MASK 0x8u
#define SPI_C1_CPOL_SHIFT 3
#define SPI_C1_CPOL_WIDTH 1
#define SPI_C1_CPOL(x) (((uint8_t)(((uint8_t)(x))<<SPI_C1_CPOL_SHIFT))&SPI_C1_CPOL_MASK)
#define SPI_C1_MSTR_MASK 0x10u
#define SPI_C1_MSTR_SHIFT 4
#define SPI_C1_MSTR_WIDTH 1
#define SPI_C1_MSTR(x) (((uint8_t)(((uint8_t)(x))<<SPI_C1_MSTR_SHIFT))&SPI_C1_MSTR_MASK)
#define SPI_C1_SPTIE_MASK 0x20u
#define SPI_C1_SPTIE_SHIFT 5
#define SPI_C1_SPTIE_WIDTH 1
#define SPI_C1_SPTIE(x) (((uint8_t)(((uint8_t)(x))<<SPI_C1_SPTIE_SHIFT))&SPI_C1_SPTIE_MASK)
#define SPI_C1_SPE_MASK 0x40u
#define SPI_C1_SPE_SHIFT 6
#define SPI_C1_SPE_WIDTH 1
#define SPI_C1_SPE(x) (((uint8_t)(((uint8_t)(x))<<SPI_C1_SPE_SHIFT))&SPI_C1_SPE_MASK)
#define SPI_C1_SPIE_MASK 0x80u
#define SPI_C1_SPIE_SHIFT 7
#define SPI_C1_SPIE_WIDTH 1
#define SPI_C1_SPIE(x) (((uint8_t)(((uint8_t)(x))<<SPI_C1_SPIE_SHIFT))&SPI_C1_SPIE_MASK)

#define SPI_C2_SPC0_MASK 0x1u
#define SPI_C2_SPC0_SHIFT 0
#define SPI_C2_SPC0_WIDTH 1
#define SPI_C2_SPC0(x) (((uint8_t)(((uint8_t)(x))<<SPI_C2_SPC0_SHIFT))&SPI_C2_SPC0_MASK)
#define SPI_C2_SPISWAI_MASK 0x2u
#define SPI_C2_SPISWAI_SHIFT 1
#define SPI_C2_SPISWAI_WIDTH 1
#define SPI_C2_SPISWAI(x) (((uint8_t)(((uint8_t)(x))<<SPI_C2_SPISWAI_SHIFT))&SPI_C2_SPISWAI_MASK)
#define SPI_C2_RXDMAE_MASK 0x4u
#define SPI_C2_RXDMAE_SHIFT 2
#define SPI_C2_RXDMAE_WIDTH 1
#define SPI_C2_RXDMAE(x) (((uint8_t)(((uint8_t)(x))<<SPI_C2_RXDMAE_SHIFT))&SPI_C2_RXDMAE_MASK)
#define SPI_C2_BIDIROE_MASK 0x8u
#define SPI_C2_BIDIROE_SHIFT 3
#define SPI_C2_BIDIROE_WIDTH 1
#define SPI_C2_BIDIROE(x) (((uint8_t)(((uint8_t)(x))<<SPI_C2_BIDIROE_SHIFT))&SPI_C2_BIDIROE_MASK)
#define SPI_C2_MODFEN_MASK 0x10u
#define SPI_C2_MODFEN_SHIFT 4
#define SPI_C2_MODFEN_WIDTH 1
#define SPI_C2_MODFEN(x) (((uint8_t)(((uint8_t)(x))<<SPI_C2_MODFEN_SHIFT))&SPI_C2_MODFEN_MASK)
#define SPI_C2_TXDMAE_MASK 0x20u
#define SPI_C2_TXDMAE_SHIFT 5
#define SPI_C2_TXDMAE_WIDTH 1
#define SPI_C2_TXDMAE(x) (((uint8_t)(((uint8_t)(x))<<SPI_C2_TXDMAE_SHIFT))&SPI_C2_TXDMAE_MASK)
#define SPI_C2_SPMIE_MASK 0x80u
#define SPI_C2_SPMIE_SHIFT 7
#define SPI_C2_SPMIE_WIDTH 1
#define SPI_C2_SPMIE(x) (((uint8_t)(((uint8_t)(x))<<SPI_C2_SPMIE_SHIFT))&SPI_C2_SPMIE_MASK)

#define SPI_BR_SPR_MASK 0xFu
#define SPI_BR_SPR_SHIFT 0
#define SPI_BR_SPR_WIDTH 4
#define SPI_BR_SPR(x) (((uint8_t)(((uint8_t)(x))<<SPI_BR_SPR_SHIFT))&SPI_BR_SPR_MASK)
#define SPI_BR_SPPR_MASK 0x70u
#define SPI_BR_SPPR_SHIFT 4
#define SPI_BR_SPPR_WIDTH 3
#define SPI_BR_SPPR(x) (((uint8_t)(((uint8_t)(x))<<SPI_BR_SPPR_SHIFT))&SPI_BR_SPPR_MASK)

#define SPI_S_MODF_MASK 0x10u
#define SPI_S_MODF_SHIFT 4
#define SPI_S_MODF_WIDTH 1
#define SPI_S_MODF(x) (((uint8_t)(((uint8_t)(x))<<SPI_S_MODF_SHIFT))&SPI_S_MODF_MASK)
#define SPI_S_SPTEF_MASK 0x20u
#define SPI_S_SPTEF_SHIFT 5
#define SPI_S_SPTEF_WIDTH 1
#define SPI_S_SPTEF(x) (((uint8_t)(((uint8_t)(x))<<SPI_S_SPTEF_SHIFT))&SPI_S_SPTEF_MASK)
#define SPI_S_SPMF_MASK 0x40u
#define SPI_S_SPMF_SHIFT 6
#define SPI_S_SPMF_WIDTH 1
#define SPI_S_SPMF(x) (((uint8_t)(((uint8_t)(x))<<SPI_S_SPMF_SHIFT))&SPI_S_SPMF_MASK)
#define SPI_S_SPRF_MASK 0x80u
#define SPI_S_SPRF_SHIFT 7
#define SPI_S_SPRF_WIDTH 1
#define SPI_S_SPRF(x) (((uint8_t)(((uint8_t)(x))<<SPI_S_SPRF_SHIFT))&SPI_S_SPRF_MASK)

#define SPI_D_Bits_MASK 0xFFu
#define SPI_D_Bits_SHIFT 0
#define SPI_D_Bits_WIDTH 8
#define SPI_D_Bits(x) (((uint8_t)(((uint8_t)(x))<<SPI_D_Bits_SHIFT))&SPI_D_Bits_MASK)

#define SPI_M_Bits_MASK 0xFFu
#define SPI_M_Bits_SHIFT 0
#define SPI_M_Bits_WIDTH 8
#define SPI_M_Bits(x) (((uint8_t)(((uint8_t)(x))<<SPI_M_Bits_SHIFT))&SPI_M_Bits_MASK)
# 5459 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define SPI0_BASE (0x40076000u)

#define SPI0 ((SPI_Type *)SPI0_BASE)
#define SPI0_BASE_PTR (SPI0)

#define SPI_BASE_ADDRS { SPI0_BASE }

#define SPI_BASE_PTRS { SPI0 }
# 5480 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define SPI0_C1 SPI_C1_REG(SPI0)
#define SPI0_C2 SPI_C2_REG(SPI0)
#define SPI0_BR SPI_BR_REG(SPI0)
#define SPI0_S SPI_S_REG(SPI0)
#define SPI0_D SPI_D_REG(SPI0)
#define SPI0_M SPI_M_REG(SPI0)
# 5507 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint32_t SC;
  volatile uint32_t CNT;
  volatile uint32_t MOD;
  struct {
    volatile uint32_t CnSC;
    volatile uint32_t CnV;
  } CONTROLS[6];
       uint8_t RESERVED_0[20];
  volatile uint32_t STATUS;
       uint8_t RESERVED_1[48];
  volatile uint32_t CONF;
} TPM_Type, *TPM_MemMapPtr;
# 5532 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define TPM_SC_REG(base) ((base)->SC)
#define TPM_CNT_REG(base) ((base)->CNT)
#define TPM_MOD_REG(base) ((base)->MOD)
#define TPM_CnSC_REG(base,index) ((base)->CONTROLS[index].CnSC)
#define TPM_CnSC_COUNT 6
#define TPM_CnV_REG(base,index) ((base)->CONTROLS[index].CnV)
#define TPM_CnV_COUNT 6
#define TPM_STATUS_REG(base) ((base)->STATUS)
#define TPM_CONF_REG(base) ((base)->CONF)
# 5557 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define TPM_SC_PS_MASK 0x7u
#define TPM_SC_PS_SHIFT 0
#define TPM_SC_PS_WIDTH 3
#define TPM_SC_PS(x) (((uint32_t)(((uint32_t)(x))<<TPM_SC_PS_SHIFT))&TPM_SC_PS_MASK)
#define TPM_SC_CMOD_MASK 0x18u
#define TPM_SC_CMOD_SHIFT 3
#define TPM_SC_CMOD_WIDTH 2
#define TPM_SC_CMOD(x) (((uint32_t)(((uint32_t)(x))<<TPM_SC_CMOD_SHIFT))&TPM_SC_CMOD_MASK)
#define TPM_SC_CPWMS_MASK 0x20u
#define TPM_SC_CPWMS_SHIFT 5
#define TPM_SC_CPWMS_WIDTH 1
#define TPM_SC_CPWMS(x) (((uint32_t)(((uint32_t)(x))<<TPM_SC_CPWMS_SHIFT))&TPM_SC_CPWMS_MASK)
#define TPM_SC_TOIE_MASK 0x40u
#define TPM_SC_TOIE_SHIFT 6
#define TPM_SC_TOIE_WIDTH 1
#define TPM_SC_TOIE(x) (((uint32_t)(((uint32_t)(x))<<TPM_SC_TOIE_SHIFT))&TPM_SC_TOIE_MASK)
#define TPM_SC_TOF_MASK 0x80u
#define TPM_SC_TOF_SHIFT 7
#define TPM_SC_TOF_WIDTH 1
#define TPM_SC_TOF(x) (((uint32_t)(((uint32_t)(x))<<TPM_SC_TOF_SHIFT))&TPM_SC_TOF_MASK)
#define TPM_SC_DMA_MASK 0x100u
#define TPM_SC_DMA_SHIFT 8
#define TPM_SC_DMA_WIDTH 1
#define TPM_SC_DMA(x) (((uint32_t)(((uint32_t)(x))<<TPM_SC_DMA_SHIFT))&TPM_SC_DMA_MASK)

#define TPM_CNT_COUNT_MASK 0xFFFFu
#define TPM_CNT_COUNT_SHIFT 0
#define TPM_CNT_COUNT_WIDTH 16
#define TPM_CNT_COUNT(x) (((uint32_t)(((uint32_t)(x))<<TPM_CNT_COUNT_SHIFT))&TPM_CNT_COUNT_MASK)

#define TPM_MOD_MOD_MASK 0xFFFFu
#define TPM_MOD_MOD_SHIFT 0
#define TPM_MOD_MOD_WIDTH 16
#define TPM_MOD_MOD(x) (((uint32_t)(((uint32_t)(x))<<TPM_MOD_MOD_SHIFT))&TPM_MOD_MOD_MASK)

#define TPM_CnSC_DMA_MASK 0x1u
#define TPM_CnSC_DMA_SHIFT 0
#define TPM_CnSC_DMA_WIDTH 1
#define TPM_CnSC_DMA(x) (((uint32_t)(((uint32_t)(x))<<TPM_CnSC_DMA_SHIFT))&TPM_CnSC_DMA_MASK)
#define TPM_CnSC_ELSA_MASK 0x4u
#define TPM_CnSC_ELSA_SHIFT 2
#define TPM_CnSC_ELSA_WIDTH 1
#define TPM_CnSC_ELSA(x) (((uint32_t)(((uint32_t)(x))<<TPM_CnSC_ELSA_SHIFT))&TPM_CnSC_ELSA_MASK)
#define TPM_CnSC_ELSB_MASK 0x8u
#define TPM_CnSC_ELSB_SHIFT 3
#define TPM_CnSC_ELSB_WIDTH 1
#define TPM_CnSC_ELSB(x) (((uint32_t)(((uint32_t)(x))<<TPM_CnSC_ELSB_SHIFT))&TPM_CnSC_ELSB_MASK)
#define TPM_CnSC_MSA_MASK 0x10u
#define TPM_CnSC_MSA_SHIFT 4
#define TPM_CnSC_MSA_WIDTH 1
#define TPM_CnSC_MSA(x) (((uint32_t)(((uint32_t)(x))<<TPM_CnSC_MSA_SHIFT))&TPM_CnSC_MSA_MASK)
#define TPM_CnSC_MSB_MASK 0x20u
#define TPM_CnSC_MSB_SHIFT 5
#define TPM_CnSC_MSB_WIDTH 1
#define TPM_CnSC_MSB(x) (((uint32_t)(((uint32_t)(x))<<TPM_CnSC_MSB_SHIFT))&TPM_CnSC_MSB_MASK)
#define TPM_CnSC_CHIE_MASK 0x40u
#define TPM_CnSC_CHIE_SHIFT 6
#define TPM_CnSC_CHIE_WIDTH 1
#define TPM_CnSC_CHIE(x) (((uint32_t)(((uint32_t)(x))<<TPM_CnSC_CHIE_SHIFT))&TPM_CnSC_CHIE_MASK)
#define TPM_CnSC_CHF_MASK 0x80u
#define TPM_CnSC_CHF_SHIFT 7
#define TPM_CnSC_CHF_WIDTH 1
#define TPM_CnSC_CHF(x) (((uint32_t)(((uint32_t)(x))<<TPM_CnSC_CHF_SHIFT))&TPM_CnSC_CHF_MASK)

#define TPM_CnV_VAL_MASK 0xFFFFu
#define TPM_CnV_VAL_SHIFT 0
#define TPM_CnV_VAL_WIDTH 16
#define TPM_CnV_VAL(x) (((uint32_t)(((uint32_t)(x))<<TPM_CnV_VAL_SHIFT))&TPM_CnV_VAL_MASK)

#define TPM_STATUS_CH0F_MASK 0x1u
#define TPM_STATUS_CH0F_SHIFT 0
#define TPM_STATUS_CH0F_WIDTH 1
#define TPM_STATUS_CH0F(x) (((uint32_t)(((uint32_t)(x))<<TPM_STATUS_CH0F_SHIFT))&TPM_STATUS_CH0F_MASK)
#define TPM_STATUS_CH1F_MASK 0x2u
#define TPM_STATUS_CH1F_SHIFT 1
#define TPM_STATUS_CH1F_WIDTH 1
#define TPM_STATUS_CH1F(x) (((uint32_t)(((uint32_t)(x))<<TPM_STATUS_CH1F_SHIFT))&TPM_STATUS_CH1F_MASK)
#define TPM_STATUS_CH2F_MASK 0x4u
#define TPM_STATUS_CH2F_SHIFT 2
#define TPM_STATUS_CH2F_WIDTH 1
#define TPM_STATUS_CH2F(x) (((uint32_t)(((uint32_t)(x))<<TPM_STATUS_CH2F_SHIFT))&TPM_STATUS_CH2F_MASK)
#define TPM_STATUS_CH3F_MASK 0x8u
#define TPM_STATUS_CH3F_SHIFT 3
#define TPM_STATUS_CH3F_WIDTH 1
#define TPM_STATUS_CH3F(x) (((uint32_t)(((uint32_t)(x))<<TPM_STATUS_CH3F_SHIFT))&TPM_STATUS_CH3F_MASK)
#define TPM_STATUS_CH4F_MASK 0x10u
#define TPM_STATUS_CH4F_SHIFT 4
#define TPM_STATUS_CH4F_WIDTH 1
#define TPM_STATUS_CH4F(x) (((uint32_t)(((uint32_t)(x))<<TPM_STATUS_CH4F_SHIFT))&TPM_STATUS_CH4F_MASK)
#define TPM_STATUS_CH5F_MASK 0x20u
#define TPM_STATUS_CH5F_SHIFT 5
#define TPM_STATUS_CH5F_WIDTH 1
#define TPM_STATUS_CH5F(x) (((uint32_t)(((uint32_t)(x))<<TPM_STATUS_CH5F_SHIFT))&TPM_STATUS_CH5F_MASK)
#define TPM_STATUS_TOF_MASK 0x100u
#define TPM_STATUS_TOF_SHIFT 8
#define TPM_STATUS_TOF_WIDTH 1
#define TPM_STATUS_TOF(x) (((uint32_t)(((uint32_t)(x))<<TPM_STATUS_TOF_SHIFT))&TPM_STATUS_TOF_MASK)

#define TPM_CONF_DOZEEN_MASK 0x20u
#define TPM_CONF_DOZEEN_SHIFT 5
#define TPM_CONF_DOZEEN_WIDTH 1
#define TPM_CONF_DOZEEN(x) (((uint32_t)(((uint32_t)(x))<<TPM_CONF_DOZEEN_SHIFT))&TPM_CONF_DOZEEN_MASK)
#define TPM_CONF_DBGMODE_MASK 0xC0u
#define TPM_CONF_DBGMODE_SHIFT 6
#define TPM_CONF_DBGMODE_WIDTH 2
#define TPM_CONF_DBGMODE(x) (((uint32_t)(((uint32_t)(x))<<TPM_CONF_DBGMODE_SHIFT))&TPM_CONF_DBGMODE_MASK)
#define TPM_CONF_GTBEEN_MASK 0x200u
#define TPM_CONF_GTBEEN_SHIFT 9
#define TPM_CONF_GTBEEN_WIDTH 1
#define TPM_CONF_GTBEEN(x) (((uint32_t)(((uint32_t)(x))<<TPM_CONF_GTBEEN_SHIFT))&TPM_CONF_GTBEEN_MASK)
#define TPM_CONF_CSOT_MASK 0x10000u
#define TPM_CONF_CSOT_SHIFT 16
#define TPM_CONF_CSOT_WIDTH 1
#define TPM_CONF_CSOT(x) (((uint32_t)(((uint32_t)(x))<<TPM_CONF_CSOT_SHIFT))&TPM_CONF_CSOT_MASK)
#define TPM_CONF_CSOO_MASK 0x20000u
#define TPM_CONF_CSOO_SHIFT 17
#define TPM_CONF_CSOO_WIDTH 1
#define TPM_CONF_CSOO(x) (((uint32_t)(((uint32_t)(x))<<TPM_CONF_CSOO_SHIFT))&TPM_CONF_CSOO_MASK)
#define TPM_CONF_CROT_MASK 0x40000u
#define TPM_CONF_CROT_SHIFT 18
#define TPM_CONF_CROT_WIDTH 1
#define TPM_CONF_CROT(x) (((uint32_t)(((uint32_t)(x))<<TPM_CONF_CROT_SHIFT))&TPM_CONF_CROT_MASK)
#define TPM_CONF_TRGSEL_MASK 0xF000000u
#define TPM_CONF_TRGSEL_SHIFT 24
#define TPM_CONF_TRGSEL_WIDTH 4
#define TPM_CONF_TRGSEL(x) (((uint32_t)(((uint32_t)(x))<<TPM_CONF_TRGSEL_SHIFT))&TPM_CONF_TRGSEL_MASK)
# 5691 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define TPM0_BASE (0x40038000u)

#define TPM0 ((TPM_Type *)TPM0_BASE)
#define TPM0_BASE_PTR (TPM0)

#define TPM1_BASE (0x40039000u)

#define TPM1 ((TPM_Type *)TPM1_BASE)
#define TPM1_BASE_PTR (TPM1)

#define TPM_BASE_ADDRS { TPM0_BASE, TPM1_BASE }

#define TPM_BASE_PTRS { TPM0, TPM1 }
# 5717 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define TPM0_SC TPM_SC_REG(TPM0)
#define TPM0_CNT TPM_CNT_REG(TPM0)
#define TPM0_MOD TPM_MOD_REG(TPM0)
#define TPM0_C0SC TPM_CnSC_REG(TPM0,0)
#define TPM0_C0V TPM_CnV_REG(TPM0,0)
#define TPM0_C1SC TPM_CnSC_REG(TPM0,1)
#define TPM0_C1V TPM_CnV_REG(TPM0,1)
#define TPM0_C2SC TPM_CnSC_REG(TPM0,2)
#define TPM0_C2V TPM_CnV_REG(TPM0,2)
#define TPM0_C3SC TPM_CnSC_REG(TPM0,3)
#define TPM0_C3V TPM_CnV_REG(TPM0,3)
#define TPM0_C4SC TPM_CnSC_REG(TPM0,4)
#define TPM0_C4V TPM_CnV_REG(TPM0,4)
#define TPM0_C5SC TPM_CnSC_REG(TPM0,5)
#define TPM0_C5V TPM_CnV_REG(TPM0,5)
#define TPM0_STATUS TPM_STATUS_REG(TPM0)
#define TPM0_CONF TPM_CONF_REG(TPM0)

#define TPM1_SC TPM_SC_REG(TPM1)
#define TPM1_CNT TPM_CNT_REG(TPM1)
#define TPM1_MOD TPM_MOD_REG(TPM1)
#define TPM1_C0SC TPM_CnSC_REG(TPM1,0)
#define TPM1_C0V TPM_CnV_REG(TPM1,0)
#define TPM1_C1SC TPM_CnSC_REG(TPM1,1)
#define TPM1_C1V TPM_CnV_REG(TPM1,1)
#define TPM1_STATUS TPM_STATUS_REG(TPM1)
#define TPM1_CONF TPM_CONF_REG(TPM1)


#define TPM0_CnSC(index) TPM_CnSC_REG(TPM0,index)
#define TPM1_CnSC(index) TPM_CnSC_REG(TPM1,index)
#define TPM0_CnV(index) TPM_CnV_REG(TPM0,index)
#define TPM1_CnV(index) TPM_CnV_REG(TPM1,index)
# 5771 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint32_t GENCS;
  volatile uint32_t DATA;
  volatile uint32_t TSHD;
} TSI_Type, *TSI_MemMapPtr;
# 5788 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define TSI_GENCS_REG(base) ((base)->GENCS)
#define TSI_DATA_REG(base) ((base)->DATA)
#define TSI_TSHD_REG(base) ((base)->TSHD)
# 5807 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define TSI_GENCS_CURSW_MASK 0x2u
#define TSI_GENCS_CURSW_SHIFT 1
#define TSI_GENCS_CURSW_WIDTH 1
#define TSI_GENCS_CURSW(x) (((uint32_t)(((uint32_t)(x))<<TSI_GENCS_CURSW_SHIFT))&TSI_GENCS_CURSW_MASK)
#define TSI_GENCS_EOSF_MASK 0x4u
#define TSI_GENCS_EOSF_SHIFT 2
#define TSI_GENCS_EOSF_WIDTH 1
#define TSI_GENCS_EOSF(x) (((uint32_t)(((uint32_t)(x))<<TSI_GENCS_EOSF_SHIFT))&TSI_GENCS_EOSF_MASK)
#define TSI_GENCS_SCNIP_MASK 0x8u
#define TSI_GENCS_SCNIP_SHIFT 3
#define TSI_GENCS_SCNIP_WIDTH 1
#define TSI_GENCS_SCNIP(x) (((uint32_t)(((uint32_t)(x))<<TSI_GENCS_SCNIP_SHIFT))&TSI_GENCS_SCNIP_MASK)
#define TSI_GENCS_STM_MASK 0x10u
#define TSI_GENCS_STM_SHIFT 4
#define TSI_GENCS_STM_WIDTH 1
#define TSI_GENCS_STM(x) (((uint32_t)(((uint32_t)(x))<<TSI_GENCS_STM_SHIFT))&TSI_GENCS_STM_MASK)
#define TSI_GENCS_STPE_MASK 0x20u
#define TSI_GENCS_STPE_SHIFT 5
#define TSI_GENCS_STPE_WIDTH 1
#define TSI_GENCS_STPE(x) (((uint32_t)(((uint32_t)(x))<<TSI_GENCS_STPE_SHIFT))&TSI_GENCS_STPE_MASK)
#define TSI_GENCS_TSIIEN_MASK 0x40u
#define TSI_GENCS_TSIIEN_SHIFT 6
#define TSI_GENCS_TSIIEN_WIDTH 1
#define TSI_GENCS_TSIIEN(x) (((uint32_t)(((uint32_t)(x))<<TSI_GENCS_TSIIEN_SHIFT))&TSI_GENCS_TSIIEN_MASK)
#define TSI_GENCS_TSIEN_MASK 0x80u
#define TSI_GENCS_TSIEN_SHIFT 7
#define TSI_GENCS_TSIEN_WIDTH 1
#define TSI_GENCS_TSIEN(x) (((uint32_t)(((uint32_t)(x))<<TSI_GENCS_TSIEN_SHIFT))&TSI_GENCS_TSIEN_MASK)
#define TSI_GENCS_NSCN_MASK 0x1F00u
#define TSI_GENCS_NSCN_SHIFT 8
#define TSI_GENCS_NSCN_WIDTH 5
#define TSI_GENCS_NSCN(x) (((uint32_t)(((uint32_t)(x))<<TSI_GENCS_NSCN_SHIFT))&TSI_GENCS_NSCN_MASK)
#define TSI_GENCS_PS_MASK 0xE000u
#define TSI_GENCS_PS_SHIFT 13
#define TSI_GENCS_PS_WIDTH 3
#define TSI_GENCS_PS(x) (((uint32_t)(((uint32_t)(x))<<TSI_GENCS_PS_SHIFT))&TSI_GENCS_PS_MASK)
#define TSI_GENCS_EXTCHRG_MASK 0x70000u
#define TSI_GENCS_EXTCHRG_SHIFT 16
#define TSI_GENCS_EXTCHRG_WIDTH 3
#define TSI_GENCS_EXTCHRG(x) (((uint32_t)(((uint32_t)(x))<<TSI_GENCS_EXTCHRG_SHIFT))&TSI_GENCS_EXTCHRG_MASK)
#define TSI_GENCS_DVOLT_MASK 0x180000u
#define TSI_GENCS_DVOLT_SHIFT 19
#define TSI_GENCS_DVOLT_WIDTH 2
#define TSI_GENCS_DVOLT(x) (((uint32_t)(((uint32_t)(x))<<TSI_GENCS_DVOLT_SHIFT))&TSI_GENCS_DVOLT_MASK)
#define TSI_GENCS_REFCHRG_MASK 0xE00000u
#define TSI_GENCS_REFCHRG_SHIFT 21
#define TSI_GENCS_REFCHRG_WIDTH 3
#define TSI_GENCS_REFCHRG(x) (((uint32_t)(((uint32_t)(x))<<TSI_GENCS_REFCHRG_SHIFT))&TSI_GENCS_REFCHRG_MASK)
#define TSI_GENCS_MODE_MASK 0xF000000u
#define TSI_GENCS_MODE_SHIFT 24
#define TSI_GENCS_MODE_WIDTH 4
#define TSI_GENCS_MODE(x) (((uint32_t)(((uint32_t)(x))<<TSI_GENCS_MODE_SHIFT))&TSI_GENCS_MODE_MASK)
#define TSI_GENCS_ESOR_MASK 0x10000000u
#define TSI_GENCS_ESOR_SHIFT 28
#define TSI_GENCS_ESOR_WIDTH 1
#define TSI_GENCS_ESOR(x) (((uint32_t)(((uint32_t)(x))<<TSI_GENCS_ESOR_SHIFT))&TSI_GENCS_ESOR_MASK)
#define TSI_GENCS_OUTRGF_MASK 0x80000000u
#define TSI_GENCS_OUTRGF_SHIFT 31
#define TSI_GENCS_OUTRGF_WIDTH 1
#define TSI_GENCS_OUTRGF(x) (((uint32_t)(((uint32_t)(x))<<TSI_GENCS_OUTRGF_SHIFT))&TSI_GENCS_OUTRGF_MASK)

#define TSI_DATA_TSICNT_MASK 0xFFFFu
#define TSI_DATA_TSICNT_SHIFT 0
#define TSI_DATA_TSICNT_WIDTH 16
#define TSI_DATA_TSICNT(x) (((uint32_t)(((uint32_t)(x))<<TSI_DATA_TSICNT_SHIFT))&TSI_DATA_TSICNT_MASK)
#define TSI_DATA_SWTS_MASK 0x400000u
#define TSI_DATA_SWTS_SHIFT 22
#define TSI_DATA_SWTS_WIDTH 1
#define TSI_DATA_SWTS(x) (((uint32_t)(((uint32_t)(x))<<TSI_DATA_SWTS_SHIFT))&TSI_DATA_SWTS_MASK)
#define TSI_DATA_DMAEN_MASK 0x800000u
#define TSI_DATA_DMAEN_SHIFT 23
#define TSI_DATA_DMAEN_WIDTH 1
#define TSI_DATA_DMAEN(x) (((uint32_t)(((uint32_t)(x))<<TSI_DATA_DMAEN_SHIFT))&TSI_DATA_DMAEN_MASK)
#define TSI_DATA_TSICH_MASK 0xF0000000u
#define TSI_DATA_TSICH_SHIFT 28
#define TSI_DATA_TSICH_WIDTH 4
#define TSI_DATA_TSICH(x) (((uint32_t)(((uint32_t)(x))<<TSI_DATA_TSICH_SHIFT))&TSI_DATA_TSICH_MASK)

#define TSI_TSHD_THRESL_MASK 0xFFFFu
#define TSI_TSHD_THRESL_SHIFT 0
#define TSI_TSHD_THRESL_WIDTH 16
#define TSI_TSHD_THRESL(x) (((uint32_t)(((uint32_t)(x))<<TSI_TSHD_THRESL_SHIFT))&TSI_TSHD_THRESL_MASK)
#define TSI_TSHD_THRESH_MASK 0xFFFF0000u
#define TSI_TSHD_THRESH_SHIFT 16
#define TSI_TSHD_THRESH_WIDTH 16
#define TSI_TSHD_THRESH(x) (((uint32_t)(((uint32_t)(x))<<TSI_TSHD_THRESH_SHIFT))&TSI_TSHD_THRESH_MASK)
# 5901 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define TSI0_BASE (0x40045000u)

#define TSI0 ((TSI_Type *)TSI0_BASE)
#define TSI0_BASE_PTR (TSI0)

#define TSI_BASE_ADDRS { TSI0_BASE }

#define TSI_BASE_PTRS { TSI0 }
# 5922 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define TSI0_GENCS TSI_GENCS_REG(TSI0)
#define TSI0_DATA TSI_DATA_REG(TSI0)
#define TSI0_TSHD TSI_TSHD_REG(TSI0)
# 5946 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
typedef struct {
  volatile uint8_t BDH;
  volatile uint8_t BDL;
  volatile uint8_t C1;
  volatile uint8_t C2;
  volatile uint8_t S1;
  volatile uint8_t S2;
  volatile uint8_t C3;
  volatile uint8_t D;
  volatile uint8_t MA1;
  volatile uint8_t MA2;
  volatile uint8_t C4;
  volatile uint8_t C5;
} UART0_Type, *UART0_MemMapPtr;
# 5972 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define UART0_BDH_REG(base) ((base)->BDH)
#define UART0_BDL_REG(base) ((base)->BDL)
#define UART0_C1_REG(base) ((base)->C1)
#define UART0_C2_REG(base) ((base)->C2)
#define UART0_S1_REG(base) ((base)->S1)
#define UART0_S2_REG(base) ((base)->S2)
#define UART0_C3_REG(base) ((base)->C3)
#define UART0_D_REG(base) ((base)->D)
#define UART0_MA1_REG(base) ((base)->MA1)
#define UART0_MA2_REG(base) ((base)->MA2)
#define UART0_C4_REG(base) ((base)->C4)
#define UART0_C5_REG(base) ((base)->C5)
# 6000 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define UART0_BDH_SBR_MASK 0x1Fu
#define UART0_BDH_SBR_SHIFT 0
#define UART0_BDH_SBR_WIDTH 5
#define UART0_BDH_SBR(x) (((uint8_t)(((uint8_t)(x))<<UART0_BDH_SBR_SHIFT))&UART0_BDH_SBR_MASK)
#define UART0_BDH_SBNS_MASK 0x20u
#define UART0_BDH_SBNS_SHIFT 5
#define UART0_BDH_SBNS_WIDTH 1
#define UART0_BDH_SBNS(x) (((uint8_t)(((uint8_t)(x))<<UART0_BDH_SBNS_SHIFT))&UART0_BDH_SBNS_MASK)
#define UART0_BDH_RXEDGIE_MASK 0x40u
#define UART0_BDH_RXEDGIE_SHIFT 6
#define UART0_BDH_RXEDGIE_WIDTH 1
#define UART0_BDH_RXEDGIE(x) (((uint8_t)(((uint8_t)(x))<<UART0_BDH_RXEDGIE_SHIFT))&UART0_BDH_RXEDGIE_MASK)
#define UART0_BDH_LBKDIE_MASK 0x80u
#define UART0_BDH_LBKDIE_SHIFT 7
#define UART0_BDH_LBKDIE_WIDTH 1
#define UART0_BDH_LBKDIE(x) (((uint8_t)(((uint8_t)(x))<<UART0_BDH_LBKDIE_SHIFT))&UART0_BDH_LBKDIE_MASK)

#define UART0_BDL_SBR_MASK 0xFFu
#define UART0_BDL_SBR_SHIFT 0
#define UART0_BDL_SBR_WIDTH 8
#define UART0_BDL_SBR(x) (((uint8_t)(((uint8_t)(x))<<UART0_BDL_SBR_SHIFT))&UART0_BDL_SBR_MASK)

#define UART0_C1_PT_MASK 0x1u
#define UART0_C1_PT_SHIFT 0
#define UART0_C1_PT_WIDTH 1
#define UART0_C1_PT(x) (((uint8_t)(((uint8_t)(x))<<UART0_C1_PT_SHIFT))&UART0_C1_PT_MASK)
#define UART0_C1_PE_MASK 0x2u
#define UART0_C1_PE_SHIFT 1
#define UART0_C1_PE_WIDTH 1
#define UART0_C1_PE(x) (((uint8_t)(((uint8_t)(x))<<UART0_C1_PE_SHIFT))&UART0_C1_PE_MASK)
#define UART0_C1_ILT_MASK 0x4u
#define UART0_C1_ILT_SHIFT 2
#define UART0_C1_ILT_WIDTH 1
#define UART0_C1_ILT(x) (((uint8_t)(((uint8_t)(x))<<UART0_C1_ILT_SHIFT))&UART0_C1_ILT_MASK)
#define UART0_C1_WAKE_MASK 0x8u
#define UART0_C1_WAKE_SHIFT 3
#define UART0_C1_WAKE_WIDTH 1
#define UART0_C1_WAKE(x) (((uint8_t)(((uint8_t)(x))<<UART0_C1_WAKE_SHIFT))&UART0_C1_WAKE_MASK)
#define UART0_C1_M_MASK 0x10u
#define UART0_C1_M_SHIFT 4
#define UART0_C1_M_WIDTH 1
#define UART0_C1_M(x) (((uint8_t)(((uint8_t)(x))<<UART0_C1_M_SHIFT))&UART0_C1_M_MASK)
#define UART0_C1_RSRC_MASK 0x20u
#define UART0_C1_RSRC_SHIFT 5
#define UART0_C1_RSRC_WIDTH 1
#define UART0_C1_RSRC(x) (((uint8_t)(((uint8_t)(x))<<UART0_C1_RSRC_SHIFT))&UART0_C1_RSRC_MASK)
#define UART0_C1_DOZEEN_MASK 0x40u
#define UART0_C1_DOZEEN_SHIFT 6
#define UART0_C1_DOZEEN_WIDTH 1
#define UART0_C1_DOZEEN(x) (((uint8_t)(((uint8_t)(x))<<UART0_C1_DOZEEN_SHIFT))&UART0_C1_DOZEEN_MASK)
#define UART0_C1_LOOPS_MASK 0x80u
#define UART0_C1_LOOPS_SHIFT 7
#define UART0_C1_LOOPS_WIDTH 1
#define UART0_C1_LOOPS(x) (((uint8_t)(((uint8_t)(x))<<UART0_C1_LOOPS_SHIFT))&UART0_C1_LOOPS_MASK)

#define UART0_C2_SBK_MASK 0x1u
#define UART0_C2_SBK_SHIFT 0
#define UART0_C2_SBK_WIDTH 1
#define UART0_C2_SBK(x) (((uint8_t)(((uint8_t)(x))<<UART0_C2_SBK_SHIFT))&UART0_C2_SBK_MASK)
#define UART0_C2_RWU_MASK 0x2u
#define UART0_C2_RWU_SHIFT 1
#define UART0_C2_RWU_WIDTH 1
#define UART0_C2_RWU(x) (((uint8_t)(((uint8_t)(x))<<UART0_C2_RWU_SHIFT))&UART0_C2_RWU_MASK)
#define UART0_C2_RE_MASK 0x4u
#define UART0_C2_RE_SHIFT 2
#define UART0_C2_RE_WIDTH 1
#define UART0_C2_RE(x) (((uint8_t)(((uint8_t)(x))<<UART0_C2_RE_SHIFT))&UART0_C2_RE_MASK)
#define UART0_C2_TE_MASK 0x8u
#define UART0_C2_TE_SHIFT 3
#define UART0_C2_TE_WIDTH 1
#define UART0_C2_TE(x) (((uint8_t)(((uint8_t)(x))<<UART0_C2_TE_SHIFT))&UART0_C2_TE_MASK)
#define UART0_C2_ILIE_MASK 0x10u
#define UART0_C2_ILIE_SHIFT 4
#define UART0_C2_ILIE_WIDTH 1
#define UART0_C2_ILIE(x) (((uint8_t)(((uint8_t)(x))<<UART0_C2_ILIE_SHIFT))&UART0_C2_ILIE_MASK)
#define UART0_C2_RIE_MASK 0x20u
#define UART0_C2_RIE_SHIFT 5
#define UART0_C2_RIE_WIDTH 1
#define UART0_C2_RIE(x) (((uint8_t)(((uint8_t)(x))<<UART0_C2_RIE_SHIFT))&UART0_C2_RIE_MASK)
#define UART0_C2_TCIE_MASK 0x40u
#define UART0_C2_TCIE_SHIFT 6
#define UART0_C2_TCIE_WIDTH 1
#define UART0_C2_TCIE(x) (((uint8_t)(((uint8_t)(x))<<UART0_C2_TCIE_SHIFT))&UART0_C2_TCIE_MASK)
#define UART0_C2_TIE_MASK 0x80u
#define UART0_C2_TIE_SHIFT 7
#define UART0_C2_TIE_WIDTH 1
#define UART0_C2_TIE(x) (((uint8_t)(((uint8_t)(x))<<UART0_C2_TIE_SHIFT))&UART0_C2_TIE_MASK)

#define UART0_S1_PF_MASK 0x1u
#define UART0_S1_PF_SHIFT 0
#define UART0_S1_PF_WIDTH 1
#define UART0_S1_PF(x) (((uint8_t)(((uint8_t)(x))<<UART0_S1_PF_SHIFT))&UART0_S1_PF_MASK)
#define UART0_S1_FE_MASK 0x2u
#define UART0_S1_FE_SHIFT 1
#define UART0_S1_FE_WIDTH 1
#define UART0_S1_FE(x) (((uint8_t)(((uint8_t)(x))<<UART0_S1_FE_SHIFT))&UART0_S1_FE_MASK)
#define UART0_S1_NF_MASK 0x4u
#define UART0_S1_NF_SHIFT 2
#define UART0_S1_NF_WIDTH 1
#define UART0_S1_NF(x) (((uint8_t)(((uint8_t)(x))<<UART0_S1_NF_SHIFT))&UART0_S1_NF_MASK)
#define UART0_S1_OR_MASK 0x8u
#define UART0_S1_OR_SHIFT 3
#define UART0_S1_OR_WIDTH 1
#define UART0_S1_OR(x) (((uint8_t)(((uint8_t)(x))<<UART0_S1_OR_SHIFT))&UART0_S1_OR_MASK)
#define UART0_S1_IDLE_MASK 0x10u
#define UART0_S1_IDLE_SHIFT 4
#define UART0_S1_IDLE_WIDTH 1
#define UART0_S1_IDLE(x) (((uint8_t)(((uint8_t)(x))<<UART0_S1_IDLE_SHIFT))&UART0_S1_IDLE_MASK)
#define UART0_S1_RDRF_MASK 0x20u
#define UART0_S1_RDRF_SHIFT 5
#define UART0_S1_RDRF_WIDTH 1
#define UART0_S1_RDRF(x) (((uint8_t)(((uint8_t)(x))<<UART0_S1_RDRF_SHIFT))&UART0_S1_RDRF_MASK)
#define UART0_S1_TC_MASK 0x40u
#define UART0_S1_TC_SHIFT 6
#define UART0_S1_TC_WIDTH 1
#define UART0_S1_TC(x) (((uint8_t)(((uint8_t)(x))<<UART0_S1_TC_SHIFT))&UART0_S1_TC_MASK)
#define UART0_S1_TDRE_MASK 0x80u
#define UART0_S1_TDRE_SHIFT 7
#define UART0_S1_TDRE_WIDTH 1
#define UART0_S1_TDRE(x) (((uint8_t)(((uint8_t)(x))<<UART0_S1_TDRE_SHIFT))&UART0_S1_TDRE_MASK)

#define UART0_S2_RAF_MASK 0x1u
#define UART0_S2_RAF_SHIFT 0
#define UART0_S2_RAF_WIDTH 1
#define UART0_S2_RAF(x) (((uint8_t)(((uint8_t)(x))<<UART0_S2_RAF_SHIFT))&UART0_S2_RAF_MASK)
#define UART0_S2_LBKDE_MASK 0x2u
#define UART0_S2_LBKDE_SHIFT 1
#define UART0_S2_LBKDE_WIDTH 1
#define UART0_S2_LBKDE(x) (((uint8_t)(((uint8_t)(x))<<UART0_S2_LBKDE_SHIFT))&UART0_S2_LBKDE_MASK)
#define UART0_S2_BRK13_MASK 0x4u
#define UART0_S2_BRK13_SHIFT 2
#define UART0_S2_BRK13_WIDTH 1
#define UART0_S2_BRK13(x) (((uint8_t)(((uint8_t)(x))<<UART0_S2_BRK13_SHIFT))&UART0_S2_BRK13_MASK)
#define UART0_S2_RWUID_MASK 0x8u
#define UART0_S2_RWUID_SHIFT 3
#define UART0_S2_RWUID_WIDTH 1
#define UART0_S2_RWUID(x) (((uint8_t)(((uint8_t)(x))<<UART0_S2_RWUID_SHIFT))&UART0_S2_RWUID_MASK)
#define UART0_S2_RXINV_MASK 0x10u
#define UART0_S2_RXINV_SHIFT 4
#define UART0_S2_RXINV_WIDTH 1
#define UART0_S2_RXINV(x) (((uint8_t)(((uint8_t)(x))<<UART0_S2_RXINV_SHIFT))&UART0_S2_RXINV_MASK)
#define UART0_S2_MSBF_MASK 0x20u
#define UART0_S2_MSBF_SHIFT 5
#define UART0_S2_MSBF_WIDTH 1
#define UART0_S2_MSBF(x) (((uint8_t)(((uint8_t)(x))<<UART0_S2_MSBF_SHIFT))&UART0_S2_MSBF_MASK)
#define UART0_S2_RXEDGIF_MASK 0x40u
#define UART0_S2_RXEDGIF_SHIFT 6
#define UART0_S2_RXEDGIF_WIDTH 1
#define UART0_S2_RXEDGIF(x) (((uint8_t)(((uint8_t)(x))<<UART0_S2_RXEDGIF_SHIFT))&UART0_S2_RXEDGIF_MASK)
#define UART0_S2_LBKDIF_MASK 0x80u
#define UART0_S2_LBKDIF_SHIFT 7
#define UART0_S2_LBKDIF_WIDTH 1
#define UART0_S2_LBKDIF(x) (((uint8_t)(((uint8_t)(x))<<UART0_S2_LBKDIF_SHIFT))&UART0_S2_LBKDIF_MASK)

#define UART0_C3_PEIE_MASK 0x1u
#define UART0_C3_PEIE_SHIFT 0
#define UART0_C3_PEIE_WIDTH 1
#define UART0_C3_PEIE(x) (((uint8_t)(((uint8_t)(x))<<UART0_C3_PEIE_SHIFT))&UART0_C3_PEIE_MASK)
#define UART0_C3_FEIE_MASK 0x2u
#define UART0_C3_FEIE_SHIFT 1
#define UART0_C3_FEIE_WIDTH 1
#define UART0_C3_FEIE(x) (((uint8_t)(((uint8_t)(x))<<UART0_C3_FEIE_SHIFT))&UART0_C3_FEIE_MASK)
#define UART0_C3_NEIE_MASK 0x4u
#define UART0_C3_NEIE_SHIFT 2
#define UART0_C3_NEIE_WIDTH 1
#define UART0_C3_NEIE(x) (((uint8_t)(((uint8_t)(x))<<UART0_C3_NEIE_SHIFT))&UART0_C3_NEIE_MASK)
#define UART0_C3_ORIE_MASK 0x8u
#define UART0_C3_ORIE_SHIFT 3
#define UART0_C3_ORIE_WIDTH 1
#define UART0_C3_ORIE(x) (((uint8_t)(((uint8_t)(x))<<UART0_C3_ORIE_SHIFT))&UART0_C3_ORIE_MASK)
#define UART0_C3_TXINV_MASK 0x10u
#define UART0_C3_TXINV_SHIFT 4
#define UART0_C3_TXINV_WIDTH 1
#define UART0_C3_TXINV(x) (((uint8_t)(((uint8_t)(x))<<UART0_C3_TXINV_SHIFT))&UART0_C3_TXINV_MASK)
#define UART0_C3_TXDIR_MASK 0x20u
#define UART0_C3_TXDIR_SHIFT 5
#define UART0_C3_TXDIR_WIDTH 1
#define UART0_C3_TXDIR(x) (((uint8_t)(((uint8_t)(x))<<UART0_C3_TXDIR_SHIFT))&UART0_C3_TXDIR_MASK)
#define UART0_C3_R9T8_MASK 0x40u
#define UART0_C3_R9T8_SHIFT 6
#define UART0_C3_R9T8_WIDTH 1
#define UART0_C3_R9T8(x) (((uint8_t)(((uint8_t)(x))<<UART0_C3_R9T8_SHIFT))&UART0_C3_R9T8_MASK)
#define UART0_C3_R8T9_MASK 0x80u
#define UART0_C3_R8T9_SHIFT 7
#define UART0_C3_R8T9_WIDTH 1
#define UART0_C3_R8T9(x) (((uint8_t)(((uint8_t)(x))<<UART0_C3_R8T9_SHIFT))&UART0_C3_R8T9_MASK)

#define UART0_D_R0T0_MASK 0x1u
#define UART0_D_R0T0_SHIFT 0
#define UART0_D_R0T0_WIDTH 1
#define UART0_D_R0T0(x) (((uint8_t)(((uint8_t)(x))<<UART0_D_R0T0_SHIFT))&UART0_D_R0T0_MASK)
#define UART0_D_R1T1_MASK 0x2u
#define UART0_D_R1T1_SHIFT 1
#define UART0_D_R1T1_WIDTH 1
#define UART0_D_R1T1(x) (((uint8_t)(((uint8_t)(x))<<UART0_D_R1T1_SHIFT))&UART0_D_R1T1_MASK)
#define UART0_D_R2T2_MASK 0x4u
#define UART0_D_R2T2_SHIFT 2
#define UART0_D_R2T2_WIDTH 1
#define UART0_D_R2T2(x) (((uint8_t)(((uint8_t)(x))<<UART0_D_R2T2_SHIFT))&UART0_D_R2T2_MASK)
#define UART0_D_R3T3_MASK 0x8u
#define UART0_D_R3T3_SHIFT 3
#define UART0_D_R3T3_WIDTH 1
#define UART0_D_R3T3(x) (((uint8_t)(((uint8_t)(x))<<UART0_D_R3T3_SHIFT))&UART0_D_R3T3_MASK)
#define UART0_D_R4T4_MASK 0x10u
#define UART0_D_R4T4_SHIFT 4
#define UART0_D_R4T4_WIDTH 1
#define UART0_D_R4T4(x) (((uint8_t)(((uint8_t)(x))<<UART0_D_R4T4_SHIFT))&UART0_D_R4T4_MASK)
#define UART0_D_R5T5_MASK 0x20u
#define UART0_D_R5T5_SHIFT 5
#define UART0_D_R5T5_WIDTH 1
#define UART0_D_R5T5(x) (((uint8_t)(((uint8_t)(x))<<UART0_D_R5T5_SHIFT))&UART0_D_R5T5_MASK)
#define UART0_D_R6T6_MASK 0x40u
#define UART0_D_R6T6_SHIFT 6
#define UART0_D_R6T6_WIDTH 1
#define UART0_D_R6T6(x) (((uint8_t)(((uint8_t)(x))<<UART0_D_R6T6_SHIFT))&UART0_D_R6T6_MASK)
#define UART0_D_R7T7_MASK 0x80u
#define UART0_D_R7T7_SHIFT 7
#define UART0_D_R7T7_WIDTH 1
#define UART0_D_R7T7(x) (((uint8_t)(((uint8_t)(x))<<UART0_D_R7T7_SHIFT))&UART0_D_R7T7_MASK)

#define UART0_MA1_MA_MASK 0xFFu
#define UART0_MA1_MA_SHIFT 0
#define UART0_MA1_MA_WIDTH 8
#define UART0_MA1_MA(x) (((uint8_t)(((uint8_t)(x))<<UART0_MA1_MA_SHIFT))&UART0_MA1_MA_MASK)

#define UART0_MA2_MA_MASK 0xFFu
#define UART0_MA2_MA_SHIFT 0
#define UART0_MA2_MA_WIDTH 8
#define UART0_MA2_MA(x) (((uint8_t)(((uint8_t)(x))<<UART0_MA2_MA_SHIFT))&UART0_MA2_MA_MASK)

#define UART0_C4_OSR_MASK 0x1Fu
#define UART0_C4_OSR_SHIFT 0
#define UART0_C4_OSR_WIDTH 5
#define UART0_C4_OSR(x) (((uint8_t)(((uint8_t)(x))<<UART0_C4_OSR_SHIFT))&UART0_C4_OSR_MASK)
#define UART0_C4_M10_MASK 0x20u
#define UART0_C4_M10_SHIFT 5
#define UART0_C4_M10_WIDTH 1
#define UART0_C4_M10(x) (((uint8_t)(((uint8_t)(x))<<UART0_C4_M10_SHIFT))&UART0_C4_M10_MASK)
#define UART0_C4_MAEN2_MASK 0x40u
#define UART0_C4_MAEN2_SHIFT 6
#define UART0_C4_MAEN2_WIDTH 1
#define UART0_C4_MAEN2(x) (((uint8_t)(((uint8_t)(x))<<UART0_C4_MAEN2_SHIFT))&UART0_C4_MAEN2_MASK)
#define UART0_C4_MAEN1_MASK 0x80u
#define UART0_C4_MAEN1_SHIFT 7
#define UART0_C4_MAEN1_WIDTH 1
#define UART0_C4_MAEN1(x) (((uint8_t)(((uint8_t)(x))<<UART0_C4_MAEN1_SHIFT))&UART0_C4_MAEN1_MASK)

#define UART0_C5_RESYNCDIS_MASK 0x1u
#define UART0_C5_RESYNCDIS_SHIFT 0
#define UART0_C5_RESYNCDIS_WIDTH 1
#define UART0_C5_RESYNCDIS(x) (((uint8_t)(((uint8_t)(x))<<UART0_C5_RESYNCDIS_SHIFT))&UART0_C5_RESYNCDIS_MASK)
#define UART0_C5_BOTHEDGE_MASK 0x2u
#define UART0_C5_BOTHEDGE_SHIFT 1
#define UART0_C5_BOTHEDGE_WIDTH 1
#define UART0_C5_BOTHEDGE(x) (((uint8_t)(((uint8_t)(x))<<UART0_C5_BOTHEDGE_SHIFT))&UART0_C5_BOTHEDGE_MASK)
#define UART0_C5_RDMAE_MASK 0x20u
#define UART0_C5_RDMAE_SHIFT 5
#define UART0_C5_RDMAE_WIDTH 1
#define UART0_C5_RDMAE(x) (((uint8_t)(((uint8_t)(x))<<UART0_C5_RDMAE_SHIFT))&UART0_C5_RDMAE_MASK)
#define UART0_C5_TDMAE_MASK 0x80u
#define UART0_C5_TDMAE_SHIFT 7
#define UART0_C5_TDMAE_WIDTH 1
#define UART0_C5_TDMAE(x) (((uint8_t)(((uint8_t)(x))<<UART0_C5_TDMAE_SHIFT))&UART0_C5_TDMAE_MASK)
# 6271 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define UART0_BASE (0x4006A000u)

#define UART0 ((UART0_Type *)UART0_BASE)
#define UART0_BASE_PTR (UART0)

#define UART0_BASE_ADDRS { UART0_BASE }

#define UART0_BASE_PTRS { UART0 }
# 6292 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define UART0_BDH UART0_BDH_REG(UART0)
#define UART0_BDL UART0_BDL_REG(UART0)
#define UART0_C1 UART0_C1_REG(UART0)
#define UART0_C2 UART0_C2_REG(UART0)
#define UART0_S1 UART0_S1_REG(UART0)
#define UART0_S2 UART0_S2_REG(UART0)
#define UART0_C3 UART0_C3_REG(UART0)
#define UART0_D UART0_D_REG(UART0)
#define UART0_MA1 UART0_MA1_REG(UART0)
#define UART0_MA2 UART0_MA2_REG(UART0)
#define UART0_C4 UART0_C4_REG(UART0)
#define UART0_C5 UART0_C5_REG(UART0)
# 6345 "../hal/mcu/NXP_KL05/BSP/include/MKL05Z4.h"
#define DMA_REQC_ARR_DMAC_MASK This_symbol_has_been_deprecated
#define DMA_REQC_ARR_DMAC_SHIFT This_symbol_has_been_deprecated
#define DMA_REQC_ARR_DMAC(x) This_symbol_has_been_deprecated
#define DMA_REQC_ARR_CFSM_MASK This_symbol_has_been_deprecated
#define DMA_REQC_ARR_CFSM_SHIFT This_symbol_has_been_deprecated
#define DMA_REQC0 This_symbol_has_been_deprecated
#define DMA_REQC1 This_symbol_has_been_deprecated
#define DMA_REQC2 This_symbol_has_been_deprecated
#define DMA_REQC3 This_symbol_has_been_deprecated
#define MCG_C6_CME0_MASK MCG_C6_CME_MASK
#define MCG_C6_CME0_SHIFT MCG_C6_CME_SHIFT
#define MCM_MATCR_ATC0_MASK This_symbol_has_been_deprecated
#define MCM_MATCR_ATC0_SHIFT This_symbol_has_been_deprecated
#define MCM_MATCR_ATC0(x) This_symbol_has_been_deprecated
#define MCM_MATCR_RO0_MASK This_symbol_has_been_deprecated
#define MCM_MATCR_RO0_SHIFT This_symbol_has_been_deprecated
#define MCM_MATCR_ATC1_MASK This_symbol_has_been_deprecated
#define MCM_MATCR_ATC1_SHIFT This_symbol_has_been_deprecated
#define MCM_MATCR_ATC1(x) This_symbol_has_been_deprecated
#define MCM_MATCR_RO1_MASK This_symbol_has_been_deprecated
#define MCM_MATCR_RO1_SHIFT This_symbol_has_been_deprecated
#define MCM_MATCR_ATC2_MASK This_symbol_has_been_deprecated
#define MCM_MATCR_ATC2_SHIFT This_symbol_has_been_deprecated
#define MCM_MATCR_ATC2(x) This_symbol_has_been_deprecated
#define MCM_MATCR_RO2_MASK This_symbol_has_been_deprecated
#define MCM_MATCR_RO2_SHIFT This_symbol_has_been_deprecated
#define MCM_MATCR_ATC3_MASK This_symbol_has_been_deprecated
#define MCM_MATCR_ATC3_SHIFT This_symbol_has_been_deprecated
#define MCM_MATCR_ATC3(x) This_symbol_has_been_deprecated
#define MCM_MATCR_RO3_MASK This_symbol_has_been_deprecated
#define MCM_MATCR_RO3_SHIFT This_symbol_has_been_deprecated
#define SIM_FCFG2_MAXADDR_MASK SIM_FCFG2_MAXADDR0_MASK
#define SIM_FCFG2_MAXADDR_SHIFT SIM_FCFG2_MAXADDR0_SHIFT
#define SIM_FCFG2_MAXADDR SIM_FCFG2_MAXADDR0
#define SPI_C2_SPLPIE_MASK This_symbol_has_been_deprecated
#define SPI_C2_SPLPIE_SHIFT This_symbol_has_been_deprecated
#define UARTLP_Type UART0_Type
#define UARTLP_BDH_REG UART0_BDH_REG
#define UARTLP_BDL_REG UART0_BDL_REG
#define UARTLP_C1_REG UART0_C1_REG
#define UARTLP_C2_REG UART0_C2_REG
#define UARTLP_S1_REG UART0_S1_REG
#define UARTLP_S2_REG UART0_S2_REG
#define UARTLP_C3_REG UART0_C3_REG
#define UARTLP_D_REG UART0_D_REG
#define UARTLP_MA1_REG UART0_MA1_REG
#define UARTLP_MA2_REG UART0_MA2_REG
#define UARTLP_C4_REG UART0_C4_REG
#define UARTLP_C5_REG UART0_C5_REG
#define UARTLP_BDH_SBR_MASK UART0_BDH_SBR_MASK
#define UARTLP_BDH_SBR_SHIFT UART0_BDH_SBR_SHIFT
#define UARTLP_BDH_SBR(x) UART0_BDH_SBR(x)
#define UARTLP_BDH_SBNS_MASK UART0_BDH_SBNS_MASK
#define UARTLP_BDH_SBNS_SHIFT UART0_BDH_SBNS_SHIFT
#define UARTLP_BDH_RXEDGIE_MASK UART0_BDH_RXEDGIE_MASK
#define UARTLP_BDH_RXEDGIE_SHIFT UART0_BDH_RXEDGIE_SHIFT
#define UARTLP_BDH_LBKDIE_MASK UART0_BDH_LBKDIE_MASK
#define UARTLP_BDH_LBKDIE_SHIFT UART0_BDH_LBKDIE_SHIFT
#define UARTLP_BDL_SBR_MASK UART0_BDL_SBR_MASK
#define UARTLP_BDL_SBR_SHIFT UART0_BDL_SBR_SHIFT
#define UARTLP_BDL_SBR(x) UART0_BDL_SBR(x)
#define UARTLP_C1_PT_MASK UART0_C1_PT_MASK
#define UARTLP_C1_PT_SHIFT UART0_C1_PT_SHIFT
#define UARTLP_C1_PE_MASK UART0_C1_PE_MASK
#define UARTLP_C1_PE_SHIFT UART0_C1_PE_SHIFT
#define UARTLP_C1_ILT_MASK UART0_C1_ILT_MASK
#define UARTLP_C1_ILT_SHIFT UART0_C1_ILT_SHIFT
#define UARTLP_C1_WAKE_MASK UART0_C1_WAKE_MASK
#define UARTLP_C1_WAKE_SHIFT UART0_C1_WAKE_SHIFT
#define UARTLP_C1_M_MASK UART0_C1_M_MASK
#define UARTLP_C1_M_SHIFT UART0_C1_M_SHIFT
#define UARTLP_C1_RSRC_MASK UART0_C1_RSRC_MASK
#define UARTLP_C1_RSRC_SHIFT UART0_C1_RSRC_SHIFT
#define UARTLP_C1_DOZEEN_MASK UART0_C1_DOZEEN_MASK
#define UARTLP_C1_DOZEEN_SHIFT UART0_C1_DOZEEN_SHIFT
#define UARTLP_C1_LOOPS_MASK UART0_C1_LOOPS_MASK
#define UARTLP_C1_LOOPS_SHIFT UART0_C1_LOOPS_SHIFT
#define UARTLP_C2_SBK_MASK UART0_C2_SBK_MASK
#define UARTLP_C2_SBK_SHIFT UART0_C2_SBK_SHIFT
#define UARTLP_C2_RWU_MASK UART0_C2_RWU_MASK
#define UARTLP_C2_RWU_SHIFT UART0_C2_RWU_SHIFT
#define UARTLP_C2_RE_MASK UART0_C2_RE_MASK
#define UARTLP_C2_RE_SHIFT UART0_C2_RE_SHIFT
#define UARTLP_C2_TE_MASK UART0_C2_TE_MASK
#define UARTLP_C2_TE_SHIFT UART0_C2_TE_SHIFT
#define UARTLP_C2_ILIE_MASK UART0_C2_ILIE_MASK
#define UARTLP_C2_ILIE_SHIFT UART0_C2_ILIE_SHIFT
#define UARTLP_C2_RIE_MASK UART0_C2_RIE_MASK
#define UARTLP_C2_RIE_SHIFT UART0_C2_RIE_SHIFT
#define UARTLP_C2_TCIE_MASK UART0_C2_TCIE_MASK
#define UARTLP_C2_TCIE_SHIFT UART0_C2_TCIE_SHIFT
#define UARTLP_C2_TIE_MASK UART0_C2_TIE_MASK
#define UARTLP_C2_TIE_SHIFT UART0_C2_TIE_SHIFT
#define UARTLP_S1_PF_MASK UART0_S1_PF_MASK
#define UARTLP_S1_PF_SHIFT UART0_S1_PF_SHIFT
#define UARTLP_S1_FE_MASK UART0_S1_FE_MASK
#define UARTLP_S1_FE_SHIFT UART0_S1_FE_SHIFT
#define UARTLP_S1_NF_MASK UART0_S1_NF_MASK
#define UARTLP_S1_NF_SHIFT UART0_S1_NF_SHIFT
#define UARTLP_S1_OR_MASK UART0_S1_OR_MASK
#define UARTLP_S1_OR_SHIFT UART0_S1_OR_SHIFT
#define UARTLP_S1_IDLE_MASK UART0_S1_IDLE_MASK
#define UARTLP_S1_IDLE_SHIFT UART0_S1_IDLE_SHIFT
#define UARTLP_S1_RDRF_MASK UART0_S1_RDRF_MASK
#define UARTLP_S1_RDRF_SHIFT UART0_S1_RDRF_SHIFT
#define UARTLP_S1_TC_MASK UART0_S1_TC_MASK
#define UARTLP_S1_TC_SHIFT UART0_S1_TC_SHIFT
#define UARTLP_S1_TDRE_MASK UART0_S1_TDRE_MASK
#define UARTLP_S1_TDRE_SHIFT UART0_S1_TDRE_SHIFT
#define UARTLP_S2_RAF_MASK UART0_S2_RAF_MASK
#define UARTLP_S2_RAF_SHIFT UART0_S2_RAF_SHIFT
#define UARTLP_S2_LBKDE_MASK UART0_S2_LBKDE_MASK
#define UARTLP_S2_LBKDE_SHIFT UART0_S2_LBKDE_SHIFT
#define UARTLP_S2_BRK13_MASK UART0_S2_BRK13_MASK
#define UARTLP_S2_BRK13_SHIFT UART0_S2_BRK13_SHIFT
#define UARTLP_S2_RWUID_MASK UART0_S2_RWUID_MASK
#define UARTLP_S2_RWUID_SHIFT UART0_S2_RWUID_SHIFT
#define UARTLP_S2_RXINV_MASK UART0_S2_RXINV_MASK
#define UARTLP_S2_RXINV_SHIFT UART0_S2_RXINV_SHIFT
#define UARTLP_S2_MSBF_MASK UART0_S2_MSBF_MASK
#define UARTLP_S2_MSBF_SHIFT UART0_S2_MSBF_SHIFT
#define UARTLP_S2_RXEDGIF_MASK UART0_S2_RXEDGIF_MASK
#define UARTLP_S2_RXEDGIF_SHIFT UART0_S2_RXEDGIF_SHIFT
#define UARTLP_S2_LBKDIF_MASK UART0_S2_LBKDIF_MASK
#define UARTLP_S2_LBKDIF_SHIFT UART0_S2_LBKDIF_SHIFT
#define UARTLP_C3_PEIE_MASK UART0_C3_PEIE_MASK
#define UARTLP_C3_PEIE_SHIFT UART0_C3_PEIE_SHIFT
#define UARTLP_C3_FEIE_MASK UART0_C3_FEIE_MASK
#define UARTLP_C3_FEIE_SHIFT UART0_C3_FEIE_SHIFT
#define UARTLP_C3_NEIE_MASK UART0_C3_NEIE_MASK
#define UARTLP_C3_NEIE_SHIFT UART0_C3_NEIE_SHIFT
#define UARTLP_C3_ORIE_MASK UART0_C3_ORIE_MASK
#define UARTLP_C3_ORIE_SHIFT UART0_C3_ORIE_SHIFT
#define UARTLP_C3_TXINV_MASK UART0_C3_TXINV_MASK
#define UARTLP_C3_TXINV_SHIFT UART0_C3_TXINV_SHIFT
#define UARTLP_C3_TXDIR_MASK UART0_C3_TXDIR_MASK
#define UARTLP_C3_TXDIR_SHIFT UART0_C3_TXDIR_SHIFT
#define UARTLP_C3_R9T8_MASK UART0_C3_R9T8_MASK
#define UARTLP_C3_R9T8_SHIFT UART0_C3_R9T8_SHIFT
#define UARTLP_C3_R8T9_MASK UART0_C3_R8T9_MASK
#define UARTLP_C3_R8T9_SHIFT UART0_C3_R8T9_SHIFT
#define UARTLP_D_R0T0_MASK UART0_D_R0T0_MASK
#define UARTLP_D_R0T0_SHIFT UART0_D_R0T0_SHIFT
#define UARTLP_D_R1T1_MASK UART0_D_R1T1_MASK
#define UARTLP_D_R1T1_SHIFT UART0_D_R1T1_SHIFT
#define UARTLP_D_R2T2_MASK UART0_D_R2T2_MASK
#define UARTLP_D_R2T2_SHIFT UART0_D_R2T2_SHIFT
#define UARTLP_D_R3T3_MASK UART0_D_R3T3_MASK
#define UARTLP_D_R3T3_SHIFT UART0_D_R3T3_SHIFT
#define UARTLP_D_R4T4_MASK UART0_D_R4T4_MASK
#define UARTLP_D_R4T4_SHIFT UART0_D_R4T4_SHIFT
#define UARTLP_D_R5T5_MASK UART0_D_R5T5_MASK
#define UARTLP_D_R5T5_SHIFT UART0_D_R5T5_SHIFT
#define UARTLP_D_R6T6_MASK UART0_D_R6T6_MASK
#define UARTLP_D_R6T6_SHIFT UART0_D_R6T6_SHIFT
#define UARTLP_D_R7T7_MASK UART0_D_R7T7_MASK
#define UARTLP_D_R7T7_SHIFT UART0_D_R7T7_SHIFT
#define UARTLP_MA1_MA_MASK UART0_MA1_MA_MASK
#define UARTLP_MA1_MA_SHIFT UART0_MA1_MA_SHIFT
#define UARTLP_MA1_MA(x) UART0_MA1_MA(x)
#define UARTLP_MA2_MA_MASK UART0_MA2_MA_MASK
#define UARTLP_MA2_MA_SHIFT UART0_MA2_MA_SHIFT
#define UARTLP_MA2_MA(x) UART0_MA2_MA(x)
#define UARTLP_C4_OSR_MASK UART0_C4_OSR_MASK
#define UARTLP_C4_OSR_SHIFT UART0_C4_OSR_SHIFT
#define UARTLP_C4_OSR(x) UART0_C4_OSR(x)
#define UARTLP_C4_M10_MASK UART0_C4_M10_MASK
#define UARTLP_C4_M10_SHIFT UART0_C4_M10_SHIFT
#define UARTLP_C4_MAEN2_MASK UART0_C4_MAEN2_MASK
#define UARTLP_C4_MAEN2_SHIFT UART0_C4_MAEN2_SHIFT
#define UARTLP_C4_MAEN1_MASK UART0_C4_MAEN1_MASK
#define UARTLP_C4_MAEN1_SHIFT UART0_C4_MAEN1_SHIFT
#define UARTLP_C5_RESYNCDIS_MASK UART0_C5_RESYNCDIS_MASK
#define UARTLP_C5_RESYNCDIS_SHIFT UART0_C5_RESYNCDIS_SHIFT
#define UARTLP_C5_BOTHEDGE_MASK UART0_C5_BOTHEDGE_MASK
#define UARTLP_C5_BOTHEDGE_SHIFT UART0_C5_BOTHEDGE_SHIFT
#define UARTLP_C5_RDMAE_MASK UART0_C5_RDMAE_MASK
#define UARTLP_C5_RDMAE_SHIFT UART0_C5_RDMAE_SHIFT
#define UARTLP_C5_TDMAE_MASK UART0_C5_TDMAE_MASK
#define UARTLP_C5_TDMAE_SHIFT UART0_C5_TDMAE_SHIFT
#define UARTLP_BASES UARTLP_BASES
#define NV_FOPT_EZPORT_DIS_MASK This_symbol_has_been_deprecated
#define NV_FOPT_EZPORT_DIS_SHIFT This_symbol_has_been_deprecated
#define ADC_BASES ADC_BASE_PTRS
#define CMP_BASES CMP_BASE_PTRS
#define CRC_BASES CRC_BASE_PTRS
#define DAC_BASES DAC_BASE_PTRS
#define DMA_BASES DMA_BASE_PTRS
#define DMAMUX_BASES DMAMUX_BASE_PTRS
#define FPTA_BASE_PTR FGPIOA_BASE_PTR
#define FPTA_BASE FGPIOA_BASE
#define FPTA FGPIOA
#define FPTB_BASE_PTR FGPIOB_BASE_PTR
#define FPTB_BASE FGPIOB_BASE
#define FPTB FGPIOB
#define FTFA_BASES FTFA_BASE_PTRS
#define PTA_BASE_PTR GPIOA_BASE_PTR
#define PTA_BASE GPIOA_BASE
#define PTA GPIOA
#define PTB_BASE_PTR GPIOB_BASE_PTR
#define PTB_BASE GPIOB_BASE
#define PTB GPIOB
#define GPIO_BASES GPIO_BASE_PTRS
#define I2C_BASES I2C_BASE_PTRS
#define LLWU_BASES LLWU_BASE_PTRS
#define LPTMR_BASES LPTMR_BASE_PTRS
#define MCG_BASES MCG_BASE_PTRS
#define MCM_BASES MCM_BASE_PTRS
#define MTB_BASES MTB_BASE_PTRS
#define MTBDWT_BASES MTBDWT_BASE_PTRS
#define NV_BASES NV_BASE_PTRS
#define OSC_BASES OSC_BASE_PTRS
#define PIT_BASES PIT_BASE_PTRS
#define PMC_BASES PMC_BASE_PTRS
#define PORT_BASES PORT_BASE_PTRS
#define RCM_BASES RCM_BASE_PTRS
#define ROM_BASES ROM_BASE_PTRS
#define RTC_BASES RTC_BASE_PTRS
#define SIM_BASES SIM_BASE_PTRS
#define SMC_BASES SMC_BASE_PTRS
#define SPI_BASES SPI_BASE_PTRS
#define TPM_BASES TPM_BASE_PTRS
#define UART0_BASES UART0_BASE_PTRS
#define UART_BASES UART_BASE_PTRS
#define LPTimer_IRQn LPTMR0_IRQn
#define LPTimer_IRQHandler LPTMR0_IRQHandler
#define LLW_IRQn LLWU_IRQn
#define LLW_IRQHandler LLWU_IRQHandler
# 16 "../hal/mcu/NXP_KL05/include/InterruptFunc.h" 2
# 25 "../hal/mcu/NXP_KL05/include/InterruptFunc.h"
#define NVIC_NUM_VECTORS ((uint8_t)(16u + 32u))
#define NVIC_USER_IRQ_OFFSET ((uint8_t)16u)
#define NUMBER_CORE_VECS ((uint8_t)16u)

typedef uint8_t IntEdge;


#define INT_NONE ((IntEdge)0x0u)
#define INT_FALL ((IntEdge)0xAu)
#define INT_RISE ((IntEdge)0x9u)
#define INT_EITHEREDGE ((IntEdge)0xBu)
#define INT_ZERO ((IntEdge)0x8u)
#define INT_ONE ((IntEdge)0xCu)
# 61 "../hal/mcu/NXP_KL05/include/InterruptFunc.h"
typedef uint8_t interruptEvent;

typedef void
(*FuncPtr)( void );

typedef uint8_t IRQIndex;

typedef enum IRQIndices
{
    zeroIRQ = (IRQIndex) 0x0u,
# 80 "../hal/mcu/NXP_KL05/include/InterruptFunc.h"
    TPM0_IRQ_INDEX,
    TPM1_IRQ_INDEX,




    PIT_IRQ_INDEX,
    LPTMR0_IRQ_INDEX,
    PORTA_IRQ_INDEX,
    PORTB_IRQ_INDEX
} IRQIndexEnum;




void installIrq( FuncPtr func, uint8_t module, uint8_t entity );




void deinstallIrq( IRQIndex module, uint8_t entity );
# 111 "../hal/mcu/NXP_KL05/include/InterruptFunc.h"
void TPM0_IRQHandler( void );

void TPM1_IRQHandler( void );





void PIT_IRQHandler( void );
void LPTMR0_IRQHandler( void );
void PORTA_IRQHandler( void );
void PORTB_IRQHandler( void );
void setSensingForPin( const uint16_t pin, const interruptEvent sensing );
# 137 "../hal/mcu/NXP_KL05/include/InterruptFunc.h"
#define enableIRQ(irqNr) NVIC_ClearPendingIRQ( irqNr ); NVIC_EnableIRQ( irqNr )
# 151 "../hal/mcu/NXP_KL05/include/InterruptFunc.h"
#define disableIRQ(irqNr) NVIC_DisableIRQ( irqNr )
# 165 "../hal/mcu/NXP_KL05/include/InterruptFunc.h"
#define clearPending(irqNr) NVIC_ClearPendingIRQ( irqNr )
# 181 "../hal/mcu/NXP_KL05/include/InterruptFunc.h"
#define setIRQPrio(irqNr,prio) NVIC_SetPriority( irqNr, prio )
# 10 "../source/R_RTOS/R_RTOS_timer.c" 2

# 1 "../include/R_RTOS_timer.h" 1
# 10 "../include/R_RTOS_timer.h"
#define HEADERS_R_RTOS_TIMER_H_ 

# 1 "../include/R_RTOS_inc.h" 1
# 10 "../include/R_RTOS_inc.h"
#define HEADERS_R_RTOS_INC_H_ 
# 33 "../include/R_RTOS_inc.h"
#undef NULL





#define NULL ((void *)0x0u)






#define ABS(x) (((x)<0) ? (-1*(x)) : (x))





#define MIN_STACK_SIZE ((StackSize)0x40u)




#define MY_STACK_SIZE ((StackSize)0x80u)




#define IDLE_TSK_STACK_SIZE ((StackSize)0x60u)



#define STACK_BLOCK_SIZE ((uint8_t)0x4u)
# 75 "../include/R_RTOS_inc.h"
#define AMOUNT_OF_MSGQ (QID)(0x3u)




#define MSGQ_TSK_ID_POS (uint8_t)0x0u



#define MSGQ_SYS_ID_POS (uint8_t)0x1u




#define SYS_ID_MSK (uint16_t)0xFF00u



#define TSK_ID_MSK (uint16_t)0x00FFu







#define AMOUNT_OF_SEMS (uint8_t)0x2u







#define AMOUNT_OF_EVTS (uint8_t)0x6u






#define EVT_QUEUE_SIZE (uint8_t)0x4u
# 126 "../include/R_RTOS_inc.h"
#define SYSTCK_AR_RES (uint8_t)0x8u



#define SYSTCK_AR_RES_MSK (uint8_t)(SYSTCK_AR_RES - (uint8_t)0x1u)
# 144 "../include/R_RTOS_inc.h"
#define TSK_ID_IDLE ((TskID)0x0u)






#define TSK_ID_NO_TSK TSK_ID_IDLE







#define TSK_PRIO_LEVELS_NR (TskPrioLvl)0xFu
# 168 "../include/R_RTOS_inc.h"
#define AMOUNT_SYS_FKT (uint8_t)0x8u





#define SYSFKT_INVALID_SYSFKT_ID (SysFktID)0xFFu
# 195 "../include/R_RTOS_inc.h"
#define OFFSETOF(type,field) ((uint8_t) &(((type *) 0)->field))







#define DATATYPE_IS_PTR(dataType) (uint8_t)( dataType & (uint8_t)0x4u)




#define MAKE_SYS_ID(id) (uint16_t)((uint16_t)((uint8_t)id & (uint8_t)0xFFu) << (uint8_t)0x8u)




#define MAKE_TSK_ID(id) (uint16_t)(uint16_t)((uint8_t)id & (uint8_t)0xFFu)



#define MQ_IS_TSK_ID(id) (uint8_t)((uint16_t)id & (uint16_t)0xFFu)
# 230 "../include/R_RTOS_inc.h"
#define CREATE_EVT_MSK(evtNr) (EVTQSlots)((EVTQSlots)0x1u << evtNr)
# 241 "../include/R_RTOS_inc.h"
#define TSK_GETSTATE(pTsk) (TskState)(pTsk->tskState)




#define TSK_STATE_IS_ERROR(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_ERROR)




#define TSK_STATE_IS_ACTIVE(pTsk) (TskState)(TSK_GETSTATE(pTsk) & TSK_STATE_ACTIVE)




#define TSK_STATE_IS_ACTIVE_RUNNING(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_ACTIVE_RUNNING )



#define TSK_STATE_IS_ACTIVE_SUSPENDED(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_ACTIVE_SUSPENDED )



#define TSK_STATE_IS_ACTIVE_READY(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_ACTIVE_READY )





#define TSK_STATE_IS_ACTIVE_CRITSEC(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_ACTIVE_CRITSEC )





#define TSK_STATE_IS_WAITING(pTsk) (TskState)(TSK_GETSTATE(pTsk) & TSK_STATE_WAITING)



#define TSK_STATE_IS_WAITING_TMR(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_WAITING_TMR)



#define TSK_STATE_IS_WAITING_MSGRCV(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_WAITING_MSGRCV)



#define TSK_STATE_IS_WAITING_MSGSND(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_WAITING_MSGSND)



#define TSK_STATE_IS_WAITING_EVT(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_WAITING_EVT)



#define TSK_STATE_IS_WAITING_SEM(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_WAITING_SEM)



#define TSK_STATE_IS_WAITING_MNTR(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_WAITING_MNTR)






#define TSK_STATE_IS_UNINIT(pTsk) (TskState)(TSK_GETSTATE(pTsk) & TSK_STATE_UNINIT)



#define TSK_STATE_IS_UNINIT_UNINIT(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_UNINIT_UNINIT)



#define TSK_STATE_IS_UNINIT_FAILED(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_UNINIT_FAILED)



#define TSK_STATE_IS_UNINIT_ENDED(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_UNINIT_ENDED)
# 351 "../include/R_RTOS_inc.h"
typedef void (*FktCall)( void );




typedef void (*FktCallOneArg)( void * );




typedef uint8_t SysFktID;





typedef uint16_t StackSize;




typedef uint32_t StackTypeT;





typedef StackTypeT *StackPtrT;






typedef uint8_t DataSize;



typedef uint32_t *Data;





typedef uint8_t QPrio;





typedef void (*CallBackOnDataRecv)( Data );




typedef uint8_t QID;




typedef uint8_t MsgCntr;
# 422 "../include/R_RTOS_inc.h"
typedef union partID
{
    uint16_t fullID;
    uint8_t snglID[2];
} PartID;







typedef uint8_t SemNr;




typedef uint8_t MtxNr;




typedef uint8_t SemCntr;







typedef uint8_t EvtNr;




typedef uint32_t EvtMsk;



typedef uint32_t EVTQSlots;







typedef uint16_t WaitTime;




typedef uint32_t SysTime;




typedef uint8_t SysTicks;




typedef uint16_t TmrTime;




typedef uint32_t LifeTime;






typedef uint8_t TskID;





typedef uint8_t TskPrioLvl;




typedef uint8_t tskStateT;




typedef FktCall TskStartAddr;




typedef FktCall TskEndAddr;
# 530 "../include/R_RTOS_inc.h"
typedef uint8_t SyncEleID;
# 593 "../include/R_RTOS_inc.h"
typedef enum mntrAccssType
{
    MNTR_ACCESS_NONE = (uint8_t) 0x0u,
    MNTR_ACCESS_READ = (uint8_t) 0x1u,
    MNTR_ACCESS_WRITE = (uint8_t) 0x2u,
    MNTR_ACCESS_DELETE = (uint8_t) 0x4u,
    MNTR_ACCESS_MODIFY = (uint8_t) 0x8u
} ACCSSType;






typedef enum dataTypes
{
    DataT_Undef = (uint8_t) 0x0u,
    DataT_Int = (uint8_t) 0x1u,
    DataT_Ptr = (uint8_t) 0x4u,
    DataT_Int_Ptr,
    DataT_String,
    DataT_FunCall = (uint8_t) 0x8u
} DataType;
# 631 "../include/R_RTOS_inc.h"
typedef enum timerTypeEn
{
    SysTimerType = (uint8_t) 0x0u,
    TskTimerType = (uint8_t) 0x1u,
    SysTickTimerType = (uint8_t) 0x2u
} TimerType;
# 647 "../include/R_RTOS_inc.h"
typedef enum tskPrio
{
    TSK_PRIO_ERROR = (TskPrioLvl) 0x0u,
    TSK_PRIO_LOWEST = (TskPrioLvl) 0x1u,
    TSK_PRIO_LOWER,
    TSK_PRIO_LOW,
    TSK_PRIO_MED,
    TSK_PRIO_ABOVMED,
    TSK_PRIO_HIG,
    TSK_PRIO_HIGHER,
    TSK_PRIO_HIGHEST,
    TSK_PRIO_ULT,
    TSK_PRIO_IDLE = (TskPrioLvl) 0xFu
} TskPrio;







typedef enum evtType
{
    EvtTMR = (uint8_t) 0x21u,
    EvtMSGRCV = (uint8_t) 0x22u,
    EvtMSGSND = (uint8_t) 0x24u,
    EvtEVT = (uint8_t) 0x41u,
    EvtSEM = (uint8_t) 0x42u,
    EvtMNTR = (uint8_t) 0x48u
} EvtType;
# 709 "../include/R_RTOS_inc.h"
typedef enum tskState
{
    TSK_STATE_ERROR = (tskStateT) 0x00u,
    TSK_STATE_ACTIVE = ( (tskStateT) 0x10u ),
    TSK_STATE_ACTIVE_RUNNING = ( (tskStateT) 0x11u ),
    TSK_STATE_ACTIVE_SUSPENDED = ( (tskStateT) 0x12u ),
    TSK_STATE_ACTIVE_READY = ( (tskStateT) 0x14u ),
    TSK_STATE_ACTIVE_CRITSEC = ( (tskStateT) 0x18u ),
    TSK_STATE_WAITING_MSGNG = (tskStateT) 0x20u,
    TSK_STATE_WAITING_MSGRCV = (tskStateT) 0x21u,
    TSK_STATE_WAITING_MSGSND = (tskStateT) 0x22u,
    TSK_STATE_WAITING_SYNC = (tskStateT) 0x40u,
    TSK_STATE_WAITING_TMR = (tskStateT) 0x41u,
    TSK_STATE_WAITING_EVT = (tskStateT) 0x42u,
    TSK_STATE_WAITING_SEM = (tskStateT) 0x43u,
    TSK_STATE_WAITING_MNTR = (tskStateT) 0x44u,
    TSK_STATE_WAITING = (tskStateT) 0x60u,
    TSK_STATE_UNINIT = (tskStateT) 0x80u,
    TSK_STATE_UNINIT_UNINIT = (tskStateT) 0x81u,
    TSK_STATE_UNINIT_FAILED = (tskStateT) 0x82u,
    TSK_STATE_UNINIT_ENDED = (tskStateT) 0x88u,
} TskState;







typedef enum tskSettings
{
    TskSet_NONE = (uint8_t) 0x00u,
    TskSet_Periodic = (uint8_t) 0x01u,
    TskSet_OneShot = (uint8_t) 0x02u,
    TskSet_DUMMY_0 = (uint8_t) 0x04u,
    TskSet_DUMMY_1 = (uint8_t) 0x08u,
    TskSet_DUMMY_2 = (uint8_t) 0x10u,
    TskSet_DUMMY_3 = (uint8_t) 0x20u,
    TskSet_DUMMY_4 = (uint8_t) 0x40u,
    TskSet_DUMMY_5 = (uint8_t) 0x80u
} TskSettings;
# 762 "../include/R_RTOS_inc.h"
typedef enum syncEleType
{
    SyncEle_TYPE_NOID = (uint8_t) 0x0u,
    SyncEle_TYPE_TMR = (uint8_t) 0x1u,
    SyncEle_TYPE_EVT = (uint8_t) 0x2u,
    SyncEle_TYPE_SEM = (uint8_t) 0x3u,
    SyncEle_TYPE_BinSEM = (uint8_t) 0x3u,
    SyncEle_TYPE_CntSEM = (uint8_t) 0x4u,
    SyncEle_TYPE_MTX = (uint8_t) 0x5u,
    SyncEle_TYPE_MNTR = (uint8_t) 0x6u
} SyncEleType;
# 797 "../include/R_RTOS_inc.h"
typedef enum sysTckObjTypeEnum
{
    SysTckObj_Err = (uint8_t) 0x0u,
    SysTckObj_Tsk = (uint8_t) 0x10u,
    SysTckObj_TskBlck = (uint8_t) 0x11u,
    SysTckObj_TskWait = (uint8_t) 0x12u,
    SysTckObj_SysFkt = (uint8_t) 0x20u,
    SysTckObj_SysFktBlck = (uint8_t) 0x21u,
    SysTckObj_SysFktWait = (uint8_t) 0x22u,
} SysTckEleType;
# 816 "../include/R_RTOS_inc.h"
typedef union sysTickEleIDUnion
{
    TskID tskID;
    SysFktID sysFktID;
} SysTickEleID;
# 831 "../include/R_RTOS_inc.h"
typedef struct sysTickTMRStruc
{
    struct sysTickTMRStruc * nxtSysTickTMR;
    struct sysTickTMRStruc * prvSysTickTMR;
    SysTckEleType sysTckObjType;
    SysTickEleID sysTckObjID;
    SysTicks remSysTicks;
    SysTicks insrtnSysTicksTime;
} SysTickTMR, *PSysTickTMR;






typedef const uint32_t * CData;



typedef CData *PCData;
# 870 "../include/R_RTOS_inc.h"
typedef struct mqData
{
    CData data;
    PartID pubID;
    DataType dataType;
    DataSize dataSize;
} MQData, *PMQData;
# 888 "../include/R_RTOS_inc.h"
typedef struct msgQMsgProvStruc
{
    QID msgQID;
    volatile MsgCntr msgsNew;
} MsgQMsgProv, *PMsgQMsgProv;





typedef uint8_t MsgID;
# 913 "../include/R_RTOS_inc.h"
typedef struct tskMsgProvStruc
{
    volatile TskID tskProvID;
    volatile MsgID msgID;
} TskMsgProv, *PTskMsgProv;
# 933 "../include/R_RTOS_inc.h"
typedef struct sysMsgProvStruc
{
    volatile SysFktID sysProvID;
    volatile MsgID msgID;
} SysMsgProv, *PSysMsgProv;

typedef struct dummyMsgProvStruc
{
    uint8_t dummyID;
    uint8_t dummyDummy;
} DummyMsgProv, *PDummyMsgProv;
# 953 "../include/R_RTOS_inc.h"
typedef enum msgProvTypeEnum
{
    MsgQ_Prov = (uint8_t) 0x0u,
    Tsk_Prov = (uint8_t) 0x1u,
    Sys_Prov = (uint8_t) 0x2u,
    Dummy_Prov = (uint8_t) 0xFFu
} MsgProvType;
# 970 "../include/R_RTOS_inc.h"
typedef union msgPrvdrsUnion
{
    MsgQMsgProv msgQMsgProv;
    TskMsgProv tskMsgProv;
    SysMsgProv sysMsgProv;
    DummyMsgProv dummyMsgProv;
} MsgPrvdrs, *PMsgPrvdrs;
# 991 "../include/R_RTOS_inc.h"
typedef struct tskMailBox
{
    volatile struct tskMailBox *nxtTskMB;


    uint8_t dummyByte;
    MsgProvType msgProvType;
    MsgPrvdrs msgProv;
} TskMB, *PTskMB;
# 1013 "../include/R_RTOS_inc.h"
typedef struct tmrFktCallStruc
{
    FktCall sysFktCall;
    LifeTime expirationTime;
    TmrTime reloadTime;
    SysFktID nxtFktCall;
    SysFktID fktID;
} TmrFktCall, *PTmrFktCall;
# 1030 "../include/R_RTOS_inc.h"
typedef struct sysTckFktCallstruc
{
    FktCall sysFktCall;
    volatile PSysTickTMR sysTckTmr;
    SysTicks reloadTime;
    uint8_t dummy8;
    uint16_t dummy16;
} SysTckFktCall, *PSysTckFktCall;
# 1047 "../include/R_RTOS_inc.h"
typedef struct msgFktCallStruc
{
    FktCallOneArg sysFktCall;
    MsgPrvdrs msgProv;
    MsgProvType msgProvType;
} MsgFktCall, *PMsgFktCall;
# 1063 "../include/R_RTOS_inc.h"
typedef struct dummyFktCallStruc
{
    void * sysFktCall;
    uint32_t dummy32;
    uint16_t dummy16;
    uint8_t dummy8_1;
    uint8_t dummy8_2;
} DummyFktCall, *PDummyFktCall;
# 1084 "../include/R_RTOS_inc.h"
typedef struct sysFkt
{

    union
    {
        TmrFktCall tmrFktCall;
        SysTckFktCall sysTckFktCall;
        MsgFktCall msgFktCall;
        DummyFktCall dummyfktCall;
    } fktCallType;
} SysFkt, *PSysFkt;




typedef enum semTypeEnum
{
    SemBin = (uint8_t)0x0u,
    SemCnt = (uint8_t)0x1u
}SemType;
# 1116 "../include/R_RTOS_inc.h"
typedef struct semStruc
{
    TskID semQStrtTskID;
    TskPrio svdTskPrio;
    SemType semType;
    union
    {
        SemCntr semCntrSig;
        SemCntr semBinSig;
    }semSignal;
} Sem, *PSem;

typedef struct mtxStruc
{
    TskID mtxQStrtTskID;
    TskID mtxOccTskID;
    TskPrio svdTskPrio;
    uint8_t isOcc;
}Mtx, *PMtx;
# 1151 "../include/R_RTOS_inc.h"
typedef struct evtStruc
{
    EVTQSlots evtQ_Slots;
    TskID evtObjs[(uint8_t)0x4u ];
} Evt, *PEvt;
# 1169 "../include/R_RTOS_inc.h"
typedef struct sysTimerStruc
{
    SysFktID sysFktIDQStrt;
} SysTimer, *PSysTimer;
# 1182 "../include/R_RTOS_inc.h"
typedef struct tskTimerStruc
{
    TskID tskIDQStrt;
} TskTimer, *PTskTimer;
# 1196 "../include/R_RTOS_inc.h"
typedef struct timerStruc
{
    LifeTime expirationTime;
    TimerType timerType;
    union
    {
        SysTimer sysTimer;
        TskTimer tskTimer;
    } specTimer;
} Timer, *PTimer;
# 1239 "../include/R_RTOS_inc.h"
typedef struct syncEleStruc
{
    SyncEleType syncEleType;
    SyncEleID syncEleID;


    union multipurposeByte
    {
        ACCSSType mntrAccssType;
        uint8_t someDummy;
    } MultiPurposeByte;

    union syncEleHandle
    {

        struct evtSyncEle
        {
            EvtMsk evtMsk;
        } EvtSyncEle;

        struct tmrSyncEle
        {
            LifeTime expireTime;
        } TmrSyncEle;

        struct semSyncEle
        {
            uint8_t dummy1;
            uint8_t dummy2;
            uint8_t dummy3;
            uint8_t dummy4;
        } SemSyncEle;
        struct mtxSyncEle
        {
            uint8_t dummy1;
            uint8_t dummy2;
            uint8_t dummy3;
            uint8_t dummy4;
        };

        struct mntrSyncEle
        {

        } MntrSyncEle;
    } SyncEleHandle;
} SyncEle, *PSyncEle;
# 1301 "../include/R_RTOS_inc.h"
typedef struct tskTCB
{
            volatile StackPtrT pStckPtr;
            StackPtrT pStckTop;

            TskStartAddr pTskStrt;
            TskEndAddr pTskEnd;

            volatile PTskMB tskMailBox;

            volatile PSysTickTMR sysTckTmr;
            volatile PSyncEle tskSync;

            StackSize stckSze;

            volatile TskSettings tskSets;

            volatile TskPrio tskPrio;
            volatile TskState tskState;

            TskID tskID;
            volatile TskID nxtTsk;
            volatile TskID prvTsk;
} TskTCB, *PTskTCB;
# 1373 "../include/R_RTOS_inc.h"
#define TIME_SLICE_AMOUNT (uint16_t)500u




#define NR_OF_TSKS ((uint8_t)0xBu)






#define MAX_TASKS NR_OF_TSKS


#define NR_OF_MEMPOOLS (uint8_t)0x5u
# 1397 "../include/R_RTOS_inc.h"
typedef uint8_t OsCode;




#define OS_FULL_DISPATCH ((OsCode)0x2u)




#define OS_DISPATCH_NEEDED ((OsCode)0x1u)




typedef uint8_t RetCode;



#define RET_NOK ((RetCode)0x0u)



#define RET_OK ((RetCode)0x1u)



#define RET_MEM_ALLOC_FAIL_TCB ((RetCode)0x1Au)



#define RET_MEM_ALLOC_FAIL_STACK ((RetCode)0x1Cu)



#define RET_TSK_TOO_MANY ((RetCode)0x2Fu)



#define RET_TSK_NO_IDLE_TSK ((RetCode)0x20u)



#define RET_TSK_CONFLICTING_IDLE_TSK ((RetCode)0x21u)



#define RET_TSK_STILL_RUNNING ((RetCode)0x24u)



#define RET_TSK_IS_ABOUT_TO_RUN ((RetCode)0x25u)



#define RET_STCK_ERR_FULL ((RetCode)0x3Fu)



#define RET_STCK_ERR_EMPTY ((RetCode)0x30u)



#define RET_STCK_ERR_INDEX_OVERFLOW ((RetCode)0x31u)



#define RET_STCK_ERR_INDEX_UNDERFLOW ((RetCode)0x32u)



#define RET_STCK_NO_STCKELEM_PTR ((RetCode)0x33u)



#define RET_STCK_NO_STCKPTR ((RetCode)0x34u)





typedef uint16_t MemSize;
# 1491 "../include/R_RTOS_inc.h"
typedef struct gStruc_OS_FLAGS
{
    volatile uint8_t g_DispatchFlag :2;
    volatile uint8_t g_needsScheduling :1;
    volatile uint8_t g_tskCriticalExecution :1;
    volatile uint8_t gLPExit :1;
    volatile uint8_t gWokenUp :1;
} BitsOSFlags;
# 1510 "../include/R_RTOS_inc.h"
typedef enum svcCode
{
    SVC_OS_START = (uint8_t) 0x0u,
    SVC_TSK_INIT,
    SVC_TSK_SETPRIO,
    SVC_TSK_ACTV,
    SVC_TSK_KILL,
    SVC_TSK_SET_CRIT,
    SVC_TSK_RESET_CRIT,
    SVC_MTX_TAKE,
    SVC_MTX_GIVE,
    SVC_SEM_TAKE,
    SVC_SEM_GIVE,
    SVC_EVT_SEND,
    SVC_EVT_RECV,
    SVC_TMR_SET,
    SVC_SYSTCK_SET,
    SVC_MSGQ_CRT_Q,
    SVC_MSGQ_DEL_Q,
    SVC_MSGQ_REG_PUB,
    SVC_MSGQ_REG_TSK_SUB,
    SVC_MSGQ_REG_SYS_SUB,
    SVC_MSGQ_MSG_PUB,
    SVC_MSGQ_MSG_READ,
    SVC_MSGQ_MSG_READALLNEW,
    SVC_MSGQ_MSG_READALL,
    SVC_MSGQ_MSG_TAKE,
    SVC_MSGQ_MSG_TAKEALLNEW,
    SVC_MSGQ_MSG_TAKEALL,
    SVC_OS_SCHEDULE,
    SVC_CALL_FKT_PRIV,
    SVC_LP_ENTER,
    SVC_TRC_OUPUT,
    SVC_OS_ERROR = (uint8_t) 0xFFu,
} SVCCode;
# 13 "../include/R_RTOS_timer.h" 2

#define MEM_OBJECTS_TMR (uint8_t)0x5u

#define TMR_INVALID_TIME (LifeTime)0xFFFFFFFFu
# 26 "../include/R_RTOS_timer.h"
#define TMR_PIT_DELAY (uint32_t)0x3u
# 36 "../include/R_RTOS_timer.h"
RetCode tmr_INIT( void );
# 50 "../include/R_RTOS_timer.h"
RetCode tmr_setTskTimer( PTskTCB tsk, TmrTime msToWait );

RetCode tmr_setSysTimer( SysFktID fktID, TmrTime msToWait, uint8_t periodicity );

void tmr_SysTimerElapsed( void );
# 66 "../include/R_RTOS_timer.h"
void tmr_TskTimerElapsed( void );
# 80 "../include/R_RTOS_timer.h"
RetCode tmr_GiveUpOnTMR( PTskTCB const tsk );
# 12 "../source/R_RTOS/R_RTOS_timer.c" 2

# 1 "../include/R_RTOS_task.h" 1
# 10 "../include/R_RTOS_task.h"
#define HEADERS_R_RTOS_TASK_H_ 



RetCode tsk_initTsks( void );
# 30 "../include/R_RTOS_task.h"
RetCode tsk_tskInit(
                     const TskID tskID,
                     const TskStartAddr const strtAddr,
                     const TskEndAddr const endAddr,
                     const StackSize stkSze );
# 45 "../include/R_RTOS_task.h"
RetCode os_IDLETskInit( const TskStartAddr const strtAddr );
# 59 "../include/R_RTOS_task.h"
RetCode tsk_tskDestroy( PTskTCB const tsk );
# 73 "../include/R_RTOS_task.h"
RetCode tsk_SetEvt( PTskTCB const tsk, PSyncEle const syncEle );
RetCode tsk_ClrEvt( PTskTCB const tsk, PSyncEle const syncEle );

RetCode tsk_SetInactive( PTskTCB const tsk, TskState tskInactvState );
# 88 "../include/R_RTOS_task.h"
RetCode tsk_ActvTsk( PTskTCB const tsk );

RetCode tsk_ChngePrio( PTskTCB const tsk, const TskPrio newTskPrio );
# 14 "../source/R_RTOS/R_RTOS_timer.c" 2
# 1 "../include/R_RTOS_memMngr.h" 1
# 14 "../include/R_RTOS_memMngr.h"
#define HEADERS_R_RTOS_MEMMNGR_H_ 





#define malloc rMalloc



#define calloc rCalloc



#define realloc rRealloc



#define free rFree





typedef uint16_t BlckSize;




#define BLCK_LIMIT ((BlckSize)0x800u)






#define BIGGEST_BLCK ((BlckSize)0x100u)






#define BIGGEST_BLCK_MSK ((BlckSize)(BIGGEST_BLCK - (BlckSize)1u))
# 66 "../include/R_RTOS_memMngr.h"
#define SMALLEST_BLCK ((BlckSize)0x8u)






#define SMALLER_BLCK_MSK ((BlckSize)(SMALLEST_BLCK - (BlckSize)1u))






#define SMALLER_BLCK_DIVISOR (MemIndex)(0x3u)
# 89 "../include/R_RTOS_memMngr.h"
#define CACHE_SIZE ((uint8_t)0x10u)




typedef uint8_t MemPoolID;




typedef uint16_t MemFlags;






typedef void *stdPtr;




typedef uint16_t MemIndex;
# 168 "../include/R_RTOS_memMngr.h"
typedef struct memMngrHead
{
# 191 "../include/R_RTOS_memMngr.h"
    MemFlags flagsForMemBlock;
# 213 "../include/R_RTOS_memMngr.h"
    MemFlags additionalFlags;
    MemIndex nxtMemBlck;
    MemIndex prvMemBlck;


} MemMngrHead;
# 232 "../include/R_RTOS_memMngr.h"
typedef struct memBlckhead
{
# 255 "../include/R_RTOS_memMngr.h"
    MemFlags flagsForMemBlock;
# 277 "../include/R_RTOS_memMngr.h"
    MemFlags additionalFlags;
} MemBlckHead;

#define MEM_MNGR_GET_MEMMNGRHEAD(pointer) ((MemMngrHead *)( (uint32_t) pointer - (uint32_t) sizeof(MemBlckHead)))
#define MEM_MNGR_GET_PTRTOMEM(memMngrPtr) ((void *) ((uint32_t) memMngrPtr + (uint32_t) sizeof(MemBlckHead)))


#define MEM_FLG_PARSE(memFlgs,shft) ((MemFlags)((MemFlags)(memFlgs >> (MemFlags)shft) & (MemFlags)0x1u))
#define MEM_FLG_GET_BIT_MSK(bit) ((MemFlags)((MemFlags)0x1u << (MemFlags)bit))
#define MEM_FLG_GET_STRUC_PFIELD(struc,field) ((struc)->field)
#define MEM_FLG_SET_BIT(pMemMngrHead,bit,whichFlags) MEM_FLG_GET_STRUC_PFIELD(pMemMngrHead, whichFlags) |= MEM_FLG_GET_BIT_MSK(bit)
#define MEM_FLG_CLR_BIT(pMemMngrHead,bit,whichFlags) MEM_FLG_GET_STRUC_PFIELD(pMemMngrHead, whichFlags) &= ((MemFlags)(~MEM_FLG_GET_BIT_MSK(bit)))
#define MEM_FLG_SET_BIT_MSK(pMemMngrHead,msk,whichFlags) MEM_FLG_GET_STRUC_PFIELD(pMemMngrHead, whichFlags) |= (MemFlags)msk
#define MEM_FLG_CLR_BIT_MSK(pMemMngrHead,msk,whichFlags) MEM_FLG_GET_STRUC_PFIELD(pMemMngrHead, whichFlags) &= ((MemFlags)(~((MemFlags)msk)))
# 316 "../include/R_RTOS_memMngr.h"
#define MEM_FLGS_TAKEN_SHFT ((MemFlags)0x0u)
#define MEM_FLGS_TAKEN_MSK ((MemFlags)0x1u)
#define MEM_FLGS_ISLOWER_SHFT ((MemFlags)0x1u)
#define MEM_FLGS_ISLOWER_MSK ((MemFlags)0x2u)
#define MEM_FLGS_SPLT_4_SHFT ((MemFlags)0x2u)
#define MEM_FLGS_SPLT_4_MSK ((MemFlags)0x4u)
#define MEM_FLGS_SPLT_8_SHFT ((MemFlags)0x3u)
#define MEM_FLGS_SPLT_8_MSK ((MemFlags)0x8u)
#define MEM_FLGS_SPLT_16_SHFT ((MemFlags)0x4u)
#define MEM_FLGS_SPLT_16_MSK ((MemFlags)0x10u)
#define MEM_FLGS_SPLT_32_SHFT ((MemFlags)0x5u)
#define MEM_FLGS_SPLT_32_MSK ((MemFlags)0x20u)
#define MEM_FLGS_SPLT_64_SHFT ((MemFlags)0x6u)
#define MEM_FLGS_SPLT_64_MSK ((MemFlags)0x40u)
#define MEM_FLGS_SPLT_128_SHFT ((MemFlags)0x7u)
#define MEM_FLGS_SPLT_128_MSK ((MemFlags)0x80u)
#define MEM_FLGS_BGGSTBLCK_SHFT ((MemFlags)0x8u)
#define MEM_FLGS_BGGSTBLCK_MSK ((MemFlags)0x100u)
#define MEM_FLGS_MERGE512_SHFT ((MemFlags)0x9u)
#define MEM_FLGS_MERGE512_MSK ((MemFlags)0x200u)
#define MEM_FLGS_MERGE1024_SHFT ((MemFlags)0xAu)
#define MEM_FLGS_MERGE1024_MSK ((MemFlags)0x400u)
#define MEM_FLGS_MERGE2048_SHFT ((MemFlags)0xBu)
#define MEM_FLGS_MERGE2048_MSK ((MemFlags)0x800u)
#define MEM_FLGS_SPLT_SHFT ((MemFlags)0xCu)
#define MEM_FLGS_SPLT_MSK ((MemFlags)0x1000u)
#define MEM_FLGS_MERGED_SHFT ((MemFlags)0xDu)
#define MEM_FLGS_MERGED_MSK ((MemFlags)0x2000u)
#define MEM_FLGS_PREVTAKEN_SHFT ((MemFlags)0xEu)
#define MEM_FLGS_PREVTAKEN_MSK ((MemFlags)0x4000u)
#define MEM_FLGS_NXTTAKEN_SHFT ((MemFlags)0xFu)
#define MEM_FLGS_NXTTAKEN_MSK ((MemFlags)0x8000u)

#define MEM_FLGS_SIZE_MSK ((MemFlags)0xFFCu)

#define MEM_FLG_ISTAKEN(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_FLGS_TAKEN_SHFT)
#define MEM_FLG_SET_TAKEN(pMemMngrHead) MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_TAKEN_MSK, flagsForMemBlock)
#define MEM_FLG_CLR_TAKEN(pMemMngrHead) MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_TAKEN_MSK, flagsForMemBlock)
#define MEM_FLG_PREVTAKEN(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_FLGS_PREVTAKEN_SHFT)
#define MEM_FLG_SET_PREVTAKEN(pMemMngrHead) MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_PREVTAKEN_MSK, flagsForMemBlock)
#define MEM_FLG_CLR_PREVTAKEN(pMemMngrHead) MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_PREVTAKEN_MSK, flagsForMemBlock)
#define MEM_FLG_NXTTAKEN(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_FLGS_NXTTAKEN_SHFT)
#define MEM_FLG_SET_NXTTAKEN(pMemMngrHead) MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_NXTTAKEN_MSK, flagsForMemBlock)
#define MEM_FLG_CLR_NXTTAKEN(pMemMngrHead) MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_NXTTAKEN_MSK, flagsForMemBlock)
#define MEM_FLG_ISSPLIT(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_FLGS_SPLT_SHFT)
#define MEM_FLG_SET_SPLIT(pMemMngrHead) MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_SPLT_MSK, flagsForMemBlock)
#define MEM_FLG_CLR_SPLIT(pMemMngrHead) MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_SPLT_MSK, flagsForMemBlock)
#define MEM_FLG_ISLOWER(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_FLGS_ISLOWER_SHFT)
#define MEM_FLG_SET_ISLOWER(pMemMngrHead) MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_ISLOWER_MSK, flagsForMemBlock)
#define MEM_FLG_CLR_ISLOWER(pMemMngrHead) MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_ISLOWER_MSK, flagsForMemBlock)
#define MEM_FLG_ISMERGED(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_FLGS_MERGED_SHFT)
#define MEM_FLG_SET_MERGED(pMemMngrHead) MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_MERGED_MSK, flagsForMemBlock)
#define MEM_FLG_CLR_MERGED(pMemMngrHead) MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_MERGED_MSK, flagsForMemBlock)
#define MEM_FL_WASLOWER(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_FLGS_WASLOWER_SHFT)

#define MEM_FLG_GET_MEMSIZE(memFlgs) (MemSize)(memFlgs & MEM_FLGS_SIZE_MSK)
#define MEM_FLG_SET_MEMSIZE(pMemMngrHead,newSize) do { if(((BlckSize)(newSize)) < BIGGEST_BLCK ) { MEM_FLG_SET_SPLIT(pMemMngrHead); } else { MEM_FLG_CLR_SPLIT(pMemMngrHead); } (pMemMngrHead)->flagsForMemBlock = (MemFlags)((pMemMngrHead)->flagsForMemBlock & (MemFlags)(~MEM_FLGS_SIZE_MSK)); (pMemMngrHead)->flagsForMemBlock = (MemFlags)((pMemMngrHead)->flagsForMemBlock | (MemFlags)((MemFlags)(newSize) & MEM_FLGS_SIZE_MSK)); }while((uint8_t)0x0u)
# 385 "../include/R_RTOS_memMngr.h"
#define MEM_FLG_ISCOMBO(memFlgs) (MemSize)((MEM_FLG_GET_MEMSIZE(memFlgs) & (MemSize)(MEM_FLG_GET_MEMSIZE(memFlgs)-(MemSize)1u)) ? 1u : 0u)
#define MEM_FLG_BIGGER_COMBO(memFlgs) (MemSize)(MEM_FLG_GET_MEMSIZE(memFlgs) & (MemSize)(MEM_FLG_GET_MEMSIZE(memFlgs)-(MemSize)1u))
#define MEM_FLG_SMALLER_COMBO(memFlgs) (MemSize)(MEM_FLG_GET_MEMSIZE(memFlgs) & (MemSize)(-MEM_FLG_GET_MEMSIZE(memFlgs)))
# 413 "../include/R_RTOS_memMngr.h"
#define MEM_FLGS_ISBLCKBEG_SHFT ((MemFlags)0x0u)
#define MEM_FLGS_ISBLCKBEG_MSK ((MemFlags)0x1u)
#define MEM_FLGS_ISBLCKLAST_SHFT ((MemFlags)0x1u)
#define MEM_FLGS_ISBLCKLAST_MSK ((MemFlags)0x2u)
#define MEM_FLGS_PRV_SPLT_4_SHFT MEM_FLGS_SPLT_4_SHFT
#define MEM_FLGS_PRV_SPLT_4_MSK MEM_FLGS_SPLT_4_MSK
#define MEM_FLGS_PRV_SPLT_8_SHFT MEM_FLGS_SPLT_8_SHFT
#define MEM_FLGS_PRV_SPLT_8_MSK MEM_FLGS_SPLT_8_MSK
#define MEM_FLGS_PRV_SPLT_16_SHFT MEM_FLGS_SPLT_16_SHFT
#define MEM_FLGS_PRV_SPLT_16_MSK MEM_FLGS_SPLT_16_MSK
#define MEM_FLGS_PRV_SPLT_32_SHFT MEM_FLGS_SPLT_32_SHFT
#define MEM_FLGS_PRV_SPLT_32_MSK MEM_FLGS_SPLT_32_MSK
#define MEM_FLGS_PRV_SPLT_64_SHFT MEM_FLGS_SPLT_64_SHFT
#define MEM_FLGS_PRV_SPLT_64_MSK MEM_FLGS_SPLT_64_MSK
#define MEM_FLGS_PRV_SPLT_128_SHFT MEM_FLGS_SPLT_128_SHFT
#define MEM_FLGS_PRV_SPLT_128_MSK MEM_FLGS_SPLT_128_MSK
#define MEM_FLGS_PRV_BGGSTBLCK_SHFT MEM_FLGS_BGGSTBLCK_SHFT
#define MEM_FLGS_PRV_BGGSTBLCK_MSK MEM_FLGS_BGGSTBLCK_MSK
#define MEM_FLGS_PRV_MERGE512_SHFT MEM_FLGS_MERGE512_SHFT
#define MEM_FLGS_PRV_MERGE512_MSK MEM_FLGS_MERGE512_MSK
#define MEM_FLGS_PRV_MERGE1024_SHFT MEM_FLGS_MERGE1024_SHFT
#define MEM_FLGS_PRV_MERGE1024_MSK MEM_FLGS_MERGE1024_MSK
#define MEM_FLGS_PRV_MERGE2048_SHFT MEM_FLGS_MERGE2048_SHFT
#define MEM_FLGS_PRV_MERGE2048_MSK MEM_FLGS_MERGE2048_MSK
#define MEM_FLGS_NXT_SPLT_SHFT ((MemFlags)0xCu)
#define MEM_FLGS_NXT_SPLT_MSK ((MemFlags)0x1000u)
#define MEM_FLGS_PREV_SPLT_SHFT ((MemFlags)0xDu)
#define MEM_FLGS_PREV_SPLT_MSK ((MemFlags)0x2000u)
#define MEM_FLGS_BGGRMRGD_SHFT ((MemFlags)0xEu)
#define MEM_FLGS_BGGRMRGD_MSK ((MemFlags)0x4000u)
#define MEM_FLGS_CACHED_SHFT ((MemFlags)0xFu)
#define MEM_FLGS_CACHED_MSK ((MemFlags)0x8000u)

#define MEM_FLG_ISBLCKBEG(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_FLGS_ISBLCKBEG_SHFT)
#define MEM_FLG_SET_BLCKBEG(pMemMngrHead) MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_ISBLCKBEG_MSK, additionalFlags)
#define MEM_FLG_CLR_BLCKBEG(pMemMngrHead) MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_ISBLCKBEG_MSK, additionalFlags)
#define MEM_FLG_ISBLCKLAST(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_FLGS_ISBLCKLAST_SHFT)
#define MEM_FLG_SET_BLCKLAST(pMemMngrHead) MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_ISBLCKLAST_MSK, additionalFlags)
#define MEM_FLG_CLR_BLCKLAST(pMemMngrHead) MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_ISBLCKLAST_MSK, additionalFlags)
#define MEM_FLG_NXT_SPLT(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_FLGS_NXT_SPLT_SHFT)
#define MEM_FLG_SET_NXT_SPLT(pMemMngrHead) MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_NXT_SPLT_MSK, additionalFlags)
#define MEM_FLG_CLR_NXT_SPLT(pMemMngrHead) MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_NXT_SPLT_MSK, additionalFlags)
#define MEM_FLG_PREV_SPLT(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_FLGS_PREV_SPLT_SHFT)
#define MEM_FLG_SET_PREV_SPLT(pMemMngrHead) MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_PREV_SPLT_MSK, additionalFlags)
#define MEM_FLG_CLR_PREV_SPLT(pMemMngrHead) MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_PREV_SPLT_MSK, additionalFlags)
#define MEM_FLG_GET_PREV_MEMSIZE(memFlgs) (BlckSize)(memFlgs & MEM_FLGS_SIZE_MSK)
#define MEM_FLG_SET_PREV_MEMSIZE(pMemMngrHead,newSize) do { (pMemMngrHead)->additionalFlags = (MemFlags)((pMemMngrHead)->additionalFlags & (MemFlags)(~MEM_FLGS_SIZE_MSK)); (pMemMngrHead)->additionalFlags = (MemFlags)((pMemMngrHead)->additionalFlags | (MemFlags)((MemFlags)(newSize) & MEM_FLGS_SIZE_MSK)); }while((uint8_t)0x0u)





#define MEM_FLG_PREV_ISCOMBO(memFlgs) (MemSize)((MEM_FLG_GET_PREV_MEMSIZE(memFlgs) & (MemSize)(MEM_FLG_GET_PREV_MEMSIZE(memFlgs)-(MemSize)1u)) ? 1u : 0u)
#define MEM_FLG_PREV_BIGGER_COMBO(memFlgs) (MemSize)(MEM_FLG_GET_PREV_MEMSIZE(memFlgs) & (MemSize)(MEM_FLG_GET_PREV_MEMSIZE(memFlgs)-(MemSize)1u))
#define MEM_FLG_PREV_SMALLER_COMBO(memFlgs) (MemSize)(MEM_FLG_GET_PREV_MEMSIZE(memFlgs) & (MemSize)(-MEM_FLG_GET_PREV_MEMSIZE(memFlgs)))
#define MEM_FLG_BGGRMRGD(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_FLGS_BGGRMRGD_SHFT)
#define MEM_FLG_SET_BGGRMRGD(pMemMngrHead) MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_BGGRMRGD_MSK, additionalFlags)
#define MEM_FLG_CLR_BGGRMRGD(pMemMngrHead) MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_BGGRMRGD_MSK, additionalFlags)
#define MEM_FLG_ISCACHED(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_FLGS_CACHED_SHFT)
#define MEM_FLG_SET_CACHED(pMemMngrHead) MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_CACHED_MSK, additionalFlags)
#define MEM_FLG_CLR_CACHED(pMemMngrHead) MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_CACHED_MSK, additionalFlags)

#define MEM_FLG_TAKENORCACHED(pMemMngrHead) (MemFlags)(MEM_FLG_ISTAKEN(pMemMngrHead->flagsForMemBlock) | MEM_FLG_ISCACHED(pMemMngrHead->additionalFlags))
# 486 "../include/R_RTOS_memMngr.h"
RetCode initMEM( void );






void * rMalloc( MemSize desiredSize );





void * rCalloc( MemSize desiredSize );







void * rRealloc( void * ptrToExistingMem, MemSize desiredSize );





void rFree( void *pToBeFreed );






void rFullyFree( MemMngrHead * blckToFullyFree );
# 529 "../include/R_RTOS_memMngr.h"
RetCode memMngr_CreateMemPool(
                               const MemSize sizeOfElements,
                               const uint8_t elements,
                               MemPoolID * const memPoolID );







RetCode memMngr_DeleteMemPool( const MemPoolID memPoolID );
# 549 "../include/R_RTOS_memMngr.h"
RetCode memMngr_MemPoolMalloc( void ** ptrToMem, const MemPoolID memPoolID );







RetCode memMngr_MemPoolFree( void * ptrToMem, const MemPoolID memPoolID );
# 15 "../source/R_RTOS/R_RTOS_timer.c" 2

extern void os_SCHEDULE( void );
extern TskTCB tsk_AR[];
extern SysFkt sys_SysFkt[];

static MemPoolID memPoolID_TMR;






static Timer tskTMR;







static Timer sysTMR;

static void BREAK( void )
{
    while ( 1 )
    {
        ;
    };
}

static RetCode tmr_InsertSysTmrQ( TmrFktCall * sysFktTmr, LifeTime expires )
{

    if ( ( sysTMR.expirationTime > expires ) || ( sysTMR.specTimer.sysTimer.sysFktIDQStrt
            == (SysFktID)0xFFu ) )
    {
        sysFktTmr->nxtFktCall = sysTMR.specTimer.sysTimer.sysFktIDQStrt;
        sysTMR.specTimer.sysTimer.sysFktIDQStrt = sysFktTmr->fktID;
        sysTMR.expirationTime = expires;
    }
    else
    {
        TmrFktCall * curSysFktTmr =
                &( sys_SysFkt[sysTMR.specTimer.sysTimer.sysFktIDQStrt].fktCallType.tmrFktCall );
        if ( curSysFktTmr->nxtFktCall != (SysFktID)0xFFu )
        {
            TmrFktCall * nxtSysFktTmr =
                    &( sys_SysFkt[curSysFktTmr->nxtFktCall].fktCallType.tmrFktCall );

            while ( nxtSysFktTmr->expirationTime <= expires )
            {
                curSysFktTmr = nxtSysFktTmr;
                if ( nxtSysFktTmr->nxtFktCall == (SysFktID)0xFFu )
                    break;
                nxtSysFktTmr =
                        &sys_SysFkt[nxtSysFktTmr->nxtFktCall].fktCallType.tmrFktCall;
            }
        }
        sysFktTmr->nxtFktCall = curSysFktTmr->nxtFktCall;
        curSysFktTmr->nxtFktCall = sysFktTmr->fktID;

    }
    return ((RetCode)0x1u);
}




static RetCode tmr_InsertTskTmrQ( PTskTCB tsk, LifeTime expires )
{
    if ( ( tskTMR.expirationTime > expires ) || ( tskTMR.specTimer.tskTimer.tskIDQStrt
            == ((TskID)0x0u) ) )
    {
        tsk->nxtTsk = tskTMR.specTimer.tskTimer.tskIDQStrt;
        if ( tsk->nxtTsk != ((TskID)0x0u) )
        {

            tsk_AR[tsk->nxtTsk].prvTsk = tsk->tskID;
        }
        tsk->prvTsk = ((TskID)0x0u);
        tskTMR.specTimer.tskTimer.tskIDQStrt = tsk->tskID;
        tskTMR.expirationTime = expires;
    }
    else
    {

        PTskTCB curTsk = &tsk_AR[tskTMR.specTimer.tskTimer.tskIDQStrt];
        if ( curTsk->nxtTsk != ((TskID)0x0u) )
        {
            PTskTCB nxtTsk = &tsk_AR[curTsk->nxtTsk];

            while ( nxtTsk->tskSync->SyncEleHandle.TmrSyncEle.expireTime <= expires )
            {
                curTsk = nxtTsk;
                if ( nxtTsk->nxtTsk == ((TskID)0x0u) )
                    break;

                nxtTsk = &tsk_AR[nxtTsk->nxtTsk];
            }
        }
        tsk->nxtTsk = curTsk->nxtTsk;
        tsk->prvTsk = curTsk->tskID;
        if ( tsk->nxtTsk != ((TskID)0x0u) )
        {
            tsk_AR[tsk->nxtTsk].prvTsk = tsk->tskID;
        }
        curTsk->nxtTsk = tsk->tskID;
    }
    return ((RetCode)0x1u);
}

RetCode tmr_INIT( void )
{
    __init_TPM( (uint8_t) 0x1u );

    sysTMR.timerType = SysTimerType;
    sysTMR.expirationTime = (LifeTime)0xFFFFFFFFu;
    sysTMR.specTimer.sysTimer.sysFktIDQStrt = (SysFktID)0xFFu;
    installIrq( &tmr_SysTimerElapsed, TPM1_IRQ_INDEX, (uint8_t) 0x0u );

    tskTMR.timerType = TskTimerType;
    tskTMR.expirationTime = (LifeTime)0xFFFFFFFFu;
    tskTMR.specTimer.tskTimer.tskIDQStrt = ((TskID)0x0u);
    installIrq( &tmr_TskTimerElapsed, TPM1_IRQ_INDEX, (uint8_t) 0x1u );

    NVIC_ClearPendingIRQ( TPM1_IRQn ); NVIC_EnableIRQ( TPM1_IRQn );
    NVIC_SetPriority( TPM1_IRQn, 2 );

    memMngr_CreateMemPool( sizeof(SyncEle), (uint8_t)0x5u, &memPoolID_TMR );

    return ((RetCode)0x1u);
}

RetCode tmr_setSysTimer( SysFktID fktID, TmrTime msToWait, uint8_t periodicity )
{

    LifeTime expires = (LifeTime) (uint32_t)(~( (((PIT_Type *)(0x40037000u)))->CHANNEL[1].CVAL )) + (LifeTime) msToWait;
    TmrFktCall * sysFktTmr = &sys_SysFkt[fktID].fktCallType.tmrFktCall;
    if ( (uint32_t) sysFktTmr->sysFktCall != (uint32_t) ((void *)0x0u) )
    {
        sysFktTmr->fktID = fktID;
        sysFktTmr->expirationTime = expires;
        if ( periodicity )
        {
            sysFktTmr->reloadTime = msToWait;
        }
        else
        {
            sysFktTmr->reloadTime = (TmrTime) 0x0u;
        }
        if ( tmr_InsertSysTmrQ( sysFktTmr, expires ) != ((RetCode)0x1u) )
            return ((RetCode)0x0u);
        if ( (uint32_t)(~( (((PIT_Type *)(0x40037000u)))->CHANNEL[1].CVAL )) < sysTMR.expirationTime )
        {

            do { __init_TPMChannel((uint8_t)(uint8_t ) 0x1u,(uint8_t)(uint8_t ) 0x0u,(uint16_t)( (uint16_t) ( sysTMR.expirationTime - (uint32_t)(~( (((PIT_Type *)(0x40037000u)))->CHANNEL[1].CVAL )) ) )); startTPMChannel((uint8_t)(uint8_t ) 0x1u,(uint8_t)(uint8_t ) 0x0u); }while((uint8_t)0x0u)

                                                                           ;
        }
        else
        {
            tmr_SysTimerElapsed();
        }
        return ((RetCode)0x1u);
    }
    return ((RetCode)0x0u);
}

RetCode tmr_setTskTimer( PTskTCB const tsk, TmrTime msToWait )
{

    LifeTime expires = (LifeTime) (uint32_t)(~( (((PIT_Type *)(0x40037000u)))->CHANNEL[1].CVAL ));
    expires += (LifeTime) msToWait;

    if ( ( (uint32_t) tsk == (uint32_t) ((void *)0x0u) ) || ( (uint32_t) tsk->tskSync
            != (uint32_t) ((void *)0x0u) ) )
        return ((RetCode)0x0u);

    PSyncEle tmrSync;
    memMngr_MemPoolMalloc( &tmrSync, memPoolID_TMR );
    if ( (uint32_t) tmrSync != (uint32_t) ((void *)0x0u) )
    {


        tmrSync->syncEleType = SyncEle_TYPE_TMR;
        tmrSync->syncEleID = (SyncEleID) TskTimerType;
        tmrSync->SyncEleHandle.TmrSyncEle.expireTime = expires;

        tsk->tskSync = tmrSync;

        tsk_SetEvt( tsk, tmrSync );

        if ( tskTMR.specTimer.tskTimer.tskIDQStrt == ((TskID)0x0u) )
        {

            tskTMR.expirationTime = expires;
            tskTMR.specTimer.tskTimer.tskIDQStrt = tsk->tskID;
            tsk->nxtTsk = ((TskID)0x0u);
            tsk->prvTsk = ((TskID)0x0u);
        }
        else
        {

            if ( tmr_InsertTskTmrQ( tsk, expires ) != ((RetCode)0x1u) )
                return ((RetCode)0x0u);
        }







        if ( (uint32_t)(~( (((PIT_Type *)(0x40037000u)))->CHANNEL[1].CVAL )) < tskTMR.expirationTime )
        {

            do { __init_TPMChannel((uint8_t)(uint8_t ) 0x1u,(uint8_t)(uint8_t ) 0x1u,(uint16_t)( (uint16_t) ( tskTMR.expirationTime - (uint32_t)(~( (((PIT_Type *)(0x40037000u)))->CHANNEL[1].CVAL )) ) )); startTPMChannel((uint8_t)(uint8_t ) 0x1u,(uint8_t)(uint8_t ) 0x1u); }while((uint8_t)0x0u)

                                                                           ;
        }
        else
        {
            tmr_TskTimerElapsed();
        }
        return ((RetCode)0x1u);
    }
    BREAK();
    tsk->tskState = TSK_STATE_ERROR;
    return ((RetCode)0x0u);
}

void tmr_SysTimerElapsed( void )
{
    __disable_irq();

    stopTPMChannel( (uint8_t) 0x1u, (uint8_t) 0x0u );
    if ( sysTMR.specTimer.sysTimer.sysFktIDQStrt != (SysFktID)0xFFu )
    {
        TmrFktCall * fkt;
        do
        {

            fkt = &sys_SysFkt[sysTMR.specTimer.sysTimer.sysFktIDQStrt].fktCallType.tmrFktCall;

            ( fkt->sysFktCall )();


            sysTMR.specTimer.sysTimer.sysFktIDQStrt = fkt->nxtFktCall;

            if ( sysTMR.specTimer.sysTimer.sysFktIDQStrt == (SysFktID)0xFFu )
            {
                sysTMR.expirationTime = (LifeTime)0xFFFFFFFFu;






            }
            else
            {
                sysTMR.expirationTime =
                        sys_SysFkt[fkt->nxtFktCall].fktCallType.tmrFktCall.expirationTime;
            }
            if ( fkt->reloadTime )
            {
                fkt->expirationTime = (LifeTime) (uint32_t)(~( (((PIT_Type *)(0x40037000u)))->CHANNEL[1].CVAL ))
                        + (LifeTime) fkt->reloadTime;
                tmr_InsertSysTmrQ( fkt, fkt->expirationTime );
                fkt = &sys_SysFkt[sysTMR.specTimer.sysTimer.sysFktIDQStrt].fktCallType.tmrFktCall;
                sysTMR.expirationTime = fkt->expirationTime;
            }
        } while ( sysTMR.expirationTime <= ( (uint32_t)(~( (((PIT_Type *)(0x40037000u)))->CHANNEL[1].CVAL )) + (uint32_t)0x3u ) );

        if ( sysTMR.expirationTime != (LifeTime)0xFFFFFFFFu )
        {
            do { __init_TPMChannel((uint8_t)(uint8_t ) 0x1u,(uint8_t)(uint8_t ) 0x0u,(uint16_t)( (uint16_t) ( sysTMR.expirationTime - (uint32_t)(~( (((PIT_Type *)(0x40037000u)))->CHANNEL[1].CVAL )) ) )); startTPMChannel((uint8_t)(uint8_t ) 0x1u,(uint8_t)(uint8_t ) 0x0u); }while((uint8_t)0x0u)

                                                                           ;
        }
    }
    else
    {
        BREAK();
    }
    __enable_irq();
}

void tmr_TskTimerElapsed( void )
{
    __disable_irq();



    stopTPMChannel( (uint8_t) 0x1u, (uint8_t) 0x1u );
    if ( tskTMR.specTimer.sysTimer.sysFktIDQStrt != ((TskID)0x0u) )
    {
        PTskTCB tsk;


        do
        {

            tsk = &tsk_AR[tskTMR.specTimer.tskTimer.tskIDQStrt];

            tskTMR.specTimer.tskTimer.tskIDQStrt = tsk->nxtTsk;




            tsk_ClrEvt( tsk, tsk->tskSync );



            memMngr_MemPoolFree( tsk->tskSync, memPoolID_TMR );
            tsk->tskSync = (PSyncEle) ((void *)0x0u);

            if ( tskTMR.specTimer.tskTimer.tskIDQStrt == ((TskID)0x0u) )
            {
                tskTMR.expirationTime = (LifeTime)0xFFFFFFFFu;
                break;
            }
            else
            {
                tsk = &tsk_AR[tskTMR.specTimer.tskTimer.tskIDQStrt];
                tskTMR.expirationTime =
                        tsk->tskSync->SyncEleHandle.TmrSyncEle.expireTime;
                tsk->prvTsk = ((TskID)0x0u);
            }
        } while ( tskTMR.expirationTime <= ( (uint32_t)(~( (((PIT_Type *)(0x40037000u)))->CHANNEL[1].CVAL )) + (uint32_t)0x3u ) );

        if ( (uint32_t)(~( (((PIT_Type *)(0x40037000u)))->CHANNEL[1].CVAL )) > tskTMR.expirationTime )
        {
            BREAK();
        }

        if ( tskTMR.expirationTime != (LifeTime)0xFFFFFFFFu )
        {
            do { __init_TPMChannel((uint8_t)(uint8_t ) 0x1u,(uint8_t)(uint8_t ) 0x1u,(uint16_t)( (uint16_t) ( tskTMR.expirationTime - (uint32_t)(~( (((PIT_Type *)(0x40037000u)))->CHANNEL[1].CVAL )) ) )); startTPMChannel((uint8_t)(uint8_t ) 0x1u,(uint8_t)(uint8_t ) 0x1u); }while((uint8_t)0x0u)

                                                                           ;
        }
    }
    else
    {
        BREAK();
    }
    os_SCHEDULE();
    __enable_irq();
}


RetCode tmr_GiveUpOnTMR( PTskTCB const tsk )
{




    if ( tskTMR.specTimer.tskTimer.tskIDQStrt == ((TskID)0x0u) )
        return ((RetCode)0x0u);

    if ( tsk->tskID == tskTMR.specTimer.tskTimer.tskIDQStrt )
    {



        tskTMR.specTimer.tskTimer.tskIDQStrt = tsk->nxtTsk;
        if ( tsk->nxtTsk == ((TskID)0x0u) )
        {





            tskTMR.expirationTime = (LifeTime)0xFFFFFFFFu;
            stopTPMChannel( (uint8_t) 0x1u, (uint8_t) 0x1u );
        }
        else
        {



            PTskTCB curTsk = &tsk_AR[tsk->nxtTsk];
            curTsk->prvTsk = ((TskID)0x0u);



            tskTMR.expirationTime =
                    curTsk->tskSync->SyncEleHandle.TmrSyncEle.expireTime;



            do { __init_TPMChannel((uint8_t)(uint8_t ) 0x1u,(uint8_t)(uint8_t ) 0x1u,(uint16_t)( (uint16_t) ( tskTMR.expirationTime - (uint32_t)(~( (((PIT_Type *)(0x40037000u)))->CHANNEL[1].CVAL )) ) )); startTPMChannel((uint8_t)(uint8_t ) 0x1u,(uint8_t)(uint8_t ) 0x1u); }while((uint8_t)0x0u)

                                                                           ;
        }
    }
    else
    {



        if ( tsk->nxtTsk != ((TskID)0x0u) )
        {




            tsk_AR[tsk->nxtTsk].prvTsk = tsk->prvTsk;
        }
        if ( tsk->prvTsk != ((TskID)0x0u) )
        {





            tsk_AR[tsk->prvTsk].nxtTsk = tsk->nxtTsk;
        }
    }



    tsk->nxtTsk = ((TskID)0x0u);
    tsk->prvTsk = ((TskID)0x0u);



    tsk_ClrEvt( tsk, tsk->tskSync );



    memMngr_MemPoolFree( tsk->tskSync, memPoolID_TMR );
    tsk->tskSync = (PSyncEle) ((void *)0x0u);
    return ((RetCode)0x1u);
}
