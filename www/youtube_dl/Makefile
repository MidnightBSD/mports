# New ports collection makefile for:	youtube_dl
# Date created:		2006-08-12
# Whom:			Pankov Pavel <pankov_p@mail.ru>
#
# $FreeBSD: ports/www/youtube_dl/Makefile,v 1.2 2006/09/05 17:32:56 miwi Exp $
# $MidnightBSD: mports/www/youtube_dl/Makefile,v 1.1 2006/11/24 23:57:07 laffer1 Exp $
#

PORTNAME=	youtube_dl
PORTVERSION=	2008.07.26
CATEGORIES=	www
MASTER_SITES=	http://www.arrakis.es/~rggi3/youtube-dl/
DISTFILES=	youtube-dl-${PORTVERSION}
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A program for downloading videos from YouTube.com
LICENSE=	publicdom

NO_WRKSUBDIR=	yes
NO_BUILD=	yes

USE_PYTHON=	2.4+

PLIST_FILES=	bin/youtube-dl

post-extract:
	@${CP} ${DISTDIR}/youtube-dl-${PORTVERSION} ${WRKSRC}/youtube-dl

post-patch:
	@${REINPLACE_CMD} -e 's|%%PYTHON_CMD%%|${PYTHON_CMD}|g' ${WRKSRC}/youtube-dl

do-install:
	@${INSTALL_SCRIPT} ${WRKSRC}/youtube-dl ${TARGETDIR}/bin/youtube-dl

.include <bsd.port.mk>
