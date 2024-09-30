# RELRO Support

.if !defined(_RELRO_MK_INCLUDED)
_RELRO_MK_INCLUDED=	yes
RELRO_Include_MAINTAINER=	ports@MidnightBSD.org

.  if !defined(RELRO_UNSAFE)
LDFLAGS+=	-Wl,-zrelro
.  endif
.endif
