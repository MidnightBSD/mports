PORTNAME=	keepass
PORTVERSION=	2.56
CATEGORIES=	security
MASTER_SITES=	SF/${PORTNAME}/KeePass%202.x/${PORTVERSION}
DISTNAME=	KeePass-${PORTVERSION}-Source

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Light-weight and easy-to-use password manager
WWW=		https://keepass.info/

LICENSE=	gpl2+

BUILD_DEPENDS=	icotool:graphics/icoutils
LIB_DEPENDS=	libgcrypt.so:security/libgcrypt \
		libgdiplus.so:x11-toolkits/libgdiplus

USES=		cpe dos2unix gnome mono zip

DOS2UNIX_GLOB=		*.csproj *.sln
EXTRACT_AFTER_ARGS=	-d ${WRKDIR}/${DISTNAME}
INSTALLS_ICONS=		yes
NO_ARCH=		yes
SUB_FILES=		${PORTNAME}.sh
DESKTOP_ENTRIES=	"KeePass" \
			"${COMMENT}" \
			"${PORTNAME}" \
			"keepass.sh" \
			"Utility;" \
			true

OPTIONS_DEFINE=		DEBUG XDOTOOL XSEL
OPTIONS_DEFAULT=	XDOTOOL XSEL

XDOTOOL_DESC=	Use the xdotool utility for auto-typing passwords
XSEL_DESC=	Use the xsel utility for clipboard copying

DEBUG_VARS=		config=Debug
DEBUG_VARS_OFF=		config=Release
XDOTOOL_RUN_DEPENDS=	xdotool:x11/xdotool
XSEL_RUN_DEPENDS=	xsel:x11/xsel-conrad

MAKE_ENV=	MONO_REGISTRY_PATH=${WRKDIR}

post-patch:
	${REINPLACE_CMD} -e 's|sed\ -i|sed\ -i\ \"\"|g' ${WRKSRC}/Build/PrepMonoDev.sh

do-build:
	# Extract icons
	(cd ${WRKSRC} && ${LOCALBASE}/bin/icotool -x KeePass/KeePass.ico)
	# Prepare build
	(cd ${WRKSRC}/Build && ${SH} PrepMonoDev.sh)
	# Do build
	(cd ${WRKSRC} && \
		${SETENV} ${MAKE_ENV} ${LOCALBASE}/bin/xbuild /t:KeePass /p:Configuration=${CONFIG})

do-install:
	@${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME}.sh ${STAGEDIR}${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/Build/KeePass/${CONFIG}/KeePass.exe ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/Ext/KeePass.config.xml ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/Ext/KeePass.exe.config ${STAGEDIR}${DATADIR}
	@(cd ${WRKSRC}/Ext && ${COPYTREE_SHARE} XSL ${STAGEDIR}${DATADIR})
.for size in 16 32 48 256
	@${MKDIR} ${FAKE_DESTDIR}${LOCALBASE}/share/icons/hicolor/${size}x${size}/apps
	${INSTALL_DATA} ${WRKSRC}/KeePass_*_${size}x${size}x32.png \
		${FAKE_DESTDIR}${LOCALBASE}/share/icons/hicolor/${size}x${size}/apps/keepass.png
.endfor

.include <bsd.port.mk>
