PORTNAME=	impacket
PORTVERSION=	0.13.1
CATEGORIES=	net python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of Python classes providing access to network packets
WWW=		https://www.coresecurity.com/corelabs-research/open-source-tools/impacket

LICENSE=	Impacket zlib mit bsd2 Recomsvc
LICENSE_COMB=	multi
LICENSE_NAME_Impacket=	Impacket modified Apache License 1.1
LICENSE_NAME_Recomsvc=	Recomsvc notice license
LICENSE_FILE=	${WRKSRC}/LICENSE
LICENSE_PERMS_Impacket=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_PERMS_Recomsvc=	dist-mirror pkg-mirror auto-accept no-dist-sell no-pkg-sell

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyasn1-modules>0:devel/py-pyasn1-modules@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyasn1>=0.2.3:devel/py-pyasn1@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pycryptodomex>0:security/py-pycryptodomex@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyopenssl>0:security/py-pyopenssl@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>0:devel/py-six@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}ldap3>=2.6.1:net/py-ldap3@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}flask>=1.0:www/py-flask@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}charset-normalizer>0:textproc/py-charset-normalizer@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}ldapdomaindump>=0.9.0:net/py-ldapdomaindump@${PY_FLAVOR}

USES=		dos2unix python
USE_PYTHON=	autoplist concurrent distutils
NO_ARCH=	yes

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.md ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${COPYTREE_SHARE} tests ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
