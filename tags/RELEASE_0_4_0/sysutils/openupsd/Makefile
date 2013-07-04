# New ports collection makefile for:	openupsd
# Date created:				15 August 2004
# Whom:					Tim Bishop <tim@bishnet.net>
#
# $MidnightBSD: mports/sysutils/openupsd/Makefile,v 1.1 2007/09/01 04:13:57 laffer1 Exp $
# $FreeBSD: ports/sysutils/openupsd/Makefile,v 1.3 2005/12/01 16:50:07 tdb Exp $
#

PORTNAME=	openupsd
PORTVERSION=	0.3.1
CATEGORIES=	sysutils
MASTER_SITES=	http://frmb.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A UPS daemon for some Belkin UPS's
LICENSE=	gpl2

USE_RC_SUBR=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-transform-name= --bindir=${PREFIX}/sbin

PLIST_FILES=	sbin/openupsd etc/openupsd.conf.sample etc/rc.d/openupsd.sh

post-extract:
	@${SED} -e 's#%%RC_SUBR%%#${RC_SUBR}#g' -e 's#%%PREFIX%%#${PREFIX}#g' \
		${FILESDIR}/openupsd.sh > ${WRKDIR}/openupsd.sh

post-install:
	${INSTALL_DATA} ${WRKSRC}/openupsd.conf ${PREFIX}/etc/openupsd.conf.sample
	${INSTALL_SCRIPT} ${WRKDIR}/openupsd.sh ${PREFIX}/etc/rc.d/

.include <bsd.port.mk>
