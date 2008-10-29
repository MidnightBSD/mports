# Ports collection makefile for:	mksh
# Date created:				2006-06-24
# Whom:					Andreas Kohn <andreas@syndrom23.de>
#
# $MidnightBSD: mports/shells/mksh/Makefile,v 1.14 2008/04/17 22:59:41 laffer1 Exp $
# $FreeBSD: ports/shells/mksh/Makefile,v 1.3 2006/09/04 07:02:54 miwi Exp $
#

PORTNAME=	mksh
DISTVERSION=	R36
CATEGORIES=	shells
MASTER_SITES=	http://www.mirbsd.org/MirOS/dist/mir/mksh/
DISTFILES=	${PORTNAME}-${DISTVERSION}.cpio.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A MirBSD enhanced shell based on pdksh
LICENSE=	bsd4

USE_GCPIO=	yes

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
	cd ${WRKSRC} && CFLAGS="${CFLAGS}" CC="${CC}" LDFLAGS="${LDFLAGS}" CPPFLAGS="${CPPFLAGS}" SHELL=${SH} ${SH} ${WRKSRC}/Build.sh -Q -r

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/mksh ${PREFIX}/bin
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/dot.mkshrc ${EXAMPLESDIR}
	${INSTALL_MAN} ${WRKSRC}/mksh.1 ${MANPREFIX}/man/man1

.include <bsd.port.post.mk>
