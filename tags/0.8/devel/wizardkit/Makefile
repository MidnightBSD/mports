# $MidnightBSD$

PORTNAME=	wizardkit
PORTVERSION=	0.1
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://download.gna.org/pmanager/0.2/
DISTNAME=	WizardKit-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework needed by Project Manager

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		tar:bzip2 gnustep
USE_GNUSTEP=	back build
USE_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Library/Frameworks/WizardKit.framework/Versions/0/libWizardKit.so

.include <bsd.port.mk>
