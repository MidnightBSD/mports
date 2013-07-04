# New ports collection makefile for:	hot-babe
# Date created:		2004-11-06
# Whom:			Roman Bogorodskiy <bogorodskiy@inbox.ru>
#
# $MidnightBSD: mports/deskutils/hot-babe/Makefile,v 1.2 2008/06/19 22:48:09 laffer1 Exp $
# $FreeBSD: ports/deskutils/hot-babe/Makefile,v 1.10 2007/05/19 20:01:39 flz Exp $
#

PORTNAME=	hot-babe
PORTVERSION=	0.2.2
PORTREVISION=	1
CATEGORIES=	deskutils
MASTER_SITES=	http://dindinx.net/hotbabe/downloads/ \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	novel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small utility which displays the system activity in a very special way
LICENSE=	artistic

USE_BZIP2=	yes
USE_X_PREFIX=	yes
MAKE_ARGS+=	PREFIX="${PREFIX}" CC="${CC}"
USE_GNOME=	gtk20

MAN1=	hot-babe.1

PORTDOCS=	ChangeLog NEWS TODO LICENSE CONTRIBUTORS copyright config.example

pre-everything::
	@${ECHO_MSG} "Warning! This port contains some adults only content."
	@${ECHO_MSG} "You might hit Ctrl-C to abort."

post-install:
	${INSTALL_MAN} ${WRKSRC}/hot-babe.1 ${PREFIX}/man/man1
.ifndef (NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for i in ${PORTDOCS}
	@${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
