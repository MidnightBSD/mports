PORTNAME=	desktop-file-utils
PORTVERSION=	0.28
CATEGORIES=	devel
MASTER_SITES=	http://freedesktop.org/software/${PORTNAME}/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Couple of command line utilities for working with desktop entries
WWW=		https://www.freedesktop.org/wiki/Software/desktop-file-utils/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		compiler:c11 gettext meson gnome pkgconfig tar:xz
USE_GNOME=	glib20

PKGINSTALL=	${WRKDIR}/pkg-install
PKGDEINSTALL=	${WRKDIR}/pkg-deinstall

PORT_MIMEDIRS=	${LOCALBASE}/share/applications

MIMEDIRS=	${PORT_MIMEDIRS}

SUB_FILES=	pkg-deinstall
SUB_LIST=	MIMEDIRS="${MIMEDIRS}"

post-install:
	${INSTALL_DATA} ${WRKSRC}/misc/desktop-entry-mode.el \
		${STAGEDIR}${PREFIX}/share/emacs/site-lisp/desktop-entry-mode.el

.include <bsd.port.mk>
