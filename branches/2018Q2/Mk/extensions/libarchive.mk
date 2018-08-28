# $MidnightBSD$
# $FreeBSD: head/Mk/Uses/libarchive.mk 392507 2015-07-19 14:36:00Z bapt $
#
# handle dependency on the libarchive port
#
# Feature:	libarchive
# Usage:	USES=libarchive
# Valid ARGS:	none
#

.if !defined(_INCLUDE_USES_LIBARCHIVE_MK)
_INCLUDE_USES_LIBARCHIVE_MK=	yes
.include "${MPORTEXTENSIONS}/localbase.mk"

LIB_DEPENDS+=	libarchive.so.13:${PORTSDIR}/archivers/libarchive
.endif
