# $MidnightBSD: mports/www/youtube_dl/Makefile,v 1.6 2009/10/13 01:37:48 laffer1 Exp $

PORTNAME=	youtube_dl
PORTVERSION=	2010.10.03
CATEGORIES=	www
MASTER_SITES=	http://bitbucket.org/rg3/youtube-dl/raw/${PORTVERSION}/
DISTNAME=	youtube-dl
EXTRACT_SUFX=
DIST_SUBDIR=	${PORTNAME}/${PORTVERSION}
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A program for downloading videos from YouTube.com
LICENSE=	publicdom

NO_WRKSUBDIR=	yes
NO_BUILD=	yes

USE_PYTHON=	2.5+

PLIST_FILES=	bin/youtube-dl

post-extract:
	@${CP} ${DISTDIR}/${DIST_SUBDIR}/${DISTNAME} ${WRKSRC}/youtube-dl

do-install:
	@${INSTALL_SCRIPT} ${WRKSRC}/youtube-dl ${PREFIX}/bin/youtube-dl

.include <bsd.port.mk>
