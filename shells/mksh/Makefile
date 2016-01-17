# $MidnightBSD$

PORTNAME=	mksh
DISTVERSION=	R52
CATEGORIES=	shells
MASTER_SITES=	http://www.mirbsd.org/MirOS/dist/mir/mksh/ \
		http://pub.allbsd.org/MirOS/dist/mir/mksh/
		
DISTFILES=	${PORTNAME}-${DISTVERSION}.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MirBSD enhanced shell based on pdksh

LICENSE=	agg

WRKSRC=		${WRKDIR}/${PORTNAME}

PLIST_FILES=	bin/mksh share/examples/mksh/dot.mkshrc man/man1/mksh.1.gz
PLIST_DIRS=	share/examples/mksh

PKGINSTALL=	pkg-install
PKGDEINSTALL=	pkg-deinstall

.include <bsd.port.pre.mk>

do-build:
	cd ${WRKSRC} && CFLAGS="${CFLAGS}" CC="${CC}" LDFLAGS="${LDFLAGS}" CPPFLAGS="${CPPFLAGS}" SHELL=${SH} ${SH} ${WRKSRC}/Build.sh -Q -r -c lto

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/mksh ${PREFIX}/bin
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/dot.mkshrc ${EXAMPLESDIR}
	${INSTALL_MAN} ${WRKSRC}/mksh.1 ${MANPREFIX}/man/man1

.include <bsd.port.post.mk>
