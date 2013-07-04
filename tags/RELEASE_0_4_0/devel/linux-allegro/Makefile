# New ports collection makefile for:	linux-allegro
# Date created:				18 Nov 2003
# Whom:					Pav Lucistnik <pav@FreeBSD.org>
#
# $MidnightBSD: mports/devel/linux-allegro/Makefile,v 1.1 2006/10/01 17:01:49 laffer1 Exp $
# $FreeBSD: ports/devel/linux-allegro/Makefile,v 1.8 2006/05/01 17:28:12 netchild Exp $
#

PORTNAME=	allegro
PORTVERSION=	4.0.3
PORTREVISION=	2
CATEGORIES=	devel linux
MASTER_SITES=	http://membres.lycos.fr/ebotcazou/allegro/
DISTNAME=	${PORTNAME}-${PORTVERSION}-1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform game programming library (linux version)
LICENSE=	other

USE_LINUX_RPM=		yes
ONLY_FOR_ARCHS=		i386 amd64
DIST_SUBDIR=		rpm
USE_LDCONFIG=		yes
USE_XLIB=		yes
SRC_DISTFILES=

MD5_FILE=	${MASTERDIR}/distinfo

post-extract:
	@cd ${WRKSRC}/usr/lib; \
	${LN} -s liballeg-4.0.3.so liballeg.so.4.0

.include <bsd.port.mk>
