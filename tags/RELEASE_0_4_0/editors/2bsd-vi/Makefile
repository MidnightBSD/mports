# New ports collection makefile for:	2bsd-vi
# Date created:			2007-04-27
# Whom:				Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/editors/2bsd-vi/Makefile,v 1.2 2008/10/16 21:59:00 laffer1 Exp $
#

PORTNAME=	vi
PORTVERSION=	050325
CATEGORIES=	editors
MASTER_SITES=	SF/ex-${PORTNAME}/ex-${PORTNAME}/${PORTVERSION}
PKGNAMEPREFIX=	2bsd-
DISTNAME=	ex-${PORTVERSION}

MAINTAINER=	luke@midnightbsd.org
COMMENT=	The original vi editor
LICENSE=	bsd4

USE_BZIP2=	yes

MAN1=	ex.1 vi.1
MLINKS=	ex.1 edit.1  vi.1 vedit.1  vi.1 view.1

.include <bsd.port.pre.mk>

pre-build:
	@${REINPLACE_CMD} \
	-e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
	${WRKSRC}/Makefile

.include <bsd.port.post.mk>
