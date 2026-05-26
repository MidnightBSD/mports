PORTNAME=	orc
DISTVERSION=	0.4.42
CATEGORIES=	devel
MASTER_SITES=	https://gstreamer.freedesktop.org/data/src/orc/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library and toolset to operate arrays of data
WWW=		https://gstreamer.freedesktop.org/projects/orc.html

LICENSE=	bsd2 bsd3
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		meson pkgconfig tar:xz

MESON_ARGS=	--default-library=both \
		-Dbenchmarks=auto \
		-Dexamples=auto \
		-Dorc-target=all \
		-Dorc-test=auto \
		-Dtests=auto
MESON_DISABLED=	hotdoc
MESON_ENABLED=	tools

USE_LDCONFIG=	yes

PLIST_SUB+=	LIBMINORVER=${DISTVERSION:E}

.include <bsd.port.mk>
