PORTNAME=	pyasn1-modules
PORTVERSION=	0.4.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of ASN.1 data structures for py-pyasn1
WWW=		https://github.com/etingof/pyasn1-modules

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyasn1>=0.4.6<0.7.0:devel/py-pyasn1@${PY_FLAVOR}

OPTIONS_DEFINE=	DOCS

NO_ARCH=	yes
USES=		python shebangfix
SHEBANG_FILES=	tools/*.py
USE_PYTHON=	allflavors autoplist concurrent pep517

PORTDOCS=	CHANGES.txt README.md
TOOLS=		cmcdump.py cmpdump.py crldump.py crmfdump.py ocspclient.py \
		ocspreqdump.py ocsprspdump.py pkcs10dump.py pkcs1dump.py \
		pkcs7dump.py pkcs8dump.py snmpget.py x509dump-rfc5280.py \
		x509dump.py

post-install:
	${INSTALL_SCRIPT} ${TOOLS:S|^|${WRKSRC}/tools/|} ${PREFIX}/bin
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}

.include <bsd.port.mk>
