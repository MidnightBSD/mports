PORTNAME=	nexfontsel
PORTVERSION=	3.0.1
CATEGORIES=	x11-fonts
MASTER_SITES=	http://www.netlab.is.tsukuba.ac.jp/~yokota/archive/ \
		FREEBSD_LOCAL/pav
DISTNAME=	NeXFontSel-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	NeXtaw based replacement for xfontsel
WWW=		http://www.netlab.is.tsukuba.ac.jp/~yokota/izumi/nexfontsel/

LIB_DEPENDS=	libneXtaw.so:x11-toolkits/neXtaw

USES=		imake xorg
USE_XORG=	xaw

post-patch:
	@${REINPLACE_CMD} -e 's|^CDEBUG|XCOMM CDEBUG|g ; \
		s|= XawClientLibs|= -lneXtaw -lXmu -lXt -lX11|g' ${WRKSRC}/Imakefile

post-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/lib/X11/ja_JP.eucJP/app-defaults
	${INSTALL_DATA} ${WRKSRC}/NeXFontSel-ja.ad \
		${STAGEDIR}${PREFIX}/lib/X11/ja_JP.eucJP/app-defaults/NeXFontSel

.include <bsd.port.mk>
