# New ports collection makefile for:	irssi-scripts
# Date created:				Jul 14 2005
# Whom:					Alexey Mikhailov <karma@ez.pereslavl.ru>
#
# $MidnightBSD: mports/irc/irssi-scripts/Makefile,v 1.3 2007/08/30 18:49:32 laffer1 Exp $
# $FreeBSD: ports/irc/irssi-scripts/Makefile,v 1.4 2007/02/27 00:04:45 linimon Exp $
#

PORTNAME=	irssi-scripts
PORTVERSION=	20070925
CATEGORIES=	irc
MASTER_SITES=	http://ftp.debian.org/debian/pool/main/i/${PORTNAME}/
DISTFILES=	${PORTNAME}_${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of useful scripts for the irssi IRC-client
LICENSE=	unknown

RUN_DEPENDS=	irssi:${PORTSDIR}/irc/irssi

USE_PERL5=	yes
NO_BUILD=	yes

do-install:
	${MKDIR} ${PREFIX}/share/irssi/scripts
	${INSTALL_SCRIPT} ${WRKDIR}/trunk/scripts/*.pl ${PREFIX}/share/irssi/scripts

.include <bsd.port.mk>
