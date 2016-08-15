# $MidnightBSD$

PORTNAME=	Xaw3d
PORTVERSION=	1.5E
PORTREVISION=	7
CATEGORIES=	x11-toolkits
MASTER_SITES=	http://slackware.cs.utah.edu/pub/slackware/slackware64-13.1/source/x/xaw3d/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	3-D Athena Widget set that looks like Motif

LICENSE=	mit

OPTIONS_DEFINE=	DOCS NLS
WRKSRC=		${WRKDIR}/xc/lib/Xaw3d
USES=		imake
USE_XORG=	x11 xext xmu xt sm ice xpm
USE_LDCONFIG=	yes

BUILD_DEPENDS+=	${LOCALBASE}/lib/X11/config/Imake.tmpl:${PORTSDIR}/x11/xorg-cf-files

SUB_FILES=	pkg-message
XAWVER=		8.0
SUB_LIST=	XAWVER="${XAWVER}"

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=	NLS=""
.else
PLIST_SUB+=	NLS="@comment "
.endif

post-extract:
	@${MKDIR} ${WRKSRC}/X11/Xaw3d
	@cd ${WRKSRC}/X11/Xaw3d; ${LN} -sf ../../*.h .
.if ! ${PORT_OPTIONS:MNLS}
	@${REINPLACE_CMD} -e '/LINTLIBS =/s/=.*/=/' \
		-e '/#ifdef XawI18nDefines/s//#if 0/' \
		${WRKSRC}/Imakefile
.endif

post-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.XAW3D ${DOCSDIR}/
	(cd ${PREFIX}/lib && ${LN} -sf libXaw3d.so.8 libXaw3d.so)

.include <bsd.port.mk>
