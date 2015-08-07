# $MidnightBSD$
# $FreeBSD: head/Mk/Uses/tk.mk 369465 2014-09-28 16:36:31Z tijl $
#
# vim: ts=8 noexpandtab
#

tcl_ARGS=	${tk_ARGS}

_TCLTK_PORT=	tk

.include "${PORTSDIR}/Mk/extensions/tcl.mk"
