PORTNAME=	gnome-shell-extension-lockkeys
PORTVERSION=	71
CATEGORIES=	deskutils gnome
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gnome-shell Numlock and Capslock indicator
WWW=		https://github.com/kazysmaster/gnome-shell-extension-lockkeys

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/lockkeys@vaina.lt/LICENSE

RUN_DEPENDS=	gnome-shell>=47.0:x11/gnome-shell \
		gsettings-desktop-schemas>0:devel/gsettings-desktop-schemas

USES=		gettext gnome
USE_GNOME=	glib20

NO_ARCH=	yes
NO_BUILD=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	kazysmaster
GH_TAGNAME=	d04fa71

UUID_EXTENSION=	lockkeys@vaina.lt

SUB_FILES=	pkg-message
SUB_LIST=	UUID=${UUID_EXTENSION}

GLIB_SCHEMAS=	org.gnome.shell.extensions.lockkeys.gschema.xml

pre-install:
	${MKDIR} ${PREFIX}/share/glib-2.0/schemas
	${MKDIR} ${PREFIX}/share/gnome-shell/extensions

do-install:
	${INSTALL_DATA} ${WRKSRC}/lockkeys\@vaina.lt/schemas/org.gnome.shell.extensions.lockkeys.gschema.xml \
		${PREFIX}/share/glib-2.0/schemas/
	${RM} -R ${WRKSRC}/lockkeys\@vaina.lt/schemas/
	cd ${WRKSRC} && ${COPYTREE_SHARE} lockkeys\@vaina.lt \
		${PREFIX}/share/gnome-shell/extensions/ \
		"! -name */schemas/*\.xml"

.include <bsd.port.mk>
