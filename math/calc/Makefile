# $MidnightBSD$

PORTNAME=	calc
PORTVERSION=	2.12.5.3
CATEGORIES=	math
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Arbitrary precision calculator

LICENSE=	lgpl

USES=		gmake tar:bzip2 readline
USE_LDCONFIG=	yes

MAKE_JOBS_UNSAFE=	yes

CALCPAGER?=	more
FAKE_MAKEENV+=	CALCPAGER="${CALCPAGER}" CAT="${CAT}" CHMOD="${CHMOD}" \
		CP="${CP}" GMAKE="${MAKE_CMD}" LN="${LN}" MKDIR="${MKDIR}" \
		MV="${MV}" RM="${RM}" SED="${SED}" TOUCH="${TOUCH}" \
		TRUE="${TRUE}"
.if !exists(/usr/lib/libreadline.so)
FAKE_MAKEARGS+=	READLINE_INCLUDE="-I${LOCALBASE}/include" \
		READLINE_LIB="-L${LOCALBASE}/lib -lreadline"
.endif

PLIST_SUB+=	VERSION=${PORTVERSION}

.include <bsd.port.mk>
