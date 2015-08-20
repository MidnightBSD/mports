# $MidnightBSD$

PORTNAME=	gnustep-make
PORTVERSION=	2.6.7
CATEGORIES=	devel gnustep
MASTER_SITES=	GNUSTEP/core

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep makefile package

LICENSE=	gpl3

USES=		gnustep objc
GNU_CONFIGURE=	yes

MAKE_FLAGS=	OPTFLAG="${CFLAGS}"
CONFIGURE_ENV+=	INSTALL_PROGRAM="${INSTALL} -c" INSTALL_DATA="${INSTALL} -c"
CONFIGURE_ARGS+=	--with-thread-lib=-pthread
CONFIGURE_ARGS+=	--with-config-file=${GNUSTEP_PREFIX}/GNUstep.conf
CONFIGURE_ARGS+=	--with-layout=gnustep
CONFIGURE_ARGS+=	--enable-objc-nonfragile-abi --enable-native-objc-exceptions
GNU_CONFIGURE_PREFIX=	${GNUSTEP_PREFIX}

post-install:
	${LN} -s Library/Makefiles ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Applications
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/ApplicationSupport
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/Bundles
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/ColorPickers
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/Colors
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/DocTemplates
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/Documentation/info
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/Documentation/man
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/Documentation/Developer
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/Documentation/User
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/Fonts
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/Frameworks
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/Headers
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/Images
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/KeyBindings
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/Libraries/Java
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/Libraries/Resources
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/PostScript
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/Services
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/Sounds
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Tools/Java
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Tools/Resources
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/Local/Applications
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/Local/Library/ApplicationSupport
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/Local/Library/Bundles
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/Local/Library/Documentation
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/Local/Library/Frameworks
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/Local/Library/Headers
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/Local/Library/Libraries
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/Local/Library/Preferences
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/Local/Library/Services
	-${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/Local/Tools/Resources

.include <bsd.port.mk>
