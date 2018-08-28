# $MidnightBSD$
# $FreeBSD: ports/irc/irssi-scripts/Makefile,v 1.4 2007/02/27 00:04:45 linimon Exp $

PORTNAME=	irssi-scripts
PORTVERSION=	20100512
CATEGORIES=	irc
MASTER_SITES=	http://ftp.debian.org/debian/pool/main/i/${PORTNAME}/
DISTFILES=	${PORTNAME}_${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of useful scripts for the irssi IRC-client
LICENSE=	unknown

RUN_DEPENDS=	irssi:${PORTSDIR}/irc/irssi

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

USE_PERL5=	yes
NO_BUILD=	yes

do-install:
	${MKDIR} ${PREFIX}/share/irssi/scripts
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/*.pl ${PREFIX}/share/irssi/scripts

.include <bsd.port.mk>
