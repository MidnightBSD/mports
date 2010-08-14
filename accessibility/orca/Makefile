# $MidnightBSD: mports/accessibility/orca/Makefile,v 1.6 2009/12/25 16:45:51 laffer1 Exp $

PORTNAME=	orca
PORTVERSION=	2.30.2
CATEGORIES=	accessibility gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Scriptable screen reader
LICENSE=	lgpl

BUILD_DEPENDS=	${PYTHON_SITELIBDIR}/_dbus_bindings.so:${PORTSDIR}/devel/py-dbus \
    		${PYTHON_SITELIBDIR}/pyatspi/__init__.py:${PORTSDIR}/accessibility/at-spi
LIB_DEPENDS=	gnome-mag.2:${PORTSDIR}/accessibility/gnome-mag
RUN_DEPENDS=	${PYTHON_SITELIBDIR}/_dbus_bindings.so:${PORTSDIR}/devel/py-dbus \
    		${PYTHON_SITELIBDIR}/pyatspi/__init__.py:${PORTSDIR}/accessibility/at-spi

LATEST_LINK=	gnome-orca

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_PYTHON=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack libgnomeui gnomespeech pygnome2 \
		pygnomedesktop
INSTALLS_ICONS=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		orca.1

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
		${WRKSRC}/src/orca/orca.in
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
	    	${WRKSRC}/src/orca/orca_i18n.py

.include <bsd.port.mk>
