# New ports collection makefile for:	aria2
# Date created:		1 May 2006
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $MidnightBSD: mports/www/aria2/Makefile,v 1.3 2008/06/10 03:23:54 laffer1 Exp $
# $FreeBSD: ports/www/aria2/Makefile,v 1.27 2007/08/09 17:09:00 sat Exp $
#

PORTNAME=	aria2
DISTVERSION=	0.15.0
CATEGORIES=	www
MASTER_SITES=	SFE
DISTNAME=	${PORTNAME}c-${DISTVERSION}

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
#MAN1=		aria2c.1

.ifdef WITHOUT_NLS
CONFIGURE_ARGS+=	--disable-nls
.else
LINGUAS=	ca de es fi fr he hu id it ja nl nn pl pt_BR ru sv th zh_CN
.endif

post-configure:
	@${REINPLACE_CMD} -e '/SETMODE/d' ${WRKSRC}/config.h

post-patch:
	@${REINPLACE_CMD} -e '/^install-data-am:/s|install-dist_docDATA||'\
		${WRKSRC}/Makefile.in ${WRKSRC}/doc/Makefile.in

post-install:
	@${CP} ${WRKSRC}/doc/aria2c.1 ${FAKEDIR}/usr/local/man/man1/

.include <bsd.port.mk>
