# $MidnightBSD: mports/x11-toolkits/Xaw3d/Makefile,v 1.10 2011/05/14 22:42:42 laffer1 Exp $

PORTNAME=	Xaw3d
PORTVERSION=	1.5E
PORTREVISION=	5
CATEGORIES=	x11-toolkits
MASTER_SITES=	ftp://ftp.visi.com/users/hawkeyd/X/ \
		ftp.slackware.com/pub/slackware/slackware_source/x/xaw3d/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	3-D Athena Widget set that looks like Motif
LICENSE=	mit

WRKSRC=		${WRKDIR}/xc/lib/Xaw3d
USE_GCC=	any
USE_IMAKE=	yes
USE_XORG=	x11 xext xmu xt sm ice xpm
USE_LDCONFIG=	yes

BUILD_DEPENDS+=	${LOCALBASE}/lib/X11/config/Imake.tmpl:${PORTSDIR}/x11/xorg-cf-files

SUB_FILES=	pkg-message
XAWVER=		8
SUB_LIST=	XAWVER="${XAWVER}"

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
PLIST_SUB+=	NLS="@comment "
.endif

post-extract:
	${MKDIR} ${WRKSRC}/X11/Xaw3d
	cd ${WRKSRC}/X11/Xaw3d; ${LN} -sf ../../*.h .
.if ! ${PORT_OPTIONS:MNLS}
	${REINPLACE_CMD} -e '/LINTLIBS =/s/=.*/=/' \
		-e '/#ifdef XawI18nDefines/s//#if 0/' \
		${WRKSRC}/Imakefile
.endif

post-install:
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.XAW3D ${DOCSDIR}/
.endif

.include <bsd.port.mk>
