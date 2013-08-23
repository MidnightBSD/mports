# $MidnightBSD: mports/textproc/wv2/Makefile,v 1.8 2013/03/31 15:16:34 laffer1 Exp $

PORTNAME=	wv2
PORTVERSION=	0.4.2
PORTREVISION=	3
CATEGORIES=	textproc
MASTER_SITES=	SF/wvware/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library providing routines to access Microsoft Word files
LICENSE=	lgpl

USE_GNOME=	libgsf
USE_BZIP2=	yes
USES=		cmake iconv
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|LIBGSF_INCLUDE_DIR|PC_LIBGSF_INCLUDE_DIRS|g' \
		-e 's|LIBGSF_LIBRARIES|PC_LIBGSF_LIBRARIES|g' \
		${WRKSRC}/CMakeLists.txt
	@${REINPLACE_CMD} -e 's|glib/giochannel.h|glib.h|g' \
		${WRKSRC}/src/olestream.h

.include <bsd.port.mk>
