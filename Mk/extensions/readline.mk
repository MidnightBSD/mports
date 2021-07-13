# handle dependency on the readline port
#
# Feature:	readline
# Usage:	USES=readline
# Valid ARGS:	port
#

.if !defined(_INCLUDE_USES_READLINE_MK)
_INCLUDE_USES_READLINE_MK=	yes

.if !empty(readline_ARGS)
IGNORE= Incorrect 'USES+= readline:${readline_ARGS}' readline takes no arguments
.endif

# magus freaks out because system readline is 8
BUILD_DEPENDS+=		/usr/local/lib/libreadline.so.8.1:devel/readline
RUN_DEPENDS+=		/usr/local/lib/libreadline.so.8.1:devel/readline
LIB_DEPENDS+=		libreadline.so.8.1:devel/readline
CPPFLAGS+=		-I${LOCALBASE}/include
LDFLAGS+=		-L${LOCALBASE}/lib

.endif
