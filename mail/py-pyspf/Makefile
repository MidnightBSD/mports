PORTNAME=	pyspf
PORTVERSION=	2.0.14
CATEGORIES=	mail python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SPF (Sender Policy Framework) implemented in Python
WWW=		https://github.com/sdgathman/pyspf

LICENSE=	python

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}authres>=0:mail/py-authres@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}dnspython>=1.16.0:dns/py-dnspython@${PY_FLAVOR}

USES=		python shebangfix
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes
NO_TEST=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

PLIST_FILES=	bin/spf.py
SHEBANG_FILES=	spf.py

# Make the tests run as a module
post-patch:
	@${TOUCH} ${WRKSRC}/test/__init__.py

post-install:
	${CHMOD} ${BINMODE} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/spf.py
	${RLN} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/spf.py ${STAGEDIR}${PREFIX}/bin/

.include <bsd.port.mk>
