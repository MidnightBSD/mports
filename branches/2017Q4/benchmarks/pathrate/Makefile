# $MidnightBSD$

PORTNAME=	pathrate
PORTVERSION=	2.4.1
CATEGORIES=	benchmarks
MASTER_SITES=	http://www.cc.gatech.edu/fac/Constantinos.Dovrolis/
DISTNAME=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Measurement tool for capacity estimation of network paths

LICENSE=	gpl2

GNU_CONFIGURE=	yes
USE_GMAKE=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}_${PORTVERSION}
MAKEFILE=	makefile

PLIST_FILES=	bin/pathrate_rcv bin/pathrate_snd

do-install:
.for f in pathrate_rcv pathrate_snd
	${INSTALL_PROGRAM} ${WRKSRC}/${f} ${PREFIX}/bin
.endfor

.include <bsd.port.mk>
