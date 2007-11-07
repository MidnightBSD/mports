# New ports collection makefile for:    gworkspace
# Date created:         04 Feb 2003
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/deskutils/gworkspace/Makefile,v 1.3 2007/07/29 16:03:49 laffer1 Exp $
# $FreeBSD: ports/deskutils/gworkspace/Makefile,v 1.27 2006/09/01 17:12:26 dinoex Exp $
#

PORTNAME=	gworkspace
PORTVERSION=	0.8.6
PORTREVISION=	1
CATEGORIES=	deskutils
MASTER_SITES=	http://www.gnustep.it/enrico/gworkspace/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep workspace manager

WRKSRC=		${WRKDIR}/GWorkspace-${PORTVERSION}
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_CONFIGURE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
MAKEFILE=	GNUmakefile
ADDITIONAL_LDFLAGS+=	-L${WRKSRC}/FSNode/FSNode.framework/Versions/A
MAKE_ENV+=	ADDITIONAL_LDFLAGS="${ADDITIONAL_LDFLAGS}"
DEFAULT_LIBVERSION2=	0.1.0
PLIST_SUB+=	LIBVERSION2=${DEFAULT_LIBVERSION2}
PLIST_SUB+=	MAJORLIBVERSION2=${DEFAULT_LIBVERSION2:C/([0-9]).*/\1/1}

.if defined(WITHOUT_GHOSTSCRIPT)
PLIST_SUB+=	PDFVIEW="@comment "
.else
PLIST_SUB+=	PDFVIEW=""
USE_GHOSTSCRIPT=	yes
.endif

.include <bsd.port.mk>
