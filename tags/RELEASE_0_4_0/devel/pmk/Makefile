# $MidnightBSD: mports/devel/pmk/Makefile,v 1.5 2009/04/08 20:49:45 laffer1 Exp $

PORTNAME=	pmk
PORTVERSION=	0.10.4
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pre Make Kit, a sane replacement for autoconf
LICENSE=	bsd3

PKGINSTALL=	${WRKDIR}/pkg-install

MAN1=	pmk.1 pmkscan.1 pmkinstall.1 pmkpc.1
MAN5=	pmk.conf.5 pmkfile.5 pmksyntax.5 scanfile.5
MAN8=	pmksetup.8

do-configure:
	cd ${WRKSRC}; SYSCONFDIR=${PREFIX}/etc ./pmkcfg.sh

post-build:
	@${CAT} ${PKGDIR}/pkg-install | ${SED} -e 's,%%PREFIX%%,${PREFIX},g' > ${PKGINSTALL}

.include <bsd.port.mk>
