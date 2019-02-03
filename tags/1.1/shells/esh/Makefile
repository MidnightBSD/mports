# $MidnightBSD$

PORTNAME=	esh
PORTVERSION=	0.8.5
PORTREVISION=	2
CATEGORIES=	shells
MASTER_SITES=	GENTOO

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The "easy shell", a small shell with Lisp-like syntax

LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${PORTNAME}

USES=		readline
MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS}"

INFO=		esh

post-patch:
	@${REINPLACE_CMD} -e \
		's|<readline.h>|<readline/readline.h>| ; \
		s|<history.h>|<readline/history.h>|' ${WRKSRC}/read-rl.c

pre-build:
	@(cd ${WRKSRC} && ${MAKE} clean)

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/esh ${PREFIX}/bin/esh
.if !defined(NOPORTDOCS)
	${INSTALL_DATA} ${WRKSRC}/doc/esh.info ${PREFIX}/info/esh.info
.endif

.include <bsd.port.mk>
