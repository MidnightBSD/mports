PORTNAME=	greenbone-feed-sync
DISTVERSION=	24.9.0
DISTVERSIONPREFIX=	v
CATEGORIES=	security python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	new script for downloading the Greenbone Community Feed
WWW=		https://github.com/greenbone/greenbone-feed-sync

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}poetry-core>0:devel/py-poetry-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}rich>=13.2.0:textproc/py-rich@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tomli>=2.0.1:textproc/py-tomli@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}shtab>=1.6.5:devel/py-shtab@${PY_FLAVOR} \
		rsync:net/rsync

USE_GITHUB=	yes
GH_ACCOUNT=	greenbone
GH_PROJECT=	${PORTNAME}

USES=		python
USE_PYTHON=	pep517

NO_ARCH=	yes

USERS=		gvm
GROUPS=		${USERS}

post-extract:
	${MV} ${WRKSRC}/tests ${WRKSRC}/greenbone/

post-patch:
	@${RM} ${WRKSRC}/greenbone/feed/sync/config.py.orig
	@${REINPLACE_CMD} -i "" -e 's|%%LOCALBASE%%|${LOCALBASE}|g' ${WRKSRC}/greenbone/feed/sync/config.py

post-install:
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/etc/gvm
	@${MKDIR} ${FAKE_DESTDIR}/var/lib/gvm
	@${MKDIR} ${FAKE_DESTDIR}/var/lib/openvas/plugins
	@${MKDIR} ${FAKE_DESTDIR}/var/lib/notus

.include <bsd.port.mk>
