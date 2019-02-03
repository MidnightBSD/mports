# $MidnightBSD$
# $FreeBSD: ports/sysutils/openupsd/Makefile,v 1.3 2005/12/01 16:50:07 tdb Exp $

PORTNAME=	openupsd
PORTVERSION=	0.3.1
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	http://frmb.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	UPS daemon for some Belkin UPS's

LICENSE=	gpl2

USE_RC_SUBR=	${PORTNAME}
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-transform-name= --bindir=${PREFIX}/sbin

PLIST_FILES=	sbin/openupsd etc/openupsd.conf.sample

post-install:
	${INSTALL_DATA} ${WRKSRC}/openupsd.conf ${PREFIX}/etc/openupsd.conf.sample

.include <bsd.port.mk>
