# $MidnightBSD: mports/shells/mksh/Makefile,v 1.25 2011/06/13 03:13:26 laffer1 Exp $

PORTNAME=	mksh
DISTVERSION=	R40b
CATEGORIES=	shells
MASTER_SITES=	http://www.mirbsd.org/MirOS/dist/mir/mksh/ \
		http://pub.allbsd.org/MirOS/dist/mir/mksh/
		
DISTFILES=	${PORTNAME}-${DISTVERSION}.cpio.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A MirBSD enhanced shell based on pdksh
LICENSE=	agg

USE_CPIO=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}

MAN1=		mksh.1
PLIST_FILES=	bin/mksh share/examples/mksh/dot.mkshrc
PLIST_DIRS=	share/examples/mksh

PKGINSTALL=	pkg-install
PKGDEINSTALL=	pkg-deinstall

.include <bsd.port.pre.mk>

do-extract:
	${MKDIR} ${WRKDIR}
	cd ${WRKDIR} && \
		${GZCAT} ${DISTDIR}/${DISTFILES} | ${CPIO} -id

do-build:
	cd ${WRKSRC} && CFLAGS="${CFLAGS}" CC="${CC}" LDFLAGS="${LDFLAGS}" CPPFLAGS="${CPPFLAGS}" SHELL=${SH} ${SH} ${WRKSRC}/Build.sh -Q -r -c lto

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/mksh ${PREFIX}/bin
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/dot.mkshrc ${EXAMPLESDIR}
	${INSTALL_MAN} ${WRKSRC}/mksh.1 ${MANPREFIX}/man/man1

.include <bsd.port.post.mk>
