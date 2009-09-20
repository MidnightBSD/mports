# New ports collection makefile for:    wv2
# Date created:         Do 28 Aug 2003 15:50:37 CEST
# Whom:                 lofi@freebsd.org
#
# $FreeBSD: ports/textproc/wv2/Makefile,v 1.17 2006/05/27 10:26:18 lofi Exp $
# $MidnightBSD: mports/textproc/wv2/Makefile,v 1.4 2008/06/29 23:00:26 laffer1 Exp $
#

PORTNAME=	wv2
PORTVERSION=	0.2.3
CATEGORIES=	textproc
MASTER_SITES=	SF
MASTER_SITE_SUBDIR=	wvware

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library providing routines to access Microsoft Word files
LICENSE=	lgpl

LIB_DEPENDS=	iconv:${PORTSDIR}/converters/libiconv

CONFIGURE_ARGS=	--with-libiconv=${LOCALBASE} --disable-debug

USE_GNOME=	gnometarget libgsf
USE_ICONV=	yes
USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes

pre-configure:
	@${REINPLACE_CMD} "s,-pedantic ,," ${WRKSRC}/configure

.include <bsd.port.mk>
