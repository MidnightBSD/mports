# New ports collection makefile for:    bozohttpd
# Date created:         21.03.2002
# Whom:                 Janos.Mohacsi@bsd.hu
#
# $MidnightBSD: mports/www/bozohttpd/Makefile,v 1.3 2008/02/15 02:03:00 laffer1 Exp $
# $FreeBSD: ports/www/bozohttpd/Makefile,v 1.12 2006/07/08 05:16:35 clsung Exp $
#

PORTNAME=	bozohttpd
PORTVERSION=	20080303
CATEGORIES=	www ipv6
MASTER_SITES=	http://www.eterna.com.au/bozohttpd/ \
		${MASTER_SITE_NETBSD}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The bozotic HTTP server
LICENSE=	bsd3

FAKE_OPTS=	trueprefix
USE_BZIP2=	YES
USE_RC_SUBR=	bozohttpd

.if defined(WITH_HTPASSWD_SUPPORT)
CFLAGS+=	-DDO_HTPASSWD
MAKE_ARGS+=	'LDFLAGS+= -lcrypt'
.endif

.if !defined(WITHOUT_SSL)
USE_OPENSSL=	yes
CFLAGS+=	-UNO_SSL_SUPPORT
.else
CFLAGS+=	-DNO_SSL_SUPPORT
.endif

.if defined(NO_CGI)
CFLAGS+=	-DNO_CGIBIN_SUPPORT
.else
CFLAGS+=	-UNO_CGIBIN_SUPPORT
.endif

MAN8=		bozohttpd.8
MANCOMPRESSED=	maybe
PLIST_FILES=	libexec/bozohttpd

.include <bsd.port.mk>
