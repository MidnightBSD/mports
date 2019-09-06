PORTNAME=	gstreamer1-editing-services
PORTVERSION=	1.14.4
CATEGORIES=	multimedia
MASTER_SITES=	http://gstreamer.freedesktop.org/src/gstreamer-editing-services/
DISTNAME=	gstreamer-editing-services-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GStreamer editing services

LICENSE=	lgpl

PORTSCOUT=	limitw:1,even

USES=		compiler:c11 gmake gnome libtool pathfix perl5 python:2.7 pkgconfig tar:xz
USE_LDCONFIG=	yes
USE_PERL5=	build
GNU_CONFIGURE=	yes
USE_GNOME=	glib20 introspection:build libxml2 pygobject3:build
USE_GSTREAMER1=	good
INSTALL_TARGET=	install-strip

CONFIGURE_ARGS=	--enable-introspection=yes \
		--with-bash-completion-dir=${PREFIX}/share/bash-completion/completions
PLIST_SUB=	VERSION=1.0 SOVERSION=0.1404.0
MAKE_ENV=	PYTHON=python${PYTHON_VER}

.include <bsd.port.mk>
