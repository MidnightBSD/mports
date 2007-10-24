# New ports collection makefile for:        tirc IRC-Client
# Date created:		14 August 1999
# Whom:			Dominik Rothert <dr@domix.de>
#
# $MidnightBSD: mports/irc/tirc/Makefile,v 1.1 2007/08/10 21:59:20 laffer1 Exp $
# $FreeBSD: ports/irc/tirc/Makefile,v 1.16 2007/06/14 22:31:00 beech Exp $
#

PORTNAME=	tirc
PORTVERSION=	1.2
PORTREVISION=	1
CATEGORIES=	irc
MASTER_SITES=	${MASTER_SITE_DEBIAN_POOL}
DISTNAME=	${PORTNAME}_${PORTVERSION}.orig

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Token's 'Internet Relay Chat' Client

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-ansi-colours --prefix=${PREFIX}

MAN1=		tirc.1
PLIST_FILES=	bin/tirc share/tirc/tircrc
PLIST_DIRS=	share/tirc

post-patch:
	@${REINPLACE_CMD} -e 's:__PREFIX__:${PREFIX}:g' ${WRKSRC}/*.c ${WRKSRC}/*.1

post-install:
	${STRIP_CMD} ${PREFIX}/bin/tirc
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/dot.tircrc ${DATADIR}/tircrc

.include <bsd.port.mk>
