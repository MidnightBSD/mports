PORTNAME=		sonata
DISTVERSION=		1.7b1-22
DISTVERSIONSUFFIX=	-gcee3555
PORTREVISION=	1
CATEGORIES=		audio python
PKGNAMEPREFIX=		${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Elegant music player for MPD

LICENSE=	gpl3

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}python-mpd2>=0.4.6:audio/py-python-mpd2@${PY_FLAVOR}

USES=		gettext gnome pkgconfig python

USE_GITHUB=	yes
GH_ACCOUNT=	multani
USE_GNOME=	pygobject3
USE_PYTHON=	distutils autoplist

OPTIONS_DEFINE=	DOCS MMKEYS MPD TAGLIB
OPTIONS_DEFAULT=	MPD
MMKEYS_DESC=	Enable instance single support for mmkeys
MPD_DESC=	Install Music Player Daemon
TAGLIB_DESC=	Install support for editing metadata
OPTIONS_SUB=	yes

MPD_RUN_DEPENDS+=	musicpd:audio/musicpd
MMKEYS_RUN_DEPENDS=${PYTHON_PKGNAMEPREFIX}dbus>=0.82.4:devel/py-dbus@${FLAVOR}
TAGLIB_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}tagpy>=0.94.5:audio/py-tagpy@${FLAVOR}

.include <bsd.port.mk>
