# $MidnightBSD: mports/sysutils/makefs/Makefile,v 1.2 2009/05/22 03:54:47 laffer1 Exp $

PORTNAME=	makefs
PORTVERSION=	20040704
CATEGORIES=	sysutils
MASTER_SITES=	http://www.daemonology.net/makefs/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Builds FFS images
LICENSE=	bsd4

MAN8=		makefs.8
PLIST_FILES=	sbin/makefs

.include <bsd.port.pre.mk>

do-build:
	cd ${WRKSRC} && ${SH} -xe build.sh

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/netbsdsrc/tools/makefs/makefs	\
		${PREFIX}/sbin
.if !defined(WITHOUT_MAN)
	${INSTALL_MAN} ${WRKSRC}/netbsdsrc/usr.sbin/makefs/makefs.8	\
		${PREFIX}/man/man8/
.endif

.include <bsd.port.post.mk>
