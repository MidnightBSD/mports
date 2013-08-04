# $MidnightBSD: mports/net/sharity-light/Makefile,v 1.2 2013/02/18 03:44:07 laffer1 Exp $

PORTNAME=	sharity-light
PORTVERSION=	1.3
PORTREVISION=	2
CATEGORIES=	net
MASTER_SITES=	http://www.obdev.at/ftp/pub/Products/Sharity-Light/
DISTNAME=	Sharity-Light.1.3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Userland smbfs --- SMB to NFS protocols converter

LICENSE=	gpl2

MAN8=		smbmount.8

PLIST_FILES=	sbin/shlight sbin/unshlight
PORTDOCS=	*

.include <bsd.mport.options.mk>

post-extract:
	@${MKDIR} ${WRKDIR}/unshlight
	@${CP} ${FILESDIR}/unshlight.c ${WRKDIR}/unshlight
	@${CP} ${FILESDIR}/Makefile.unshlight ${WRKDIR}/unshlight/Makefile

post-patch:
.if ${OSVERSION} >= 4015
	${REINPLACE_CMD} -e "s,#.*include <nfs/rpcv2.h>,," ${WRKSRC}/nfs/syscalls.c
.endif

post-build:
	cd ${WRKDIR}/unshlight && make

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/shlight ${PREFIX}/sbin
	${INSTALL_PROGRAM} ${WRKDIR}/unshlight/unshlight ${PREFIX}/sbin
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}/README
	${INSTALL_DATA} ${WRKSRC}/FAQ.txt ${DOCSDIR}/FAQ
.endif
	${INSTALL_MAN} ${WRKSRC}/smbmount.8 ${PREFIX}/man/man8

.include <bsd.port.mk>
