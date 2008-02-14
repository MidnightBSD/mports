# New ports collection makefile for:	aria2
# Date created:		1 May 2006
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $MidnightBSD: mports/www/aria2/Makefile,v 1.1 2007/08/11 23:30:01 laffer1 Exp $
# $FreeBSD: ports/www/aria2/Makefile,v 1.27 2007/08/09 17:09:00 sat Exp $
#

PORTNAME=	aria2
DISTVERSION=	0.12.0
CATEGORIES=	www
MASTER_SITES=	SFE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Another download tool with metalinks support
LICENSE=	gpl2

CONFIGURE_ARGS=	--with-libintl-prefix=${LOCALBASE} --with-openssl \
		--with-libxml2 --without-gnutls --without-libares --without-libcares \
		--program-transform-name="" --prefix=${PREFIX}

USE_BZIP2=	yes
USE_GNOME=	gnomehack libxml2
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
PLIST_FILES=	bin/aria2c \
		share/locale/de/LC_MESSAGES/aria2c.mo \
		share/locale/ja/LC_MESSAGES/aria2c.mo \
		share/locale/ru/LC_MESSAGES/aria2c.mo
#MAN1=		aria2c.1

.ifdef WITHOUT_NLS
CONFIGURE_ARGS+=	--disable-nls
.else
LINGUAS=	ca de es fr it ja nl pt_BR ru sv
.endif


post-configure:
	@${REINPLACE_CMD} -e '/SETMODE/d' ${WRKSRC}/config.h

post-install:
	@${CP} ${WRKSRC}/doc/aria2c.1 ${FAKEDIR}/usr/local/man/man1/

.include <bsd.port.mk>
