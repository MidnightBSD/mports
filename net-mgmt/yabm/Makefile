# $FreeBSD: ports/net-mgmt/yabm/Makefile,v 1.3 2005/07/03 01:45:54 dannyboy Exp $
# $MidnightBSD: mports/net-mgmt/yabm/Makefile,v 1.3 2010/05/08 17:29:49 laffer1 Exp $

PORTNAME=	yabm
PORTVERSION=	0.2.1
CATEGORIES=	net-mgmt
MASTER_SITES=	http://www.shapeshifter.se/code/yabm/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Yet Another Bandwidth Meter, somewhat resembles the Linux bwbar
LICENSE=	bsd2

LIB_DEPENDS=	png15:${PORTSDIR}/graphics/png

USE_RC_SUBR=	yes
RC_SCRIPTS_SUB=	PREFIX=${PREFIX} RC_SUBR=${RC_SUBR}

SUB_FILES=	pkg-message

post-extract:
	@${SED} ${RC_SCRIPTS_SUB:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/} \
		${WRKSRC}/scripts/yabm.sh.sample > ${WRKSRC}/scripts/yabm.sh

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/yabm.sh ${PREFIX}/etc/rc.d/yabm.sh

.include <bsd.port.mk>
