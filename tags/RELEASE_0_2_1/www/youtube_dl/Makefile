# New ports collection makefile for:	youtube_dl
# Date created:		2006-08-12
# Whom:			Pankov Pavel <pankov_p@mail.ru>
#
# $FreeBSD: ports/www/youtube_dl/Makefile,v 1.2 2006/09/05 17:32:56 miwi Exp $
# $MidnightBSD$
#

PORTNAME=	youtube_dl
PORTVERSION=	2006.08.28
CATEGORIES=	www
MASTER_SITES=	http://www.arrakis.es/~rggi3/youtube-dl/ \
		http://pankovpv.sovietservers.com/freebsd/ports/distfiles/
DISTFILES=	youtube-dl-${PORTVERSION}
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A program for downloading videos from YouTube.com

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
