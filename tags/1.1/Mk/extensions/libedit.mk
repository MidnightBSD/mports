# $MidnightBSD$
#
# handle dependency on the libedit port
#
# Feature:	libedit
# Usage:	USES=libedit
# Valid ARGS:	none
#

.if !defined(_INCLUDE_USES_LIBEDIT_MK)
_INCLUDE_USES_LIBEDIT_MK=	yes
.include "${MPORTEXTENSIONS}/localbase.mk"

LIB_DEPENDS+=	libedit.so.0:devel/libedit
.endif
