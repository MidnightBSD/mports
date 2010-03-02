# $MidnightBSD: mports/devel/gnustep-make/Makefile,v 1.11 2009/02/09 07:26:18 laffer1 Exp $

PORTNAME=	gnustep-make
PORTVERSION=	2.2.0
CATEGORIES=	devel gnustep
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	core

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep makefile package
LICENSE=	gpl3

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	
MAKE_FLAGS=	OPTFLAG="${CFLAGS}"
CFLAGS+=	${PTHREAD_CFLAGS}
CONFIGURE_ENV+=	INSTALL_PROGRAM="${INSTALL} -c" INSTALL_DATA="${INSTALL} -c" \
		CFLAGS="${CFLAGS}"
CONFIGURE_ARGS+=	--with-thread-lib="${PTHREAD_LIBS}"
CONFIGURE_ARGS+=	--with-config-file=${GNUSTEP_PREFIX}/GNUstep.conf

.if defined(GNUSTEP_WITH_BASE_GCC)
GNUSTEP_WITHOUT_LIBOBJC=	yes
.endif

post-patch:
	${REINPLACE_CMD} -e 's|/usr/local/|${LOCALBASE}/|' \
		${WRKSRC}/configure

post-install:
	${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}
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
