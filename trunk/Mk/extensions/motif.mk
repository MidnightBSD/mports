# $MidnightBSD$
# $FreeBSD: head/Mk/Uses/motif.mk 348308 2014-03-15 10:31:54Z gerald $
#
# handle dependency on motif
#
# Feature:	motif
# Usage:	USES=motif
#
# If WANT_LESSTIF is defined in user make.conf then lesstif will be used
# instead of open-motif

.if !defined(_INCLUDE_USES_MOTIF_MK)
_INCLUDE_USES_MOTIF_MK=	yes

.if defined(motif_ARGS)
IGNORE=	USES=motif takes no arguments
.endif

.if defined(WANT_LESSTIF)
LIB_DEPENDS+=		libXm.so:${PORTSDIR}/x11-toolkits/lesstif
.else
USE_XORG+=	xpm
LIB_DEPENDS+=		libXm.so.4:${PORTSDIR}/x11-toolkits/open-motif
.endif

MOTIFLIB?=	-L${LOCALBASE}/lib -lXm -lXp
MAKE_ENV+=	MOTIFLIB="${MOTIFLIB}"

.endif
