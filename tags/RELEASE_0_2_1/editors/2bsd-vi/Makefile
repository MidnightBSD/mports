# New ports collection makefile for:	2bsd-vi
# Date created:			2007-04-27
# Whom:				Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

PORTNAME=	vi
PORTVERSION=	050325
CATEGORIES=	editors
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	ex-vi
PKGNAMEPREFIX=	2bsd-
DISTNAME=	ex-${PORTVERSION}

MAINTAINER=	luke@midnightbsd.org
COMMENT=	The original vi editor

USE_BZIP2=	yes

MAN1=	ex.1 vi.1
MLINKS=	ex.1 edit.1  vi.1 vedit.1  vi.1 view.1

.include <bsd.port.pre.mk>

pre-build:
	@${REINPLACE_CMD} \
	-e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
	${WRKSRC}/Makefile

.include <bsd.port.post.mk>
