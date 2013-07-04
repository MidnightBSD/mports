# $MidnightBSD: mports/net/44bsd-rdist/Makefile,v 1.2 2009/06/09 20:46:36 crash Exp $

PORTNAME=	44bsd-rdist
PORTVERSION=	20001111
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	cy

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The traditional 4.4BSD rdist
LICENSE=        bsd3
USE_BZIP2=	yes

NO_WRKSUBDIR=	yes
MAN1=		44bsd-rdist.1
PLIST_FILES=	bin/44bsd-rdist

post-extract:
	cd ${WRKSRC} ; co RCS/*,v

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/rdist ${PREFIX}/bin/44bsd-rdist
	${INSTALL_MAN} ${WRKSRC}/rdist.1 ${PREFIX}/man/man1/44bsd-rdist.1

tarup:
	-cd ${WRKSRC} ; ${RM} *
	cd ${WRKSRC} ; ${TAR} cvyf /tmp/${PORTNAME}-${PORTVERSION}${EXTRACT_SUFX} .

.include <bsd.port.mk>
