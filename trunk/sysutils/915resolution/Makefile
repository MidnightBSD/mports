# $MidnightBSD: mports/sysutils/915resolution/Makefile,v 1.2 2009/08/29 16:14:20 laffer1 Exp $

PORTNAME=	915resolution
PORTVERSION=	0.5.3
PORTEPOCH=	1
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	ehaupt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Resolution tool for Intel i915 video cards
LICENSE=	publicdom

USE_RC_SUBR=	915resolution.sh

DOCS=		README.txt LICENSE.txt chipset_info.txt changes.log

ONLY_FOR_ARCHS=	i386 amd64

.include <bsd.port.pre.mk>

do-build:
	cd ${WRKSRC} && \
		${CC} ${CFLAGS} 915resolution.c -o 915resolution

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/915resolution ${PREFIX}/sbin
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${DOCS:S,^,${WRKSRC}/,} ${DOCSDIR}/
.endif

.include <bsd.port.post.mk>
