# $MidnightBSD$

PORTNAME=	hamster-applet
PORTVERSION=	2.30.2
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Time management applet for the GNOME Desktop
LICENSE=	gpl3

BUILD_DEPENDS=	${PYTHON_SITELIBDIR}/_sqlite3.so:${PORTSDIR}/databases/py-sqlite3
RUN_DEPENDS=	${PYTHON_SITELIBDIR}/_sqlite3.so:${PORTSDIR}/databases/py-sqlite3 \
		${PYTHON_SITELIBDIR}/xdg/__init__.py:${PORTSDIR}/devel/py-xdg

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_PYTHON=	yes
USE_XORG=	xscrnsaver
USE_GNOME=	gnomeprefix intlhack gnomehack pygnomedesktop \
		gnomecontrolcenter2
GNU_CONFIGURE=	yes
INSTALLS_OMF=	yes
INSTALLS_ICONS=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
	       	LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	hamster-applet.schemas

.include <bsd.port.mk>
