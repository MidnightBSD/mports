# New ports collection makefile for:	2bsd-vi
# Date created:			2007-04-27
# Whom:				Lucas Holt <luke@midnightbsd.org>

PORTNAME=	vi
PORTVERSION=	050325
PORTREVISION=	2
CATEGORIES=	editors
MASTER_SITES=	SF/ex-${PORTNAME}/ex-${PORTNAME}/${PORTVERSION}
PKGNAMEPREFIX=	2bsd-
DISTNAME=	ex-${PORTVERSION}

MAINTAINER=	luke@midnightbsd.org
COMMENT=	The original vi editor
WWW=		https://ex-vi.sourceforge.net/

LICENSE=	bsd4
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		ncurses tar:bzip2

PRESERVEDIR=	/var/preserve/${UNIQUENAME}
PLIST_SUB=	PRESERVEDIR="${PRESERVEDIR}"

.include <bsd.port.pre.mk>

pre-build:
	@${REINPLACE_CMD} \
	-e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
	${WRKSRC}/Makefile

.include <bsd.port.post.mk>
