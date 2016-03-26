# New ports collection makefile for:    gworkspace
# Date created:         04 Feb 2003
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD$
# $FreeBSD: ports/deskutils/gworkspace/Makefile,v 1.27 2006/09/01 17:12:26 dinoex Exp $
#

PORTNAME=	gworkspace
PORTVERSION=	0.9.3
PORTREVISION=	1
CATEGORIES=	deskutils gnustep
#MASTER_SITES=	http://www.gnustep.it/enrico/gworkspace/
MASTER_SITES=	GNUSTEP/usr-apps

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep workspace manager

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build
USE_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

GNU_CONFIGURE=	yes
ADDITIONAL_LDFLAGS+=	-L${WRKSRC}/FSNode/FSNode.framework/Versions/A

.if defined(WITHOUT_GHOSTSCRIPT)
PLIST_SUB+=	PDFVIEW="@comment "
.else
PLIST_SUB+=	PDFVIEW=""
USE_GHOSTSCRIPT=	yes
.endif

pre-configure:
	${RM} -rf ${WRKSRC}/GWMetadata

.include <bsd.port.mk>
