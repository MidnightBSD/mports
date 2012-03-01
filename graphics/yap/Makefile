# $MidnightBSD: mports/graphics/yap/Makefile,v 1.3 2009/02/22 23:55:26 laffer1 Exp $

PORTNAME=	yap
PORTVERSION=	0.2
PORTREVISION=	4
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://www.gnustep.it/marko/GPSText/ \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
DISTNAME=	Yap
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	repacked/2007-02-15

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep a2ps/gs frontend
LICENSE=	gpl2

RUN_DEPENDS+=	a2ps:${PORTSDIR}/print/a2ps-${PAPERSIZE}

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GHOSTSCRIPT_RUN=	yes

# - PAPERSIZE		Use PAPERSIZE as in a2ps port, default to letter.
PAPERSIZE?=	letter

.if ${PAPERSIZE} != a4 && ${PAPERSIZE} != letter && ${PAPERSIZE} != letterdj
.BEGIN:
	@${ECHO_CMD} "PAPERSIZE incorrect value: ${PAPERSIZE}."
	@${ECHO_CMD}
	@${ECHO_CMD} "Must specify PAPERSIZE as one of a4, letter, or letterdj."
	@${ECHO_CMD} "letterdj allows a slightly larger margins for DeskJets."
	@${FALSE}
.endif

.include <bsd.port.mk>
