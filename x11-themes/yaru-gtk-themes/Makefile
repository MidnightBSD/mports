# Created by: Alexander Vereeken <Alexander88207@protonmail.com>

PORTNAME=	yaru-gtk-themes
DISTVERSION=	21.10.1
CATEGORIES=	x11-themes

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Default GTK theme for Ubuntu

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	bash>0:shells/bash \
		coreutils>0:sysutils/coreutils \
		sassc:textproc/sassc
RUN_DEPENDS=	gtk-engines2>0:x11-themes/gtk-engines2 \
		gtk-murrine-engine>0:x11-themes/gtk-murrine-engine

USES=		gnome shebangfix meson python pkgconfig
USE_GNOME=	glib20:build
USE_GITHUB=	yes
GH_ACCOUNT=	ubuntu
GH_PROJECT=	yaru

NO_ARCH=	yes

BINARY_ALIAS=	realpath=grealpath

MESON_ARGS=	-Dicons=false \
		-Dsessions=false \
		-Dsounds=false

SHEBANG_LANG=	${PYTHON_CMD}
SHEBANG_FILES=	gnome-shell/copy-and-rename.py \
		gnome-shell/gresources-xml-parser.py \
		gtk/src/post_install.py \
		metacity/src/post_install.py

.include <bsd.port.mk>
