AC_INIT([libldac], [2.0.2])
AM_INIT_AUTOMAKE([foreign subdir-objects -Wall -Werror])

AC_PROG_CC
AM_PROG_AR
AM_PROG_CC_C_O
LT_INIT

AC_ARG_ENABLE([debug],
	AS_HELP_STRING([--enable-debug], [enable debugging support]))
AM_CONDITIONAL([ENABLE_DEBUG], [test "x$enable_debug" = "xyes"])
AM_COND_IF([ENABLE_DEBUG], [
	AX_APPEND_FLAG([-DLOCAL_DEBUG])
])

AC_CONFIG_FILES([
	Makefile
	libldacBT.pc
	libldacBT_abr.pc])
AC_OUTPUT
