# New ports collection makefile for:   inadyn
# Date created:        9 September 2005
# Whom:                Alex Samorukov <samm@os2.kiev.ua>
#
# $MidnightBSD$
# $FreeBSD: ports/dns/inadyn/Makefile,v 1.6 2007/09/12 21:20:29 edwin Exp $
#

PORTNAME=	inadyn
PORTVERSION=	1.96.2
CATEGORIES=	dns
MASTER_SITES=	http://inadyn.ina-tech.net/ \
		http://www.mirrorservice.org/sites/ftp.freebsd.org/pub/FreeBSD/ports/distfiles/
DISTNAME=	${PORTNAME}.v${PORTVERSION}
EXTRACT_SUFX=	.zip

MAINTAINER=	ports@midnightbsd.org
COMMENT=	INADYN - Simple DYNAMIC DNS client
LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${PORTNAME}
USE_ZIP=	yes
USE_DOS2UNIX=	yes
USE_GMAKE=	yes
MAKEFILE=	makefile

MAN8=		inadyn.8
MAN5=		inadyn.conf.5
MANCOMPRESSED=	no

PORTDOCS=	readme.html
PLIST_FILES=	bin/inadyn

NO_INSTALL_MANPAGES=yes

post-patch:
	@${REINPLACE_CMD} -e 's|gcc|$$\(CC\)|g' ${WRKSRC}/makefile
	${REINPLACE_CMD} -e "s,%%PREFIX%%,${PREFIX},g" \
		${WRKSRC}/man/inadyn.8 ${WRKSRC}/readme.html \
		${WRKSRC}/src/dyndns.h

do-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/${PORTDOCS} ${DOCSDIR}
.endif
	 ${INSTALL_SCRIPT} ${WRKSRC}/bin/linux/inadyn ${PREFIX}/bin
	 ${INSTALL_SCRIPT} ${WRKSRC}/man/inadyn.8 ${MANPREFIX}/man/man8
	 ${INSTALL_SCRIPT} ${WRKSRC}/man/inadyn.conf.5 ${MANPREFIX}/man/man5

.include <bsd.port.mk>
