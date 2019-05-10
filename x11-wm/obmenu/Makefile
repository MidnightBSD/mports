# $MidnightBSD$

PORTNAME=	obmenu
PORTVERSION=	1.0
PORTREVISION=	2
CATEGORIES=	x11-wm
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Menu manager for Openbox supporting both static and pipe menus

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		python:2.7 shebangfix
USE_GNOME=	pygtk2
USE_PYTHON=	distutils
PYDISTUTILS_PKGNAME=	obMenu
SHEBANG_FILES=	obmenu obxml.py pipes/obm-xdg
NO_ARCH=	yes

SUB_FILES=	pkg-message

PORTDOCS=	README

DESKTOP_ENTRIES="Obmenu" "Menu manager for Openbox" ${PORTNAME} \
		"${PORTNAME}" "Settings;" false

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e '/itm.nodeName.lower()/s|execute|command|; \
		/self.dom.createElement("execute")/s|execute|command|; \
		/xml.dom.minidom.Element("execute")/s|execute|command|; \
		/i.nodeName == "execute"/s|execute|command|' \
		${WRKSRC}/obxml.py
	@${REINPLACE_CMD} -e '/import/{p;s|.*|import signal|;}; \
		/os.kill/s|12)|signal.SIGUSR2)|' \
		${WRKSRC}/obmenu

post-install:
	${LN} -sf ${DATADIR}/mnu48.png \
		${STAGEDIR}${PREFIX}/share/pixmaps/${PORTNAME}.png

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
