# New ports collection makefile for:	giFTcurs
# Date created:		2003-09-04
# Whom:			Stefan Ehmann <shoesoft@gmx.net>
#
# $MidnightBSD: mports/net-p2p/giftcurs/Makefile,v 1.1 2007/06/11 00:03:44 laffer1 Exp $
# $FreeBSD: ports/net-p2p/giftcurs/Makefile,v 1.8 2006/01/30 21:36:15 pav Exp $
#

PORTNAME=	giFTcurs
PORTVERSION=	0.6.2
PORTREVISION=	5
CATEGORIES=	net-p2p
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	giftcurs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A cursed frontend to the giFT daemon
LICENSE=	gpl2

RUN_DEPENDS=	${LOCALBASE}/bin/giftd:${PORTSDIR}/net-p2p/gift

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	glib20

MAN1=	giFTcurs.1
MAN5=	giFTcurs.conf.5

DOC_FILES=	AUTHORS COPYING ChangeLog \
		INSTALL NEWS README TODO

post-install:
.ifndef(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for doc in ${DOC_FILES}
	@${INSTALL_DATA} ${WRKSRC}/${doc} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
