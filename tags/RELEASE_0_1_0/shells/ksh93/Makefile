# New ports collection makefile for:   ksh93
# Date created:                2000-12-26
# Whom:                        Christian Weisgerber <naddy@mips.inka.de>
#
# $MidnightBSD: mports/shells/ksh93/Makefile,v 1.1 2006/09/18 13:24:12 laffer1 Exp $
# $FreeBSD: ports/shells/ksh93/Makefile,v 1.47 2006/04/22 22:21:28 kris Exp $

PORTNAME=	ksh93
PORTVERSION=	${VERSION:S/-//g}
CATEGORIES=	shells
MASTER_SITES=	http://www.research.att.com/~gsf/download/tgz/
DISTNAME=	${PORTNAME}-${VERSION}
DISTFILES=	INIT.${VERSION}.tgz ast-ksh.${VERSION}.tgz
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Official AT&T release of KornShell 93

MANUAL_PACKAGE_BUILD=Doesn't build in tinderbox environment

VERSION=	2007-03-28
RESTRICTED=	Source recipient must acknowledge license

FETCH_ENV=	HTTP_AUTH='basic:*:I accept www.opensource.org/licenses/cpl:.'
FETCH_CMD=	/usr/bin/fetch -Rr		# see bin/76134
NO_WRKSUBDIR=	yes
MAKE_ENV=	CCFLAGS="${CFLAGS}" SHELL="${SH}"
.if defined(WANT_STATIC)
MAKE_ENV+=	LDFLAGS=-static
.endif

MAN1=		ksh93.1

.include <bsd.port.pre.mk>

INSTALLROOT=	${WRKSRC}/arch/midnightbsd.${ARCH}

.if ${ARCH} == "sparc64"
BROKEN=	Does not compile on sparc64
.endif

do-build:
	@cd ${WRKSRC} && ${SETENV} -i ${MAKE_ENV} ${SH} bin/package make

do-install:
	${INSTALL_PROGRAM} ${INSTALLROOT}/bin/ksh ${PREFIX}/bin/ksh93
	${INSTALL_MAN} ${INSTALLROOT}/man/man1/sh.1 \
	    ${MANPREFIX}/man/man1/ksh93.1
	${MKDIR} ${PREFIX}/share/examples/ksh93
.for fun in dirs popd pushd
	${INSTALL_SCRIPT} ${INSTALLROOT}/fun/${fun} \
	    ${PREFIX}/share/examples/ksh93/
.endfor

test: build
	@cd ${WRKSRC}/src/cmd/ksh93/tests && \
	    ${SETENV} SHELL=${INSTALLROOT}/bin/ksh \
		${INSTALLROOT}/bin/ksh shtests

.include <bsd.port.post.mk>
