# $MidnightBSD: mports/devel/cvstrac/Makefile,v 1.3 2010/05/08 02:14:51 laffer1 Exp $

PORTNAME?=	cvstrac
PORTVERSION=	2.0.1
PORTREVISOIN=	2
CATEGORIES=	devel
MASTER_SITES=	http://www.cvstrac.org/
DISTNAME=	cvstrac-${PORTVERSION}

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web-Based Bug And Patch-Set Tracking System For CVS
LICENSE=	gpl2

WRKSRC=		${WRKDIR}/cvstrac-${PORTVERSION}
USE_SQLITE=	yes
USE_GNOME=	pkgconfig
USE_GMAKE=	yes
MAKE_JOBS_UNSAFE=	yes

MAKE_ARGS+=	SRCDIR=${WRKSRC} PREFIX=${PREFIX} LOCALBASE=${LOCALBASE}

NOMAN=
PLIST_FILES=	bin/${PORTNAME}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
