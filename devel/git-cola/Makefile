PORTNAME=	git-cola
DISTVERSIONPREFIX=	v
DISTVERSION=	4.1.0
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sleek and powerful Git GUI
WWW=		https://git-cola.github.io/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	git>=0:devel/git
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}QtPy>=1.7.1:devel/py-QtPy@${PY_FLAVOR}

USES=		desktop-file-utils gmake gnome pyqt:5 python qt:5 \
		shebangfix
USE_GITHUB=	yes
#USE_PYQT=	pyqt5
USE_PYTHON=	concurrent distutils

NO_ARCH=	yes

MAKE_ARGS=	prefix=${PREFIX} \
		PYTHON=${PYTHON_CMD}

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

NLS_USES=	gettext

post-install-DOCS-on:
		${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
		${INSTALL_DATA} ${WRKSRC}/docs/*.rst ${FAKE_DESTDIR}${DOCSDIR}
		${INSTALL_DATA} ${WRKSRC}/docs/*.html ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
