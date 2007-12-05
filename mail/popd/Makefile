# New ports collection makefile for:	popd
# Date created:				17 April 2001
# Whom:					ianf@za.uu.net
#
# $FreeBSD: ports/mail/popd/Makefile,v 1.19 2005/06/16 16:35:10 ume Exp $
# $MidnightBSD: mports/mail/popd/Makefile,v 1.2 2007/05/09 16:51:56 ctriv Exp $
#

PORTNAME=	popd
PORTVERSION=	2.2.2a
PORTREVISION=	4
CATEGORIES=	mail
MASTER_SITES=	ftp://ftp3.za.freebsd.org/pub/popd/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Very fast, highly configurable POP3 server (fully RFC1939 compliant)
LICENSE=	bsd2

MAN5=	popd.conf.5
MAN8=	popd.8

FAKE_OPTS=	trueprefix
USE_LDCONFIG=	yes
MANCOMPRESSED=	maybe
.if defined(NOPROFILE)
PLIST_SUB=	NOPROFILE="@comment "
.else
PLIST_SUB=	NOPROFILE=""
.endif

post-install:
	${INSTALL_DATA} ${WRKSRC}/src/popd.conf.default ${PREFIX}/etc/.

.include <bsd.port.mk>
