# $MidnightBSD: mports/shells/esh/Makefile,v 1.2 2007/05/17 17:29:26 ctriv Exp $

PORTNAME=	esh
PORTVERSION=	0.8.5
CATEGORIES=	shells
MASTER_SITES=	http://gd.tuwien.ac.at/opsys/linux/gentoo/distfiles/ \
		http://people.FreeBSD.org/~foxfair/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The "easy shell", a small shell with Lisp-like syntax
LICENSE=	gpl2

WRKSRC=		${WRKDIR}/esh
MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS} -I/usr/include/readline"
INFO=		esh

pre-build:
	@(cd ${WRKSRC} && ${MAKE} clean)

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/esh ${PREFIX}/bin/esh
.if !defined(NOPORTDOCS)
	${INSTALL_DATA} ${WRKSRC}/doc/esh.info ${PREFIX}/info/esh.info
.endif

.include <bsd.port.mk>
