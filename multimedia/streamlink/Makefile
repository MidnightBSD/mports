PORTNAME=	streamlink
PORTVERSION=	1.7.0
CATEGORIES=	multimedia
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command-line utility that pipes video streams

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}isodate>0:devel/py-isodate@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pycryptodome>=3.4.3:security/py-pycryptodome@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pysocks>0:net/py-pysocks@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>0:www/py-requests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}websocket-client>0:www/py-websocket-client@${PY_FLAVOR}

USES=		python:3.7+
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes
NO_TEST=	yes

OPTIONS_DEFINE=		FFMPEG PYCOUNTRY RTMPDUMP
OPTIONS_DEFAULT=	FFMPEG RTMPDUMP
.if !exists(../../textproc/py-iso3166/Makefile)
OPTIONS_DEFAULT+=	PYCOUNTRY
.endif
PYCOUNTRY_DESC=		Use pycountry instead of py-iso-639 and py-iso3166

FFMPEG_RUN_DEPENDS=		ffmpeg:multimedia/ffmpeg
PYCOUNTRY_RUN_DEPENDS=		${PYTHON_PKGNAMEPREFIX}country>0:devel/py-country@${PY_FLAVOR}
PYCOUNTRY_RUN_DEPENDS_OFF=	${PYTHON_PKGNAMEPREFIX}iso-639>0:textproc/py-iso-639@${PY_FLAVOR} \
				${PYTHON_PKGNAMEPREFIX}iso3166>0:textproc/py-iso3166@${PY_FLAVOR}
PYCOUNTRY_MAKE_ENV=		STREAMLINK_USE_PYCOUNTRY=1
RTMPDUMP_RUN_DEPENDS=		rtmpdump:multimedia/rtmpdump

.include <bsd.port.mk>
