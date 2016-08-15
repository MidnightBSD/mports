# $MidnightBSD$

PORTNAME=	inadyn
PORTVERSION=	1.96.2
PORTREVISION=	3
CATEGORIES=	dns
MASTER_SITES=	http://www.inatech.eu/inadyn/ \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	dhn
DISTNAME=	${PORTNAME}.v${PORTVERSION}

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Dynamic DNS update client

LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
USE_RC_SUBR=	inadyn
USES=		gmake zip dos2unix
USE_DOS2UNIX=	yes
MAKEFILE=	makefile

PORTDOCS=	readme.html
PLIST_FILES=	bin/inadyn man/man5/inadyn.conf.5.gz man/man8/inadyn.8.gz

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

post-extract:
	${MV} ${WRKDIR}/${PORTNAME} ${WRKDIR}/${PORTNAME}-${PORTVERSION}

pre-patch: dos2unix

post-patch: 
	@${REINPLACE_CMD} -e 's|gcc|$$\(CC\)|g' ${WRKSRC}/makefile
	@${REINPLACE_CMD} -e "s,%%PREFIX%%,${PREFIX},g" \
		${WRKSRC}/man/inadyn.8 ${WRKSRC}/readme.html \
		${WRKSRC}/src/dyndns.h

do-install:
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} -p ${WRKSRC}/${PORTDOCS} ${DOCSDIR}
.endif
	${INSTALL_PROGRAM} ${WRKSRC}/bin/linux/inadyn ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/man/inadyn.8 ${MANPREFIX}/man/man8
	${INSTALL_MAN} ${WRKSRC}/man/inadyn.conf.5 ${MANPREFIX}/man/man5

.include <bsd.port.mk>
