# New ports collection makefile for:	pmk
# Date created:		October 13, 2003
# Whom:			Sean Chittenden <seanc@FreeBSD.org>
#
# $FreeBSD: ports/devel/pmk/Makefile,v 1.9 2005/10/11 18:35:10 seanc Exp $
#

PORTNAME=	pmk
PORTVERSION=	0.9.3
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	pmk

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pre Make Kit, a sane replacement for autoconf
LICENSE=	bsd4

MAN1=	pmk.1 pmkscan.1 pmkinstall.1 pmkpc.1
MAN5=	pmk.conf.5 pmkfile.5
MAN8=	pmksetup.8

do-configure:
	cd ${WRKSRC}; SYSCONFDIR=${PREFIX}/etc ./pmkcfg.sh


.include <bsd.port.mk>
