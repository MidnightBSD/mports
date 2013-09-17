# $MidnightBSD$

PORTNAME=	yabm
PORTVERSION=	0.2.1
PORTREVISION=	2
CATEGORIES=	net-mgmt
MASTER_SITES=	http://www.shapeshifter.se/code/yabm/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Yet Another Bandwidth Meter, somewhat resembles the Linux bwbar

LICENSE=	bsd2

LIB_DEPENDS=	png15:${PORTSDIR}/graphics/png

USE_RC_SUBR=	yes
RC_SCRIPTS_SUB=	PREFIX=${PREFIX} RC_SUBR=/etc/rc.subr

SUB_FILES=	pkg-message

post-extract:
	@${SED} ${RC_SCRIPTS_SUB:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/} \
		${WRKSRC}/scripts/yabm.sh.sample > ${WRKSRC}/scripts/yabm.sh

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/yabm.sh ${PREFIX}/etc/rc.d/yabm.sh

.include <bsd.port.mk>
