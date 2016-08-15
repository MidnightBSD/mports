# $MidnightBSD$
# $FreeBSD: head/deskutils/gnustep-wrapper/Makefile 390044 2015-06-18 19:45:16Z amdmi3 $

PORTNAME=	wrapper
PORTVERSION=	0.1.0
CATEGORIES=	deskutils gnustep
#MASTER_SITES=	ftp://ftp.raffael.ch/software/GNUstepWrapper/
MASTER_SITES=	FREEBSD_LOCAL/dinoex
PKGNAMEPREFIX=	gnustep-
DISTNAME=	GNUstepWrapper-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create GNUstep app-wrappers of non-GNUstep applications

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gnustep
USE_GNUSTEP=	back build
USE_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

ADDITIONAL_LIB_DIRS+=	-L${WRKSRC}/libGSWrapper/obj
MAKE_ENV+=	GNUSTEP_INSTALLATION_DOMAIN=SYSTEM
MAKE_FLAGS+=	debug=no

post-patch:
	${REINPLACE_CMD} -e 's|cp -u|#cp -p|' \
		${WRKSRC}/WrapperFactory/GNUmakefile.postamble
	${REINPLACE_CMD} -e 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		${WRKSRC}/GNUmakefile

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/Launcher/obj/GSWrapper_Launcher \
		${FAKE_DESTDIR}${GNUSTEP_SYSTEM_ROOT}/Applications/WrapperFactory.app/Resources/
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Tools/GSWrapper_Launcher
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Library/Libraries/libGSWrapper.so
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/WrapperFactory.app/WrapperFactory

.include <bsd.port.mk>
