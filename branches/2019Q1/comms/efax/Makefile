# $MidnightBSD$
#

PORTNAME=	efax-0.9a
PORTVERSION=	001114a7
PORTREVISION=	0
CATEGORIES=	comms
MASTER_SITES=	http://shino.pos.to/linux/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fax send/receive program
LICENSE=	gpl2

RUN_DEPENDS=	xloadimage:${PORTSDIR}/x11/xloadimage

USE_GMAKE=	YES
DOCDIR=		${PREFIX}/share/doc/efax
MAKE_ENV=	INSTALL_PROGRAM="${INSTALL_PROGRAM}" \
		INSTALL_SCRIPT="${INSTALL_SCRIPT}" \
		INSTALL_DATA="${INSTALL_DATA}"

post-build:
	${MV} ${WRKSRC}/fax ${WRKSRC}/fax.orig
	${CAT} ${WRKSRC}/fax.orig | ${SED} -e s!%%PREFIX%%!${PREFIX}!g > \
		${WRKSRC}/fax

post-install:
	${INSTALL_DATA} ${WRKSRC}/efax.rc.sample ${PREFIX}/etc
	${INSTALL_DATA} ${WRKSRC}/efax.rc.sample.ja ${PREFIX}/etc
	${MKDIR}	${DOCDIR}
.for i in COPYING README printcap.sample efax.html fax.html
	${INSTALL_DATA}	${WRKSRC}/${i}	${DOCDIR}
.endfor
	${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL

.include <bsd.port.mk>
