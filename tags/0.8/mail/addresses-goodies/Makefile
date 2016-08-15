# $MidnightBSD$
# $FreeBSD: ports/mail/addresses-goodies/Makefile,v 1.4 2007/01/31 18:18:04 dinoex Exp $

PORTNAME=	addresses
PORTVERSION=	0.4.8
PORTREVISION=	5
CATEGORIES=	mail gnustep
MASTER_SITES=	SAVANNAH/gap
PKGNAMESUFFIX=	-goodies${PKGNAMESUFFIX2}
DISTNAME=	Addresses-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Goodies for addressbook for GNUstep

LICENSE=	lgpl2.1

USES=		gnustep
USE_GNUSTEP=	back build

LIB_DEPENDS=	libInspector.so:${PORTSDIR}/deskutils/gworkspace \
		libAddresses.so:${PORTSDIR}/mail/addresses
USE_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

UNIQUENAME=	${PKGNAMEPREFIX}${PORTNAME}${PKGNAMESUFFIX}
WRKSRC=		${WRKDIR}/Addresses-${PORTVERSION}/Goodies

post-patch:
	${REINPLACE_CMD} -e 's|LDAPAddressBook||' \
		-e 's|VCFViewer||' \
		${WRKSRC}/GNUmakefile
	${REINPLACE_CMD} -e 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		-e 's|Library/GWorkspace|Library/Bundles|' \
		-e 's|-lGWorkspace|-lInspector|' \
		${WRKSRC}/VCFViewer/GNUmakefile
	${REINPLACE_CMD} -e 's|<GWorkspace/|<Inspector/|' \
		${WRKSRC}/VCFViewer/VCFViewer.h

.include <bsd.port.mk>
