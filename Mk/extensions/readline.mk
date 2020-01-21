# $MidnightBSD$
#
# handle dependency on the readline port
#
# Feature:	readline
# Usage:	USES=readline
# Valid ARGS:	port
#

.if !defined(_INCLUDE_USES_READLINE_MK)
_INCLUDE_USES_READLINE_MK=	yes

.if !exists(/usr/lib/libreadline.so)
readline_ARGS=	port
.endif

.if ${readline_ARGS} == port
# magus freaks out because system readline is 8
BUILD_DEPENDS+=		/usr/local/lib/libreadline.so.8:devel/readline
RUN_DEPENDS+=		/usr/local/lib/libreadline.so.8:devel/readline
LIB_DEPENDS+=		libreadline.so.8:devel/readline
CPPFLAGS+=		-I${LOCALBASE}/include
LDFLAGS+=		-L${LOCALBASE}/lib
.endif

.endif
