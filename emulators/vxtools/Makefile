# $MidnightBSD: mports/emulators/vxtools/Makefile,v 1.2 2008/10/16 22:11:08 laffer1 Exp $
# $FreeBSD: ports/emulators/vxtools/Makefile,v 1.4 2004/02/04 05:20:09 marcus Exp $
#

PORTNAME=	vxtools
PORTVERSION=	0.2
PORTREVISION=	2
CATEGORIES=	emulators
MASTER_SITES=	ftp://ftp.penguin.cz/pub/users/mhi/vxfs/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command-line utilities for reading Veritas Filesystem (VxFS)
LICENSE=	gpl2

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes

MAN1=		vxmount.1 vxumount.1
MAN8=		prtvtoc.8

do-install:
	@ ${INSTALL_PROGRAM} ${WRKSRC}/vxls ${PREFIX}/bin
	@ ${INSTALL_PROGRAM} ${WRKSRC}/vxmount ${PREFIX}/bin
	@ ${INSTALL_PROGRAM} ${WRKSRC}/vxumount ${PREFIX}/bin
	@ ${INSTALL_PROGRAM} ${WRKSRC}/vxcat ${PREFIX}/bin
	@ ${INSTALL_PROGRAM} ${WRKSRC}/vxidump ${PREFIX}/bin
	@ ${INSTALL_PROGRAM} ${WRKSRC}/vxcd ${PREFIX}/bin
	@ ${INSTALL_PROGRAM} ${WRKSRC}/vxpwd ${PREFIX}/bin
	@ ${INSTALL_PROGRAM} ${WRKSRC}/prtvtoc ${PREFIX}/bin
	@ ${INSTALL_MAN} ${WRKSRC}/prtvtoc.8 ${PREFIX}/man/man8
	@ ${INSTALL_MAN} ${WRKSRC}/vxmount.1 ${PREFIX}/man/man1
	@ ${INSTALL_MAN} ${WRKSRC}/vxumount.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
