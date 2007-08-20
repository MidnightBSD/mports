# New ports collection makefile for:	irssi-scripts
# Date created:				Jul 14 2005
# Whom:					Alexey Mikhailov <karma@ez.pereslavl.ru>
#
# $MidnightBSD: mports/irc/irssi-scripts/Makefile,v 1.1 2007/03/22 18:29:25 laffer1 Exp $
# $FreeBSD: ports/irc/irssi-scripts/Makefile,v 1.4 2007/02/27 00:04:45 linimon Exp $
#

PORTNAME=	irssi-scripts
PORTVERSION=	20061009
CATEGORIES=	irc
MASTER_SITES=	http://ftp.debian.org/debian/pool/main/i/${PORTNAME}/
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of useful scripts for the irssi IRC-client

RUN_DEPENDS=	irssi:${PORTSDIR}/irc/irssi

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

USE_GCPIO=	yes
NO_BUILD=	yes

do-install:
	cd ${WRKSRC} &&	tar xzf scripts.tar.gz && cd scripts && \
	${FIND} . | ${CPIO} --quiet -pdm -L -R ${LIBOWN}:${LIBGRP} \
	${PREFIX}/share/irssi/scripts

.include <bsd.port.mk>
